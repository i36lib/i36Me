CREATE OR REPLACE PACKAGE CHX_FTP_UTL AS
  -- --------------------------------------------------------------------------
  -- Name         : http://www.oracle-base.com/dba/miscellaneous/ftp.pks
  -- Author       : Tim Hall
  -- Description  : Basic FTP API. For usage notes see:
  --                  http://www.oracle-base.com/articles/misc/ftp-from-plsql.php
  -- Requirements : UTL_TCP
  -- 
  -- Ammedments   : https://i36.Me/
  --   When         Who       What
  --   ===========  ========  =================================================
  --   14-AUG-2003  Tim Hall  Initial Creation
  --   10-MAR-2004  Tim Hall  Add convert_crlf procedure.
  --                          Make get_passive function visible.
  --                          Added get_direct and put_direct procedures.
  --   03-OCT-2006  Tim Hall  Add list, rename, delete, mkdir, rmdir procedures.
  --   15-Jan-2008  Tim Hall  login: Include timeout parameter (suggested by Dmitry Bogomolov).
  --   12-Jun-2008  Tim Hall  get_reply: Moved to pakage specification.
  --   22-Apr-2009  Tim Hall  nlst: Added to return list of file names only (suggested by Julian and John Duncan)
  -- --------------------------------------------------------------------------

  TYPE T_String_Table IS TABLE OF VARCHAR2(32767);
  TYPE Cux_Sanwen_Str_Split_Type IS TABLE OF VARCHAR2(32767);

  FUNCTION Login(P_Host    IN VARCHAR2,
                 P_Port    IN VARCHAR2,
                 P_User    IN VARCHAR2,
                 P_Pass    IN VARCHAR2,
                 P_Timeout IN NUMBER := NULL) RETURN Utl_Tcp.Connection;

  FUNCTION Get_Passive(P_Conn IN OUT NOCOPY Utl_Tcp.Connection)
    RETURN Utl_Tcp.Connection;

  PROCEDURE Logout(P_Conn  IN OUT NOCOPY Utl_Tcp.Connection,
                   P_Reply IN BOOLEAN := TRUE);

  PROCEDURE Send_Command(P_Conn    IN OUT NOCOPY Utl_Tcp.Connection,
                         P_Command IN VARCHAR2,
                         P_Reply   IN BOOLEAN := TRUE);

  PROCEDURE Get_Reply(P_Conn IN OUT NOCOPY Utl_Tcp.Connection);

  FUNCTION Get_Local_Ascii_Data(P_Dir  IN VARCHAR2,
                                P_File IN VARCHAR2) RETURN CLOB;

  FUNCTION Get_Local_Binary_Data(P_Dir  IN VARCHAR2,
                                 P_File IN VARCHAR2) RETURN BLOB;

  FUNCTION Get_Remote_Ascii_Data(P_Conn IN OUT NOCOPY Utl_Tcp.Connection,
                                 P_File IN VARCHAR2) RETURN CLOB;

  FUNCTION Get_Remote_Binary_Data(P_Conn IN OUT NOCOPY Utl_Tcp.Connection,
                                  P_File IN VARCHAR2) RETURN BLOB;

  PROCEDURE Put_Local_Ascii_Data(P_Data IN CLOB,
                                 P_Dir  IN VARCHAR2,
                                 P_File IN VARCHAR2);

  PROCEDURE Put_Local_Binary_Data(P_Data IN BLOB,
                                  P_Dir  IN VARCHAR2,
                                  P_File IN VARCHAR2);

  PROCEDURE Put_Remote_Ascii_Data(P_Conn IN OUT NOCOPY Utl_Tcp.Connection,
                                  P_File IN VARCHAR2,
                                  P_Data IN CLOB);

  PROCEDURE Put_Remote_Binary_Data(P_Conn IN OUT NOCOPY Utl_Tcp.Connection,
                                   P_File IN VARCHAR2,
                                   P_Data IN BLOB);

  PROCEDURE Get(P_Conn      IN OUT NOCOPY Utl_Tcp.Connection,
                P_From_File IN VARCHAR2,
                P_To_Dir    IN VARCHAR2,
                P_To_File   IN VARCHAR2);

  PROCEDURE Put(P_Conn      IN OUT NOCOPY Utl_Tcp.Connection,
                P_From_Dir  IN VARCHAR2,
                P_From_File IN VARCHAR2,
                P_To_File   IN VARCHAR2);

  PROCEDURE Get_Direct(P_Conn      IN OUT NOCOPY Utl_Tcp.Connection,
                       P_From_File IN VARCHAR2,
                       P_To_Dir    IN VARCHAR2,
                       P_To_File   IN VARCHAR2);

  PROCEDURE Put_Direct(P_Conn      IN OUT NOCOPY Utl_Tcp.Connection,
                       P_From_Dir  IN VARCHAR2,
                       P_From_File IN VARCHAR2,
                       P_To_File   IN VARCHAR2);

  PROCEDURE Help(P_Conn IN OUT NOCOPY Utl_Tcp.Connection);

  PROCEDURE Ascii(P_Conn IN OUT NOCOPY Utl_Tcp.Connection);

  PROCEDURE Binary(P_Conn IN OUT NOCOPY Utl_Tcp.Connection);

  PROCEDURE List(P_Conn IN OUT NOCOPY Utl_Tcp.Connection,
                 P_Dir  IN VARCHAR2,
                 P_List OUT T_String_Table);

  PROCEDURE Nlst(P_Conn IN OUT NOCOPY Utl_Tcp.Connection,
                 P_Dir  IN VARCHAR2,
                 P_List OUT T_String_Table);

  PROCEDURE Rename(P_Conn IN OUT NOCOPY Utl_Tcp.Connection,
                   P_From IN VARCHAR2,
                   P_To   IN VARCHAR2);

  PROCEDURE DELETE(P_Conn IN OUT NOCOPY Utl_Tcp.Connection,
                   P_File IN VARCHAR2);

  PROCEDURE Mkdir(P_Conn IN OUT NOCOPY Utl_Tcp.Connection,
                  P_Dir  IN VARCHAR2);

  PROCEDURE Rmdir(P_Conn IN OUT NOCOPY Utl_Tcp.Connection,
                  P_Dir  IN VARCHAR2);

  PROCEDURE Convert_Crlf(P_Status IN BOOLEAN);

