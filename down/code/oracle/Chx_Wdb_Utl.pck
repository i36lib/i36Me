CREATE OR REPLACE PACKAGE Chx_Wdb_Utl IS
  --------------------------------------------------------
  -- Copyright (C) www.imchaser.com AllRights Reserved
  --
  -- Created : 2013/10/17 14:17:10 by Debao.Wu
  -- Purpose : Oracle Erp Coding Api.
  -- Contact : Chaser.YNU(at)Gmail.Com
  -- Author  : https://i36.Me/
  --
  -- ���������Oracle EBS R12/11i ������ʹ��,Ϊ���������
  --------------------------------------------------------

  --------------------------------------------------------
  -- Author: Debao.Wu
  -- Html Script Output Test
  -- ���Cux_Html_Buffer��,�����õ�HTML��������
  -- Cux_Html_Buffer��,Ȼ��Ӵ˴�����HTML�����
  -- HTML�ű�,���ַ�ʽ����HTML����ģ��Ҫ���ٺܶ�.
  -- @P_Buffer_Package_Name: Buffer�����������
  -- @P_Buffer_Start_Line_Qty: ��Buffer������дӵڼ��п�ʼ
  -- @P_Buffer_End_Line_Qty: ��Buffer��������е����ڼ��н���
  -- @P_Out_Script_Function: �������HTML�ű��ĺ�������,һ��ΪOut_Msg
  --------------------------------------------------------
  PROCEDURE Html_Output_Tester(P_Buffer_Package_Name   IN VARCHAR2 DEFAULT Upper('Cux_Html_Buffer'),
                               P_Buffer_Start_Line_Qty IN NUMBER DEFAULT 6,
                               P_Buffer_End_Line_Qty   IN NUMBER DEFAULT 3,
                               P_Out_Script_Function   IN VARCHAR2 DEFAULT 'Out_Msg');

END Chx_Wdb_Utl;
/
CREATE OR REPLACE PACKAGE BODY Chx_Wdb_Utl IS
  --------------------------------------------------------
  -- Copyright (C) www.imchaser.com AllRights Reserved
  --
  -- Created : 2013/10/17 14:17:10 by Debao.Wu
  -- Purpose : Oracle Erp Coding Api.
  -- Contact : Chaser.YNU(at)Gmail.Com
  -- Author  : http://www.imchaser.com/
  --
  -- ���������Oracle EBS R12/11i ������ʹ��,Ϊ���������
  --------------------------------------------------------

  --------------------------------------------------------
  -- Author: Debao.Wu
  -- Html Script Output Test
  -- ���Cux_Html_Buffer��,�����õ�HTML��������
  -- Cux_Html_Buffer��,Ȼ��Ӵ˴�����HTML�����
  -- HTML�ű�,���ַ�ʽ����HTML����ģ��Ҫ���ٺܶ�.
  -- @P_Buffer_Package_Name: Buffer�����������
  -- @P_Buffer_Start_Line_Qty: ��Buffer������дӵڼ��п�ʼ
  -- @P_Buffer_End_Line_Qty: ��Buffer��������е����ڼ��н���
  -- @P_Out_Script_Function: �������HTML�ű��ĺ�������,һ��ΪOut_Msg
  --------------------------------------------------------
  PROCEDURE Html_Output_Tester(P_Buffer_Package_Name   IN VARCHAR2 DEFAULT Upper('Cux_Html_Buffer'),
                               P_Buffer_Start_Line_Qty IN NUMBER DEFAULT 6,
                               P_Buffer_End_Line_Qty   IN NUMBER DEFAULT 3,
                               P_Out_Script_Function   IN VARCHAR2 DEFAULT 'Out_Msg') IS
    CURSOR Cur_Resp(C_Len IN NUMBER) IS
      SELECT REPLACE(T.Text, Chr(13), '') Text
        FROM All_Source t
       WHERE T.Name = Upper(P_Buffer_Package_Name) -- Upper('Cux_Html_Buffer')
         AND T.Type = 'PACKAGE BODY'
         AND T.Line BETWEEN P_Buffer_Start_Line_Qty AND
             C_Len - P_Buffer_End_Line_Qty;
    --AND T.Line BETWEEN 6 AND C_Len - 3;
  
    X_Len NUMBER;
  BEGIN
    SELECT COUNT(T.Line)
      INTO X_Len
      FROM All_Source t
     WHERE T.Name = Upper(P_Buffer_Package_Name) -- Upper('Cux_Html_Buffer')
       AND T.Type = 'PACKAGE BODY';
  
    FOR Rec IN Cur_Resp(X_Len) LOOP
      Dbms_Output.Put_Line(P_Out_Script_Function || '(''' ||
                           REPLACE(Rec.Text, Chr(10), '') || ''');');
    END LOOP;
  
  EXCEPTION
    WHEN OTHERS THEN
      Dbms_Output.Put_Line('Error: ' || SQLERRM);
  END Html_Output_Tester; --//End of Procedure.
END Chx_Wdb_Utl;
/