END CHX_FTP_UTL;
/
CREATE OR REPLACE PACKAGE BODY CHX_FTP_UTL AS
  -- --------------------------------------------------------------------------
  -- Name         : http://www.oracle-base.com/dba/miscellaneous/ftp.pkb
  -- Author       : Tim Hall
  -- Description  : Basic FTP API. For usage notes see:
  --                  http://www.oracle-base.com/articles/misc/ftp-from-plsql.php
  -- Requirements : http://www.oracle-base.com/dba/miscellaneous/ftp.pks
  -- 
  -- Ammedments   : http://www.imchaser.com/  http://www.cangzhang.com/
  --   When         Who       What
  --   ===========  ========  =================================================
  --   14-AUG-2003  Tim Hall  Initial Creation
  --   10-MAR-2004  Tim Hall  Add convert_crlf procedure.
  --                          Incorporate CRLF conversion functionality into
  --                          put_local_ascii_data and put_remote_ascii_data
  --                          functions.
  --                          Make get_passive function visible.
  --                          Added get_direct and put_direct procedures.
  --   23-DEC-2004  Tim Hall  The get_reply procedure was altered to deal with
  --                          banners starting with 4 white spaces. This fix is
  --                          a small variation on the resolution provided by
  --                          Gary Mason who spotted the bug.
  --   10-NOV-2005  Tim Hall  Addition of get_reply after doing a transfer to
  --                          pickup the 226 Transfer complete message. This
  --                          allows gets and puts with a single connection.
  --                          Issue spotted by Trevor Woolnough.
  --   03-OCT-2006  Tim Hall  Add list, rename, delete, mkdir, rmdir procedures.
  --   12-JAN-2007  Tim Hall  A final call to get_reply was added to the get_remote%
  --                          procedures to allow multiple transfers per connection.
  --   15-Jan-2008  Tim Hall  login: Include timeout parameter (suggested by Dmitry Bogomolov).
  --   21-Jan-2008  Tim Hall  put_%: "l_pos < l_clob_len" to "l_pos <= l_clob_len" to prevent
  --                          potential loss of one character for single-byte files or files
  --                          sized 1 byte bigger than a number divisible by the buffer size
  --                          (spotted by Michael Surikov).
  --   23-Jan-2008  Tim Hall  send_command: Possible solution for ORA-29260 errors included,
  --                          but commented out (suggested by Kevin Phillips).
  --   12-Feb-2008  Tim Hall  put_local_binary_data and put_direct: Open file with "wb" for
  --                          binary writes (spotted by Dwayne Hoban).
  --   03-Mar-2008  Tim Hall  list: get_reply call and close of passive connection added
  --                          (suggested by Julian, Bavaria).
  --   12-Jun-2008  Tim Hall  A final call to get_reply was added to the put_remote%
  --                          procedures, but commented out. If uncommented, it may cause the
  --                          operation to hang, but it has been reported (morgul) to allow
  --                          multiple transfers per connection.
  --                          get_reply: Moved to pakage specification.
  --   24-Jun-2008  Tim Hall  get_remote% and put_remote%: Exception handler added to close the passive
  --                          connection and reraise the error (suggested by Mark Reichman).
  --   22-Apr-2009  Tim Hall  get_remote_ascii_data: Remove unnecessary logout (suggested by John Duncan).
  --                          get_reply and list: Handle 400 messages as well as 500 messages (suggested by John Duncan).
  --                          logout: Added a call to UTL_TCP.close_connection, so not necessary to close
  --                          any connections manually (suggested by Victor Munoz).
  --                          get_local_*_data: Check for zero length files to prevent exception (suggested by Daniel)
  --                          nlst: Added to return list of file names only (suggested by Julian and John Duncan)
  --   05-Apr-2011  Tim Hall  put_remote_ascii_data: Added comment on definition of l_amount. Switch to 10000 if you get
  --                          ORA-06502 from this line. May give you unexpected result due to conversion. Better to use binary.
  --   05-OCt-2013  Tim Hall  list, nlst: Fixed bug where files beginning with '4' or '5' could cause error.
  -- --------------------------------------------------------------------------

  G_Reply        T_String_Table := T_String_Table();
  G_Binary       BOOLEAN := TRUE;
  G_Debug        BOOLEAN := TRUE;
  G_Convert_Crlf BOOLEAN := TRUE;

  PROCEDURE Debug(P_Text IN VARCHAR2);

  -- --------------------------------------------------------------------------
  FUNCTION Login(P_Host    IN VARCHAR2,
                 P_Port    IN VARCHAR2,
                 P_User    IN VARCHAR2,
                 P_Pass    IN VARCHAR2,
                 P_Timeout IN NUMBER := NULL) RETURN Utl_Tcp.Connection IS
    -- --------------------------------------------------------------------------
    L_Conn Utl_Tcp.Connection;
  BEGIN
    G_Reply.Delete;
  
    L_Conn := Utl_Tcp.Open_Connection(P_Host,
                                      P_Port,
                                      Tx_Timeout => P_Timeout);
    Get_Reply(L_Conn);
    Send_Command(L_Conn, 'USER ' || P_User);
    Send_Command(L_Conn, 'PASS ' || P_Pass);
    RETURN L_Conn;
  END;
  -- --------------------------------------------------------------------------

  -- --------------------------------------------------------------------------
  FUNCTION Get_Passive(P_Conn IN OUT NOCOPY Utl_Tcp.Connection)
    RETURN Utl_Tcp.Connection IS
    -- --------------------------------------------------------------------------
    L_Conn  Utl_Tcp.Connection;
    L_Reply VARCHAR2(32767);
    L_Host  VARCHAR(100);
    L_Port1 NUMBER(10);
    L_Port2 NUMBER(10);
  BEGIN
    Send_Command(P_Conn, 'PASV');
    L_Reply := G_Reply(G_Reply.Last);
  
    L_Reply := REPLACE(Substr(L_Reply,
                              Instr(L_Reply, '(') + 1,
                              (Instr(L_Reply, ')')) - (Instr(L_Reply, '(')) - 1),
                       ',',
                       '.');
    L_Host  := Substr(L_Reply, 1, Instr(L_Reply, '.', 1, 4) - 1);
  
    L_Port1 := To_Number(Substr(L_Reply,
                                Instr(L_Reply, '.', 1, 4) + 1,
                                (Instr(L_Reply, '.', 1, 5) - 1) -
                                (Instr(L_Reply, '.', 1, 4))));
    L_Port2 := To_Number(Substr(L_Reply, Instr(L_Reply, '.', 1, 5) + 1));
  
    L_Conn := Utl_Tcp.Open_Connection(L_Host, 256 * L_Port1 + L_Port2);
    RETURN L_Conn;
  END;
  -- --------------------------------------------------------------------------

  -- --------------------------------------------------------------------------
  PROCEDURE Logout(P_Conn  IN OUT NOCOPY Utl_Tcp.Connection,
                   P_Reply IN BOOLEAN := TRUE) AS
    -- --------------------------------------------------------------------------
  BEGIN
    Send_Command(P_Conn, 'QUIT', P_Reply);
    Utl_Tcp.Close_Connection(P_Conn);
  END;
  -- --------------------------------------------------------------------------

  -- --------------------------------------------------------------------------
  PROCEDURE Send_Command(P_Conn    IN OUT NOCOPY Utl_Tcp.Connection,
                         P_Command IN VARCHAR2,
                         P_Reply   IN BOOLEAN := TRUE) IS
    -- --------------------------------------------------------------------------
    L_Result PLS_INTEGER;
  BEGIN
    L_Result := Utl_Tcp.Write_Line(P_Conn, P_Command);
    -- If you get ORA-29260 after the PASV call, replace the above line with the following line.
    -- l_result := UTL_TCP.write_text(p_conn, p_command || utl_tcp.crlf, length(p_command || utl_tcp.crlf));
  
    IF P_Reply THEN
      Get_Reply(P_Conn);
    END IF;
  END;
  -- --------------------------------------------------------------------------

  -- --------------------------------------------------------------------------
  PROCEDURE Get_Reply(P_Conn IN OUT NOCOPY Utl_Tcp.Connection) IS
    -- --------------------------------------------------------------------------
    L_Reply_Code VARCHAR2(3) := NULL;
  BEGIN
    LOOP
      G_Reply.Extend;
      G_Reply(G_Reply.Last) := Utl_Tcp.Get_Line(P_Conn, TRUE);
      Debug(G_Reply(G_Reply.Last));
      IF L_Reply_Code IS NULL THEN
        L_Reply_Code := Substr(G_Reply(G_Reply.Last), 1, 3);
      END IF;
      IF Substr(L_Reply_Code, 1, 1) IN ('4', '5') THEN
        Raise_Application_Error(-20000, G_Reply(G_Reply.Last));
      ELSIF (Substr(G_Reply(G_Reply.Last), 1, 3) = L_Reply_Code AND
            Substr(G_Reply(G_Reply.Last), 4, 1) = ' ') THEN
        EXIT;
      END IF;
    END LOOP;
  EXCEPTION
    WHEN Utl_Tcp.End_Of_Input THEN
      NULL;
  END;
  -- --------------------------------------------------------------------------

  -- --------------------------------------------------------------------------
  FUNCTION Get_Local_Ascii_Data(P_Dir  IN VARCHAR2,
                                P_File IN VARCHAR2) RETURN CLOB IS
    -- --------------------------------------------------------------------------
    L_Bfile BFILE;
    L_Data  CLOB;
  BEGIN
    Dbms_Lob.Createtemporary(Lob_Loc => L_Data,
                             Cache   => TRUE,
                             Dur     => Dbms_Lob.Call);
  
    L_Bfile := Bfilename(P_Dir, P_File);
    Dbms_Lob.Fileopen(L_Bfile, Dbms_Lob.File_Readonly);
  
    IF Dbms_Lob.Getlength(L_Bfile) > 0 THEN
      Dbms_Lob.Loadfromfile(L_Data, L_Bfile, Dbms_Lob.Getlength(L_Bfile));
    END IF;
  
    Dbms_Lob.Fileclose(L_Bfile);
  
    RETURN L_Data;
  END;
  -- --------------------------------------------------------------------------

  -- --------------------------------------------------------------------------
  FUNCTION Get_Local_Binary_Data(P_Dir  IN VARCHAR2,
                                 P_File IN VARCHAR2) RETURN BLOB IS
    -- --------------------------------------------------------------------------
    L_Bfile BFILE;
    L_Data  BLOB;
  BEGIN
    Dbms_Lob.Createtemporary(Lob_Loc => L_Data,
                             Cache   => TRUE,
                             Dur     => Dbms_Lob.Call);
  
    L_Bfile := Bfilename(P_Dir, P_File);
    Dbms_Lob.Fileopen(L_Bfile, Dbms_Lob.File_Readonly);
    IF Dbms_Lob.Getlength(L_Bfile) > 0 THEN
      Dbms_Lob.Loadfromfile(L_Data, L_Bfile, Dbms_Lob.Getlength(L_Bfile));
    END IF;
    Dbms_Lob.Fileclose(L_Bfile);
  
    RETURN L_Data;
  END;
  -- --------------------------------------------------------------------------

  -- --------------------------------------------------------------------------
  FUNCTION Get_Remote_Ascii_Data(P_Conn IN OUT NOCOPY Utl_Tcp.Connection,
                                 P_File IN VARCHAR2) RETURN CLOB IS
    -- --------------------------------------------------------------------------
    L_Conn   Utl_Tcp.Connection;
    L_Amount PLS_INTEGER;
    L_Buffer VARCHAR2(32767);
    L_Data   CLOB;
  BEGIN
    Dbms_Lob.Createtemporary(Lob_Loc => L_Data,
                             Cache   => TRUE,
                             Dur     => Dbms_Lob.Call);
  
    L_Conn := Get_Passive(P_Conn);
    Send_Command(P_Conn, 'RETR ' || P_File, TRUE);
    --logout(l_conn, FALSE);
  
    BEGIN
      LOOP
        L_Amount := Utl_Tcp.Read_Text(L_Conn, L_Buffer, 32767);
        Dbms_Lob.Writeappend(L_Data, L_Amount, L_Buffer);
      END LOOP;
    EXCEPTION
      WHEN Utl_Tcp.End_Of_Input THEN
        NULL;
      WHEN OTHERS THEN
        NULL;
    END;
    Utl_Tcp.Close_Connection(L_Conn);
    Get_Reply(P_Conn);
  
    RETURN L_Data;
  
  EXCEPTION
    WHEN OTHERS THEN
      Utl_Tcp.Close_Connection(L_Conn);
      RAISE;
  END;
  -- --------------------------------------------------------------------------

  -- --------------------------------------------------------------------------
  FUNCTION Get_Remote_Binary_Data(P_Conn IN OUT NOCOPY Utl_Tcp.Connection,
                                  P_File IN VARCHAR2) RETURN BLOB IS
    -- --------------------------------------------------------------------------
    L_Conn   Utl_Tcp.Connection;
    L_Amount PLS_INTEGER;
    L_Buffer RAW(32767);
    L_Data   BLOB;
  BEGIN
    Dbms_Lob.Createtemporary(Lob_Loc => L_Data,
                             Cache   => TRUE,
                             Dur     => Dbms_Lob.Call);
  
    L_Conn := Get_Passive(P_Conn);
    Send_Command(P_Conn, 'RETR ' || P_File, TRUE);
  
    BEGIN
      LOOP
        L_Amount := Utl_Tcp.Read_Raw(L_Conn, L_Buffer, 32767);
        Dbms_Lob.Writeappend(L_Data, L_Amount, L_Buffer);
      END LOOP;
    EXCEPTION
      WHEN Utl_Tcp.End_Of_Input THEN
        NULL;
      WHEN OTHERS THEN
        NULL;
    END;
    Utl_Tcp.Close_Connection(L_Conn);
    Get_Reply(P_Conn);
  
    RETURN L_Data;
  
  EXCEPTION
    WHEN OTHERS THEN
      Utl_Tcp.Close_Connection(L_Conn);
      RAISE;
  END;
  -- --------------------------------------------------------------------------

  -- --------------------------------------------------------------------------
  PROCEDURE Put_Local_Ascii_Data(P_Data IN CLOB,
                                 P_Dir  IN VARCHAR2,
                                 P_File IN VARCHAR2) IS
    -- --------------------------------------------------------------------------
    L_Out_File Utl_File.File_Type;
    L_Buffer   VARCHAR2(32767);
    L_Amount   BINARY_INTEGER := 32767;
    L_Pos      INTEGER := 1;
    L_Clob_Len INTEGER;
  BEGIN
    L_Clob_Len := Dbms_Lob.Getlength(P_Data);
  
    L_Out_File := Utl_File.Fopen(P_Dir, P_File, 'w', 32767);
  
    WHILE L_Pos <= L_Clob_Len LOOP
      Dbms_Lob.Read(P_Data, L_Amount, L_Pos, L_Buffer);
      IF G_Convert_Crlf THEN
        L_Buffer := REPLACE(L_Buffer, Chr(13), NULL);
      END IF;
    
      Utl_File.Put(L_Out_File, L_Buffer);
      Utl_File.Fflush(L_Out_File);
      L_Pos := L_Pos + L_Amount;
    END LOOP;
  
    Utl_File.Fclose(L_Out_File);
  EXCEPTION
    WHEN OTHERS THEN
      IF Utl_File.Is_Open(L_Out_File) THEN
        Utl_File.Fclose(L_Out_File);
      END IF;
      RAISE;
  END;
  -- --------------------------------------------------------------------------

  -- --------------------------------------------------------------------------
  PROCEDURE Put_Local_Binary_Data(P_Data IN BLOB,
                                  P_Dir  IN VARCHAR2,
                                  P_File IN VARCHAR2) IS
    -- --------------------------------------------------------------------------
    L_Out_File Utl_File.File_Type;
    L_Buffer   RAW(32767);
    L_Amount   BINARY_INTEGER := 32767;
    L_Pos      INTEGER := 1;
    L_Blob_Len INTEGER;
  BEGIN
    L_Blob_Len := Dbms_Lob.Getlength(P_Data);
  
    L_Out_File := Utl_File.Fopen(P_Dir, P_File, 'wb', 32767);
  
    WHILE L_Pos <= L_Blob_Len LOOP
      Dbms_Lob.Read(P_Data, L_Amount, L_Pos, L_Buffer);
      Utl_File.Put_Raw(L_Out_File, L_Buffer, TRUE);
      Utl_File.Fflush(L_Out_File);
      L_Pos := L_Pos + L_Amount;
    END LOOP;
  
    Utl_File.Fclose(L_Out_File);
  EXCEPTION
    WHEN OTHERS THEN
      IF Utl_File.Is_Open(L_Out_File) THEN
        Utl_File.Fclose(L_Out_File);
      END IF;
      RAISE;
  END;
  -- --------------------------------------------------------------------------

  -- --------------------------------------------------------------------------
  PROCEDURE Put_Remote_Ascii_Data(P_Conn IN OUT NOCOPY Utl_Tcp.Connection,
                                  P_File IN VARCHAR2,
                                  P_Data IN CLOB) IS
    -- --------------------------------------------------------------------------
    L_Conn     Utl_Tcp.Connection;
    L_Result   PLS_INTEGER;
    L_Buffer   VARCHAR2(32767);
    L_Amount   BINARY_INTEGER := 32767; -- Switch to 10000 (or use binary) if you get ORA-06502 from this line.
    L_Pos      INTEGER := 1;
    L_Clob_Len INTEGER;
  BEGIN
    L_Conn := Get_Passive(P_Conn);
    Send_Command(P_Conn, 'STOR ' || P_File, TRUE);
  
    L_Clob_Len := Dbms_Lob.Getlength(P_Data);
  
    WHILE L_Pos <= L_Clob_Len LOOP
      Dbms_Lob.Read(P_Data, L_Amount, L_Pos, L_Buffer);
      IF G_Convert_Crlf THEN
        L_Buffer := REPLACE(L_Buffer, Chr(13), NULL);
      END IF;
      L_Result := Utl_Tcp.Write_Text(L_Conn, L_Buffer, Length(L_Buffer));
      Utl_Tcp.Flush(L_Conn);
      L_Pos := L_Pos + L_Amount;
    END LOOP;
  
    Utl_Tcp.Close_Connection(L_Conn);
    -- The following line allows some people to make multiple calls from one connection.
    -- It causes the operation to hang for me, hence it is commented out by default.
    -- get_reply(p_conn);
  
  EXCEPTION
    WHEN OTHERS THEN
      Utl_Tcp.Close_Connection(L_Conn);
      RAISE;
  END;
  -- --------------------------------------------------------------------------

  -- --------------------------------------------------------------------------
  PROCEDURE Put_Remote_Binary_Data(P_Conn IN OUT NOCOPY Utl_Tcp.Connection,
                                   P_File IN VARCHAR2,
                                   P_Data IN BLOB) IS
    -- --------------------------------------------------------------------------
    L_Conn     Utl_Tcp.Connection;
    L_Result   PLS_INTEGER;
    L_Buffer   RAW(32767);
    L_Amount   BINARY_INTEGER := 32767;
    L_Pos      INTEGER := 1;
    L_Blob_Len INTEGER;
  BEGIN
    L_Conn := Get_Passive(P_Conn);
    Send_Command(P_Conn, 'STOR ' || P_File, TRUE);
  
    L_Blob_Len := Dbms_Lob.Getlength(P_Data);
  
    WHILE L_Pos <= L_Blob_Len LOOP
      Dbms_Lob.Read(P_Data, L_Amount, L_Pos, L_Buffer);
      L_Result := Utl_Tcp.Write_Raw(L_Conn, L_Buffer, L_Amount);
      Utl_Tcp.Flush(L_Conn);
      L_Pos := L_Pos + L_Amount;
    END LOOP;
  
    Utl_Tcp.Close_Connection(L_Conn);
    -- The following line allows some people to make multiple calls from one connection.
    -- It causes the operation to hang for me, hence it is commented out by default.
    -- get_reply(p_conn);
  
  EXCEPTION
    WHEN OTHERS THEN
      Utl_Tcp.Close_Connection(L_Conn);
      RAISE;
  END;
  -- --------------------------------------------------------------------------

  -- --------------------------------------------------------------------------
  PROCEDURE Get(P_Conn      IN OUT NOCOPY Utl_Tcp.Connection,
                P_From_File IN VARCHAR2,
                P_To_Dir    IN VARCHAR2,
                P_To_File   IN VARCHAR2) AS
    -- --------------------------------------------------------------------------
  BEGIN
    IF G_Binary THEN
      Put_Local_Binary_Data(P_Data => Get_Remote_Binary_Data(P_Conn,
                                                             P_From_File),
                            P_Dir  => P_To_Dir,
                            P_File => P_To_File);
    ELSE
      Put_Local_Ascii_Data(P_Data => Get_Remote_Ascii_Data(P_Conn,
                                                           P_From_File),
                           P_Dir  => P_To_Dir,
                           P_File => P_To_File);
    END IF;
  END;
  -- --------------------------------------------------------------------------

  -- --------------------------------------------------------------------------
  PROCEDURE Put(P_Conn      IN OUT NOCOPY Utl_Tcp.Connection,
                P_From_Dir  IN VARCHAR2,
                P_From_File IN VARCHAR2,
                P_To_File   IN VARCHAR2) AS
    -- --------------------------------------------------------------------------
  BEGIN
    IF G_Binary THEN
      Put_Remote_Binary_Data(P_Conn => P_Conn,
                             P_File => P_To_File,
                             P_Data => Get_Local_Binary_Data(P_From_Dir,
                                                             P_From_File));
    ELSE
      Put_Remote_Ascii_Data(P_Conn => P_Conn,
                            P_File => P_To_File,
                            P_Data => Get_Local_Ascii_Data(P_From_Dir,
                                                           P_From_File));
    END IF;
    Get_Reply(P_Conn);
  END;
  -- --------------------------------------------------------------------------

  -- --------------------------------------------------------------------------
  PROCEDURE Get_Direct(P_Conn      IN OUT NOCOPY Utl_Tcp.Connection,
                       P_From_File IN VARCHAR2,
                       P_To_Dir    IN VARCHAR2,
                       P_To_File   IN VARCHAR2) IS
    -- --------------------------------------------------------------------------
    L_Conn       Utl_Tcp.Connection;
    L_Out_File   Utl_File.File_Type;
    L_Amount     PLS_INTEGER;
    L_Buffer     VARCHAR2(32767);
    L_Raw_Buffer RAW(32767);
  BEGIN
    L_Conn := Get_Passive(P_Conn);
    Send_Command(P_Conn, 'RETR ' || P_From_File, TRUE);
    IF G_Binary THEN
      L_Out_File := Utl_File.Fopen(P_To_Dir, P_To_File, 'wb', 32767);
    ELSE
      L_Out_File := Utl_File.Fopen(P_To_Dir, P_To_File, 'w', 32767);
    END IF;
  
    BEGIN
      LOOP
        IF G_Binary THEN
          L_Amount := Utl_Tcp.Read_Raw(L_Conn, L_Raw_Buffer, 32767);
          Utl_File.Put_Raw(L_Out_File, L_Raw_Buffer, TRUE);
        ELSE
          L_Amount := Utl_Tcp.Read_Text(L_Conn, L_Buffer, 32767);
          IF G_Convert_Crlf THEN
            L_Buffer := REPLACE(L_Buffer, Chr(13), NULL);
          END IF;
          Utl_File.Put(L_Out_File, L_Buffer);
        END IF;
        Utl_File.Fflush(L_Out_File);
      END LOOP;
    EXCEPTION
      WHEN Utl_Tcp.End_Of_Input THEN
        NULL;
      WHEN OTHERS THEN
        NULL;
    END;
    Utl_File.Fclose(L_Out_File);
    Utl_Tcp.Close_Connection(L_Conn);
  EXCEPTION
    WHEN OTHERS THEN
      IF Utl_File.Is_Open(L_Out_File) THEN
        Utl_File.Fclose(L_Out_File);
      END IF;
      RAISE;
  END;
  -- --------------------------------------------------------------------------

  -- --------------------------------------------------------------------------
  PROCEDURE Put_Direct(P_Conn      IN OUT NOCOPY Utl_Tcp.Connection,
                       P_From_Dir  IN VARCHAR2,
                       P_From_File IN VARCHAR2,
                       P_To_File   IN VARCHAR2) IS
    -- --------------------------------------------------------------------------
    L_Conn       Utl_Tcp.Connection;
    L_Bfile      BFILE;
    L_Result     PLS_INTEGER;
    L_Amount     PLS_INTEGER := 32767;
    L_Raw_Buffer RAW(32767);
    L_Len        NUMBER;
    L_Pos        NUMBER := 1;
    Ex_Ascii EXCEPTION;
  BEGIN
    IF NOT G_Binary THEN
      RAISE Ex_Ascii;
    END IF;
  
    L_Conn := Get_Passive(P_Conn);
    Send_Command(P_Conn, 'STOR ' || P_To_File, TRUE);
  
    L_Bfile := Bfilename(P_From_Dir, P_From_File);
  
    Dbms_Lob.Fileopen(L_Bfile, Dbms_Lob.File_Readonly);
    L_Len := Dbms_Lob.Getlength(L_Bfile);
  
    WHILE L_Pos <= L_Len LOOP
      Dbms_Lob.Read(L_Bfile, L_Amount, L_Pos, L_Raw_Buffer);
      Debug(L_Amount);
      L_Result := Utl_Tcp.Write_Raw(L_Conn, L_Raw_Buffer, L_Amount);
      L_Pos    := L_Pos + L_Amount;
    END LOOP;
  
    Dbms_Lob.Fileclose(L_Bfile);
    Utl_Tcp.Close_Connection(L_Conn);
  EXCEPTION
    WHEN Ex_Ascii THEN
      Raise_Application_Error(-20000,
                              'PUT_DIRECT not available in ASCII mode.');
    WHEN OTHERS THEN
      IF Dbms_Lob.Fileisopen(L_Bfile) = 1 THEN
        Dbms_Lob.Fileclose(L_Bfile);
      END IF;
      RAISE;
  END;
  -- --------------------------------------------------------------------------

  -- --------------------------------------------------------------------------
  PROCEDURE Help(P_Conn IN OUT NOCOPY Utl_Tcp.Connection) AS
    -- --------------------------------------------------------------------------
  BEGIN
    Send_Command(P_Conn, 'HELP', TRUE);
  END;
  -- --------------------------------------------------------------------------

  -- --------------------------------------------------------------------------
  PROCEDURE Ascii(P_Conn IN OUT NOCOPY Utl_Tcp.Connection) AS
    -- --------------------------------------------------------------------------
  BEGIN
    Send_Command(P_Conn, 'TYPE A', TRUE);
    G_Binary := FALSE;
  END;
  -- --------------------------------------------------------------------------

  -- --------------------------------------------------------------------------
  PROCEDURE Binary(P_Conn IN OUT NOCOPY Utl_Tcp.Connection) AS
    -- --------------------------------------------------------------------------
  BEGIN
    Send_Command(P_Conn, 'TYPE I', TRUE);
    G_Binary := TRUE;
  END;
  -- --------------------------------------------------------------------------

  -- --------------------------------------------------------------------------
  PROCEDURE List(P_Conn IN OUT NOCOPY Utl_Tcp.Connection,
                 P_Dir  IN VARCHAR2,
                 P_List OUT T_String_Table) AS
    -- --------------------------------------------------------------------------
    L_Conn       Utl_Tcp.Connection;
    L_List       T_String_Table := T_String_Table();
    L_Reply_Code VARCHAR2(3) := NULL;
  BEGIN
    L_Conn := Get_Passive(P_Conn);
    Send_Command(P_Conn, 'LIST ' || P_Dir, TRUE);
  
    BEGIN
      LOOP
        L_List.Extend;
        L_List(L_List.Last) := Utl_Tcp.Get_Line(L_Conn, TRUE);
        Debug(L_List(L_List.Last));
        IF L_Reply_Code IS NULL THEN
          L_Reply_Code := Substr(L_List(L_List.Last), 1, 3);
        END IF;
        IF (Substr(L_Reply_Code, 1, 1) IN ('4', '5') AND
           Substr(L_Reply_Code, 4, 1) = ' ') THEN
          Raise_Application_Error(-20000, L_List(L_List.Last));
        ELSIF (Substr(G_Reply(G_Reply.Last), 1, 3) = L_Reply_Code AND
              Substr(G_Reply(G_Reply.Last), 4, 1) = ' ') THEN
          EXIT;
        END IF;
      END LOOP;
    EXCEPTION
      WHEN Utl_Tcp.End_Of_Input THEN
        NULL;
    END;
  
    L_List.Delete(L_List.Last);
    P_List := L_List;
  
    Utl_Tcp.Close_Connection(L_Conn);
    Get_Reply(P_Conn);
  END;
  -- --------------------------------------------------------------------------

  -- --------------------------------------------------------------------------
  PROCEDURE Nlst(P_Conn IN OUT NOCOPY Utl_Tcp.Connection,
                 P_Dir  IN VARCHAR2,
                 P_List OUT T_String_Table) AS
    -- --------------------------------------------------------------------------
    L_Conn       Utl_Tcp.Connection;
    L_List       T_String_Table := T_String_Table();
    L_Reply_Code VARCHAR2(3) := NULL;
  BEGIN
    L_Conn := Get_Passive(P_Conn);
    Send_Command(P_Conn, 'NLST ' || P_Dir, TRUE);
  
    BEGIN
      LOOP
        L_List.Extend;
        L_List(L_List.Last) := Utl_Tcp.Get_Line(L_Conn, TRUE);
        Debug(L_List(L_List.Last));
        IF L_Reply_Code IS NULL THEN
          L_Reply_Code := Substr(L_List(L_List.Last), 1, 3);
        END IF;
        IF (Substr(L_Reply_Code, 1, 1) IN ('4', '5') AND
           Substr(L_Reply_Code, 4, 1) = ' ') THEN
          Raise_Application_Error(-20000, L_List(L_List.Last));
        ELSIF (Substr(G_Reply(G_Reply.Last), 1, 3) = L_Reply_Code AND
              Substr(G_Reply(G_Reply.Last), 4, 1) = ' ') THEN
          EXIT;
        END IF;
      END LOOP;
    EXCEPTION
      WHEN Utl_Tcp.End_Of_Input THEN
        NULL;
    END;
  
    L_List.Delete(L_List.Last);
    P_List := L_List;
  
    Utl_Tcp.Close_Connection(L_Conn);
    Get_Reply(P_Conn);
  END;
  -- --------------------------------------------------------------------------

  -- --------------------------------------------------------------------------
  PROCEDURE Rename(P_Conn IN OUT NOCOPY Utl_Tcp.Connection,
                   P_From IN VARCHAR2,
                   P_To   IN VARCHAR2) AS
    -- --------------------------------------------------------------------------
    L_Conn Utl_Tcp.Connection;
  BEGIN
    L_Conn := Get_Passive(P_Conn);
    Send_Command(P_Conn, 'RNFR ' || P_From, TRUE);
    Send_Command(P_Conn, 'RNTO ' || P_To, TRUE);
    Logout(L_Conn, FALSE);
  END Rename;
  -- --------------------------------------------------------------------------

  -- --------------------------------------------------------------------------
  PROCEDURE DELETE(P_Conn IN OUT NOCOPY Utl_Tcp.Connection,
                   P_File IN VARCHAR2) AS
    -- --------------------------------------------------------------------------
    L_Conn Utl_Tcp.Connection;
  BEGIN
    L_Conn := Get_Passive(P_Conn);
    Send_Command(P_Conn, 'DELE ' || P_File, TRUE);
    Logout(L_Conn, FALSE);
  END DELETE;
  -- --------------------------------------------------------------------------

  -- --------------------------------------------------------------------------
  PROCEDURE Mkdir(P_Conn IN OUT NOCOPY Utl_Tcp.Connection,
                  P_Dir  IN VARCHAR2) AS
    -- --------------------------------------------------------------------------
    L_Conn Utl_Tcp.Connection;
  BEGIN
    L_Conn := Get_Passive(P_Conn);
    Send_Command(P_Conn, 'MKD ' || P_Dir, TRUE);
    Logout(L_Conn, FALSE);
  END Mkdir;
  -- --------------------------------------------------------------------------

  -- --------------------------------------------------------------------------
  PROCEDURE Rmdir(P_Conn IN OUT NOCOPY Utl_Tcp.Connection,
                  P_Dir  IN VARCHAR2) AS
    -- --------------------------------------------------------------------------
    L_Conn Utl_Tcp.Connection;
  BEGIN
    L_Conn := Get_Passive(P_Conn);
    Send_Command(P_Conn, 'RMD ' || P_Dir, TRUE);
    Logout(L_Conn, FALSE);
  END Rmdir;
  -- --------------------------------------------------------------------------

  -- --------------------------------------------------------------------------
  PROCEDURE Convert_Crlf(P_Status IN BOOLEAN) AS
    -- --------------------------------------------------------------------------
  BEGIN
    G_Convert_Crlf := P_Status;
  END;
  -- --------------------------------------------------------------------------

  -- --------------------------------------------------------------------------
  PROCEDURE Debug(P_Text IN VARCHAR2) IS
    -- --------------------------------------------------------------------------
  BEGIN
    IF G_Debug THEN
      Dbms_Output.Put_Line(Substr(P_Text, 1, 255));
    END IF;
  END;
  -- --------------------------------------------------------------------------

END CHX_FTP_UTL;
/
