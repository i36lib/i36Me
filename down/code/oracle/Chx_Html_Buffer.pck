CREATE OR REPLACE PACKAGE Chx_Html_Buffer IS
  PROCEDURE Html;
END Chx_Html_Buffer;
/
CREATE OR REPLACE PACKAGE BODY Chx_Html_Buffer IS
  PROCEDURE Html IS
    Html VARCHAR2(5000);
  BEGIN
    Html :=  /*---------------------Start of Html Scripts---------------------------------------*/
     '
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Title</title>
<style id="CSS_Styles">
<!--table
  {mso-displayed-decimal-separator:"\.";
  mso-displayed-thousand-separator:"\,";}
.font512900
  {color:windowtext;
  font-size:9.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;}
.font612900
  {color:windowtext;
  font-size:9.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;}
.font712900
  {color:black;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;}
.font812900
  {color:windowtext;
  font-size:6.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:"�ͣ� �Х����å�", sans-serif;
  mso-font-charset:128;}
.font912900
  {color:black;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;}
.xl33912900
  {padding:0px;
  mso-ignore:padding;
  color:windowtext;
  font-size:12.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:General;
  text-align:general;
  vertical-align:middle;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl34012900
  {padding:0px;
  mso-ignore:padding;
  color:windowtext;
  font-size:12.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:Arial, sans-serif;
  mso-font-charset:0;
  mso-number-format:General;
  text-align:general;
  vertical-align:middle;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl34112900
  {padding:0px;
  mso-ignore:padding;
  color:windowtext;
  font-size:12.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:Arial, sans-serif;
  mso-font-charset:0;
  mso-number-format:"\#\,\#\#0\.00_ ";
  text-align:general;
  vertical-align:middle;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl34212900
  {padding:0px;
  mso-ignore:padding;
  color:windowtext;
  font-size:12.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:Arial, sans-serif;
  mso-font-charset:0;
  mso-number-format:General;
  text-align:121;
  vertical-align:middle;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl34312900
  {padding:0px;
  mso-ignore:padding;
  color:windowtext;
  font-size:12.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:Arial, sans-serif;
  mso-font-charset:0;
  mso-number-format:"_ * \#\,\#\#0\.00_ \;_ * \\-\#\,\#\#0\.00_ \;_ * \0022-\0022??_ \;_ \@_ ";
  text-align:121;
  vertical-align:middle;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl34412900
  {padding:0px;
  mso-ignore:padding;
  color:windowtext;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:General;
  text-align:general;
  vertical-align:middle;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl34512900
  {padding:0px;
  mso-ignore:padding;
  color:windowtext;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:"\#\,\#\#0\.00_ ";
  text-align:general;
  vertical-align:middle;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl34612900
  {padding:0px;
  mso-ignore:padding;
  color:windowtext;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:"_ * \#\,\#\#0\.00_ \;_ * \\-\#\,\#\#0\.00_ \;_ * \0022-\0022??_ \;_ \@_ ";
  text-align:general;
  vertical-align:middle;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl34712900
  {padding:0px;
  mso-ignore:padding;
  color:blue;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:General;
  text-align:center-across;
  vertical-align:bottom;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl34812900
  {padding:0px;
  mso-ignore:padding;
  color:blue;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:"\#\,\#\#0\.00_ ";
  text-align:center-across;
  vertical-align:bottom;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl34912900
  {padding:0px;
  mso-ignore:padding;
  color:windowtext;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:General;
  text-align:center;
  vertical-align:middle;
  border-top:1.0pt solid windowtext;
  border-right:.5pt solid windowtext;
  border-bottom:none;
  border-left:.5pt solid windowtext;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl35012900
  {padding:0px;
  mso-ignore:padding;
  color:blue;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:"\#\,\#\#0\.00\;\[Red\]\\-\#\,\#\#0\.00";
  text-align:general;
  vertical-align:top;
  border-top:1.0pt solid windowtext;
  border-right:none;
  border-bottom:none;
  border-left:none;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl35112900
  {padding:0px;
  mso-ignore:padding;
  color:windowtext;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:General;
  text-align:center;
  vertical-align:middle;
  border:.5pt solid windowtext;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl35212900
  {padding:0px;
  mso-ignore:padding;
  color:windowtext;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:"_ * \#\,\#\#0\.00_ \;_ * \\-\#\,\#\#0\.00_ \;_ * \0022-\0022??_ \;_ \@_ ";
  text-align:center;
  vertical-align:middle;
  border:.5pt solid windowtext;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl35312900
  {padding:0px;
  mso-ignore:padding;
  color:windowtext;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:"_ * \#\,\#\#0\.00_ \;_ * \\-\#\,\#\#0\.00_ \;_ * \0022-\0022??_ \;_ \@_ ";
  text-align:center;
  vertical-align:middle;
  border-top:none;
  border-right:.5pt solid windowtext;
  border-bottom:none;
  border-left:.5pt solid windowtext;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl35412900
  {padding:0px;
  mso-ignore:padding;
  color:blue;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:"\#\,\#\#0\.00\;\[Red\]\\-\#\,\#\#0\.00";
  text-align:general;
  vertical-align:top;
  border-top:none;
  border-right:none;
  border-bottom:.5pt solid windowtext;
  border-left:none;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl35512900
  {padding:0px;
  mso-ignore:padding;
  color:black;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:Arial, sans-serif;
  mso-font-charset:0;
  mso-number-format:Standard;
  text-align:general;
  vertical-align:middle;
  border:.5pt solid windowtext;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl35612900
  {padding:0px;
  mso-ignore:padding;
  color:black;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:Arial, sans-serif;
  mso-font-charset:0;
  mso-number-format:General;
  text-align:general;
  vertical-align:middle;
  border:.5pt solid windowtext;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl35712900
  {padding:0px;
  mso-ignore:padding;
  color:windowtext;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:"\#\,\#\#0\.00_ ";
  text-align:general;
  vertical-align:middle;
  border-top:none;
  border-right:.5pt solid windowtext;
  border-bottom:none;
  border-left:.5pt solid windowtext;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl35812900
  {padding:0px;
  mso-ignore:padding;
  color:black;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:"\#\,\#\#0\.00\;\[Red\]\\-\#\,\#\#0\.00";
  text-align:general;
  vertical-align:middle;
  border-top:none;
  border-right:none;
  border-bottom:none;
  border-left:1.0pt solid windowtext;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl35912900
  {padding:0px;
  mso-ignore:padding;
  color:black;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:"\#\,\#\#0\.00\;\[Red\]\\-\#\,\#\#0\.00";
  text-align:general;
  vertical-align:middle;
  border-top:none;
  border-right:.5pt solid windowtext;
  border-bottom:none;
  border-left:none;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl36012900
  {padding:0px;
  mso-ignore:padding;
  color:windowtext;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:General;
  text-align:general;
  vertical-align:middle;
  border-top:.5pt solid windowtext;
  border-right:none;
  border-bottom:.5pt solid windowtext;
  border-left:.5pt solid windowtext;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl36112900
  {padding:0px;
  mso-ignore:padding;
  color:black;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:"\#\,\#\#0\.00_ ";
  text-align:general;
  vertical-align:bottom;
  border:.5pt solid windowtext;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl36212900
  {padding:0px;
  mso-ignore:padding;
  color:black;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:"\#\,\#\#0\.00\;\[Red\]\\-\#\,\#\#0\.00";
  text-align:left;
  vertical-align:bottom;
  border-top:none;
  border-right:.5pt solid windowtext;
  border-bottom:none;
  border-left:none;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl36312900
  {padding:0px;
  mso-ignore:padding;
  color:black;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:"\#\,\#\#0\.00\;\[Red\]\\-\#\,\#\#0\.00";
  text-align:general;
  vertical-align:middle;
  border-top:none;
  border-right:none;
  border-bottom:.5pt solid windowtext;
  border-left:1.0pt solid windowtext;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl36412900
  {padding:0px;
  mso-ignore:padding;
  color:windowtext;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:General;
  text-align:general;
  vertical-align:middle;
  border-top:none;
  border-right:.5pt solid windowtext;
  border-bottom:.5pt solid windowtext;
  border-left:none;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl36512900
  {padding:0px;
  mso-ignore:padding;
  color:black;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:General;
  text-align:general;
  vertical-align:middle;
  border-top:none;
  border-right:none;
  border-bottom:none;
  border-left:1.0pt solid windowtext;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl36612900
  {padding:0px;
  mso-ignore:padding;
  color:windowtext;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:General;
  text-align:general;
  vertical-align:middle;
  border-top:none;
  border-right:.5pt solid windowtext;
  border-bottom:none;
  border-left:none;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl36712900
  {padding:0px;
  mso-ignore:padding;
  color:windowtext;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:"\#\,\#\#0\.00_ ";
  text-align:general;
  vertical-align:middle;
  border:.5pt solid windowtext;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl36812900
  {padding:0px;
  mso-ignore:padding;
  color:black;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:"\#\,\#\#0\.00\;\[Red\]\\-\#\,\#\#0\.00";
  text-align:general;
  vertical-align:middle;
  border-top:none;
  border-right:none;
  border-bottom:none;
  border-left:.5pt solid windowtext;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl36912900
  {padding:0px;
  mso-ignore:padding;
  color:windowtext;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:"\#\,\#\#0\.00_ ";
  text-align:general;
  vertical-align:middle;
  border-top:none;
  border-right:.5pt solid windowtext;
  border-bottom:.5pt solid windowtext;
  border-left:none;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl37012900
  {padding:0px;
  mso-ignore:padding;
  color:black;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:"\#\,\#\#0\.00\;\[Red\]\\-\#\,\#\#0\.00";
  text-align:general;
  vertical-align:middle;
  border-top:none;
  border-right:.5pt solid windowtext;
  border-bottom:none;
  border-left:1.0pt solid windowtext;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl37112900
  {padding:0px;
  mso-ignore:padding;
  color:black;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:"\#\,\#\#0\.00\;\[Red\]\\-\#\,\#\#0\.00";
  text-align:general;
  vertical-align:middle;
  border-top:none;
  border-right:.5pt solid windowtext;
  border-bottom:.5pt solid windowtext;
  border-left:.5pt solid windowtext;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl37212900
  {padding:0px;
  mso-ignore:padding;
  color:black;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:"\#\,\#\#0\.00\;\[Red\]\\-\#\,\#\#0\.00";
  text-align:center-across;
  vertical-align:bottom;
  border-top:none;
  border-right:.5pt solid windowtext;
  border-bottom:none;
  border-left:.5pt solid windowtext;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl37312900
  {padding:0px;
  mso-ignore:padding;
  color:black;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:"\#\,\#\#0\.00_ ";
  text-align:general;
  vertical-align:middle;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl37412900
  {padding:0px;
  mso-ignore:padding;
  color:black;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:"\#\,\#\#0\.00_ ";
  text-align:general;
  vertical-align:middle;
  border-top:none;
  border-right:.5pt solid windowtext;
  border-bottom:none;
  border-left:none;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl37512900
  {padding:0px;
  mso-ignore:padding;
  color:black;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:"\#\,\#\#0\.00\;\[Red\]\\-\#\,\#\#0\.00";
  text-align:general;
  vertical-align:middle;
  border-top:none;
  border-right:.5pt solid windowtext;
  border-bottom:.5pt solid windowtext;
  border-left:1.0pt solid windowtext;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl37612900
  {padding:0px;
  mso-ignore:padding;
  color:windowtext;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:"\#\,\#\#0\.00_ ";
  text-align:general;
  vertical-align:middle;
  border-top:none;
  border-right:.5pt solid windowtext;
  border-bottom:none;
  border-left:.5pt solid windowtext;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl37712900
  {padding:0px;
  mso-ignore:padding;
  color:black;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:"\#\,\#\#0\.00_ ";
  text-align:general;
  vertical-align:middle;
  border-top:none;
  border-right:.5pt solid windowtext;
  border-bottom:.5pt solid windowtext;
  border-left:none;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl37812900
  {padding:0px;
  mso-ignore:padding;
  color:black;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:Arial, sans-serif;
  mso-font-charset:0;
  mso-number-format:Standard;
  text-align:general;
  vertical-align:middle;
  border-top:.5pt solid windowtext;
  border-right:.5pt solid windowtext;
  border-bottom:1.0pt solid windowtext;
  border-left:.5pt solid windowtext;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl37912900
  {padding:0px;
  mso-ignore:padding;
  color:black;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:Arial, sans-serif;
  mso-font-charset:0;
  mso-number-format:General;
  text-align:general;
  vertical-align:middle;
  border-top:.5pt solid windowtext;
  border-right:.5pt solid windowtext;
  border-bottom:1.0pt solid windowtext;
  border-left:.5pt solid windowtext;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl38012900
  {padding:0px;
  mso-ignore:padding;
  color:windowtext;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:"\#\,\#\#0\.00_ ";
  text-align:general;
  vertical-align:middle;
  border-top:none;
  border-right:.5pt solid windowtext;
  border-bottom:1.0pt solid windowtext;
  border-left:.5pt solid windowtext;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl38112900
  {padding:0px;
  mso-ignore:padding;
  color:black;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:"\#\,\#\#0\.00_ ";
  text-align:general;
  vertical-align:middle;
  border-top:.5pt solid windowtext;
  border-right:none;
  border-bottom:1.0pt solid windowtext;
  border-left:none;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl38212900
  {padding:0px;
  mso-ignore:padding;
  color:windowtext;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:"\#\,\#\#0\.00_ ";
  text-align:general;
  vertical-align:middle;
  border-top:.5pt solid windowtext;
  border-right:.5pt solid windowtext;
  border-bottom:1.0pt solid windowtext;
  border-left:none;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl38312900
  {padding:0px;
  mso-ignore:padding;
  color:green;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:"\#\,\#\#0\.00\;\[Red\]\\-\#\,\#\#0\.00";
  text-align:general;
  vertical-align:middle;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl38412900
  {padding:0px;
  mso-ignore:padding;
  color:windowtext;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:"\#\,\#\#0\.00\;\[Red\]\\-\#\,\#\#0\.00";
  text-align:general;
  vertical-align:middle;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl38512900
  {padding:0px;
  mso-ignore:padding;
  color:windowtext;
  font-size:12.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:Arial, sans-serif;
  mso-font-charset:0;
  mso-number-format:General;
  text-align:general;
  vertical-align:middle;
  background:white;
  mso-pattern:black none;
  white-space:nowrap;}
.xl38612900
  {padding:0px;
  mso-ignore:padding;
  color:windowtext;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:General;
  text-align:general;
  vertical-align:middle;
  background:white;
  mso-pattern:black none;
  white-space:nowrap;}
.xl38712900
  {padding:0px;
  mso-ignore:padding;
  color:windowtext;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:General;
  text-align:right;
  vertical-align:middle;
  background:white;
  mso-pattern:black none;
  white-space:nowrap;}
.xl38812900
  {padding:0px;
  mso-ignore:padding;
  color:windowtext;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:General;
  text-align:center;
  vertical-align:middle;
  border:.5pt solid windowtext;
  background:white;
  mso-pattern:black none;
  white-space:nowrap;}
.xl38912900
  {padding:0px;
  mso-ignore:padding;
  color:windowtext;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:"_ * \#\,\#\#0\.00_ \;_ * \\-\#\,\#\#0\.00_ \;_ * \0022-\0022??_ \;_ \@_ ";
  text-align:center;
  vertical-align:middle;
  border:.5pt solid windowtext;
  background:white;
  mso-pattern:black none;
  white-space:nowrap;}
.xl39012900
  {padding:0px;
  mso-ignore:padding;
  color:windowtext;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:"_ * \#\,\#\#0\.00_ \;_ * \\-\#\,\#\#0\.00_ \;_ * \0022-\0022??_ \;_ \@_ ";
  text-align:center;
  vertical-align:middle;
  border-top:.5pt solid windowtext;
  border-right:1.0pt solid windowtext;
  border-bottom:.5pt solid windowtext;
  border-left:.5pt solid windowtext;
  background:white;
  mso-pattern:black none;
  white-space:nowrap;}
.xl39112900
  {padding:0px;
  mso-ignore:padding;
  color:black;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:Arial, sans-serif;
  mso-font-charset:0;
  mso-number-format:Standard;
  text-align:general;
  vertical-align:middle;
  border:.5pt solid windowtext;
  background:white;
  mso-pattern:black none;
  white-space:nowrap;}
.xl39212900
  {padding:0px;
  mso-ignore:padding;
  color:black;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:Arial, sans-serif;
  mso-font-charset:0;
  mso-number-format:General;
  text-align:general;
  vertical-align:middle;
  border:.5pt solid windowtext;
  background:white;
  mso-pattern:black none;
  white-space:nowrap;}
.xl39312900
  {padding:0px;
  mso-ignore:padding;
  color:black;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:Arial, sans-serif;
  mso-font-charset:0;
  mso-number-format:General;
  text-align:general;
  vertical-align:middle;
  border-top:.5pt solid windowtext;
  border-right:1.0pt solid windowtext;
  border-bottom:.5pt solid windowtext;
  border-left:.5pt solid windowtext;
  background:white;
  mso-pattern:black none;
  white-space:nowrap;}
.xl39412900
  {padding:0px;
  mso-ignore:padding;
  color:black;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:Arial, sans-serif;
  mso-font-charset:0;
  mso-number-format:Standard;
  text-align:general;
  vertical-align:middle;
  border-top:.5pt solid windowtext;
  border-right:.5pt solid windowtext;
  border-bottom:1.0pt solid windowtext;
  border-left:.5pt solid windowtext;
  background:white;
  mso-pattern:black none;
  white-space:nowrap;}
.xl39512900
  {padding:0px;
  mso-ignore:padding;
  color:black;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:Arial, sans-serif;
  mso-font-charset:0;
  mso-number-format:General;
  text-align:general;
  vertical-align:middle;
  border-top:.5pt solid windowtext;
  border-right:.5pt solid windowtext;
  border-bottom:1.0pt solid windowtext;
  border-left:.5pt solid windowtext;
  background:white;
  mso-pattern:black none;
  white-space:nowrap;}
.xl39612900
  {padding:0px;
  mso-ignore:padding;
  color:black;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:Arial, sans-serif;
  mso-font-charset:0;
  mso-number-format:General;
  text-align:general;
  vertical-align:middle;
  border-top:.5pt solid windowtext;
  border-right:1.0pt solid windowtext;
  border-bottom:1.0pt solid windowtext;
  border-left:.5pt solid windowtext;
  background:white;
  mso-pattern:black none;
  white-space:nowrap;}
.xl39712900
  {padding:0px;
  mso-ignore:padding;
  color:windowtext;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:"_ * \#\,\#\#0\.00_ \;_ * \\-\#\,\#\#0\.00_ \;_ * \0022-\0022??_ \;_ \@_ ";
  text-align:general;
  vertical-align:middle;
  background:white;
  mso-pattern:black none;
  white-space:nowrap;}
.xl39812900
  {padding:0px;
  mso-ignore:padding;
  color:black;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:Standard;
  text-align:general;
  vertical-align:middle;
  border:.5pt solid windowtext;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl39912900
  {padding:0px;
  mso-ignore:padding;
  color:black;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:Standard;
  text-align:general;
  vertical-align:middle;
  border:.5pt solid windowtext;
  background:white;
  mso-pattern:black none;
  white-space:nowrap;}
.xl40012900
  {padding:0px;
  mso-ignore:padding;
  color:windowtext;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:General;
  text-align:center;
  vertical-align:middle;
  border-top:1.0pt solid windowtext;
  border-right:none;
  border-bottom:.5pt solid windowtext;
  border-left:.5pt solid windowtext;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl40112900
  {padding:0px;
  mso-ignore:padding;
  color:windowtext;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:General;
  text-align:center;
  vertical-align:middle;
  border-top:1.0pt solid windowtext;
  border-right:none;
  border-bottom:.5pt solid windowtext;
  border-left:none;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl40212900
  {padding:0px;
  mso-ignore:padding;
  color:windowtext;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:General;
  text-align:center;
  vertical-align:middle;
  border-top:1.0pt solid windowtext;
  border-right:.5pt solid windowtext;
  border-bottom:.5pt solid windowtext;
  border-left:none;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl40312900
  {padding:0px;
  mso-ignore:padding;
  color:windowtext;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:General;
  text-align:general;
  vertical-align:middle;
  border-top:.5pt solid windowtext;
  border-right:none;
  border-bottom:1.0pt solid windowtext;
  border-left:1.0pt solid windowtext;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl40412900
  {padding:0px;
  mso-ignore:padding;
  color:windowtext;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:General;
  text-align:general;
  vertical-align:middle;
  border-top:.5pt solid windowtext;
  border-right:none;
  border-bottom:1.0pt solid windowtext;
  border-left:none;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl40512900
  {padding:0px;
  mso-ignore:padding;
  color:windowtext;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:General;
  text-align:center;
  vertical-align:middle;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl40612900
  {padding:0px;
  mso-ignore:padding;
  color:windowtext;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:General;
  text-align:center;
  vertical-align:middle;
  border-top:1.0pt solid windowtext;
  border-right:none;
  border-bottom:none;
  border-left:1.0pt solid windowtext;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl40712900
  {padding:0px;
  mso-ignore:padding;
  color:windowtext;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:General;
  text-align:center;
  vertical-align:middle;
  border-top:1.0pt solid windowtext;
  border-right:none;
  border-bottom:none;
  border-left:none;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl40812900
  {padding:0px;
  mso-ignore:padding;
  color:windowtext;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:General;
  text-align:center;
  vertical-align:middle;
  border-top:1.0pt solid windowtext;
  border-right:.5pt solid windowtext;
  border-bottom:none;
  border-left:none;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl40912900
  {padding:0px;
  mso-ignore:padding;
  color:windowtext;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:General;
  text-align:center;
  vertical-align:middle;
  border-top:none;
  border-right:none;
  border-bottom:.5pt solid windowtext;
  border-left:1.0pt solid windowtext;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl41012900
  {padding:0px;
  mso-ignore:padding;
  color:windowtext;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:General;
  text-align:center;
  vertical-align:middle;
  border-top:none;
  border-right:none;
  border-bottom:.5pt solid windowtext;
  border-left:none;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl41112900
  {padding:0px;
  mso-ignore:padding;
  color:windowtext;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:General;
  text-align:center;
  vertical-align:middle;
  border-top:none;
  border-right:.5pt solid windowtext;
  border-bottom:.5pt solid windowtext;
  border-left:none;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl41212900
  {padding:0px;
  mso-ignore:padding;
  color:windowtext;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:General;
  text-align:center;
  vertical-align:middle;
  border-top:1.0pt solid windowtext;
  border-right:none;
  border-bottom:.5pt solid windowtext;
  border-left:.5pt solid windowtext;
  background:white;
  mso-pattern:black none;
  white-space:nowrap;}
.xl41312900
  {padding:0px;
  mso-ignore:padding;
  color:windowtext;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:General;
  text-align:center;
  vertical-align:middle;
  border-top:1.0pt solid windowtext;
  border-right:none;
  border-bottom:.5pt solid windowtext;
  border-left:none;
  background:white;
  mso-pattern:black none;
  white-space:nowrap;}
.xl41412900
  {padding:0px;
  mso-ignore:padding;
  color:windowtext;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:General;
  text-align:center;
  vertical-align:middle;
  border-top:1.0pt solid windowtext;
  border-right:.5pt solid windowtext;
  border-bottom:.5pt solid windowtext;
  border-left:none;
  background:white;
  mso-pattern:black none;
  white-space:nowrap;}
.xl41512900
  {padding:0px;
  mso-ignore:padding;
  color:windowtext;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:General;
  text-align:center;
  vertical-align:middle;
  border-top:1.0pt solid windowtext;
  border-right:1.0pt solid windowtext;
  border-bottom:.5pt solid windowtext;
  border-left:none;
  background:white;
  mso-pattern:black none;
  white-space:nowrap;}
.xl41612900
  {padding:0px;
  mso-ignore:padding;
  color:black;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:"\#\,\#\#0\.00_ ";
  text-align:left;
  vertical-align:middle;
  border-top:.5pt solid windowtext;
  border-right:none;
  border-bottom:none;
  border-left:.5pt solid windowtext;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl41712900
  {padding:0px;
  mso-ignore:padding;
  color:black;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:"\#\,\#\#0\.00_ ";
  text-align:left;
  vertical-align:middle;
  border-top:.5pt solid windowtext;
  border-right:.5pt solid windowtext;
  border-bottom:none;
  border-left:none;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl41812900
  {padding:0px;
  mso-ignore:padding;
  color:windowtext;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:General;
  text-align:left;
  vertical-align:middle;
  border-top:.5pt solid windowtext;
  border-right:none;
  border-bottom:none;
  border-left:1.0pt solid windowtext;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl41912900
  {padding:0px;
  mso-ignore:padding;
  color:windowtext;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:General;
  text-align:left;
  vertical-align:middle;
  border-top:.5pt solid windowtext;
  border-right:none;
  border-bottom:none;
  border-left:none;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl42012900
  {padding:0px;
  mso-ignore:padding;
  color:windowtext;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:General;
  text-align:left;
  vertical-align:middle;
  border-top:.5pt solid windowtext;
  border-right:.5pt solid windowtext;
  border-bottom:none;
  border-left:none;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl42112900
  {padding:0px;
  mso-ignore:padding;
  color:black;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:"\#\,\#\#0\.00\;\[Red\]\\-\#\,\#\#0\.00";
  text-align:left;
  vertical-align:middle;
  border-top:.5pt solid windowtext;
  border-right:none;
  border-bottom:none;
  border-left:1.0pt solid windowtext;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl42212900
  {padding:0px;
  mso-ignore:padding;
  color:black;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:"\#\,\#\#0\.00\;\[Red\]\\-\#\,\#\#0\.00";
  text-align:left;
  vertical-align:middle;
  border-top:.5pt solid windowtext;
  border-right:none;
  border-bottom:none;
  border-left:none;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl42312900
  {padding:0px;
  mso-ignore:padding;
  color:black;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:"\#\,\#\#0\.00\;\[Red\]\\-\#\,\#\#0\.00";
  text-align:left;
  vertical-align:middle;
  border-top:.5pt solid windowtext;
  border-right:.5pt solid windowtext;
  border-bottom:none;
  border-left:none;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl42412900
  {padding:0px;
  mso-ignore:padding;
  color:black;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:"\#\,\#\#0\.00\;\[Red\]\\-\#\,\#\#0\.00";
  text-align:left;
  vertical-align:middle;
  border-top:.5pt solid windowtext;
  border-right:none;
  border-bottom:.5pt solid windowtext;
  border-left:1.0pt solid windowtext;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl42512900
  {padding:0px;
  mso-ignore:padding;
  color:black;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:"\#\,\#\#0\.00\;\[Red\]\\-\#\,\#\#0\.00";
  text-align:left;
  vertical-align:middle;
  border-top:.5pt solid windowtext;
  border-right:none;
  border-bottom:.5pt solid windowtext;
  border-left:none;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl42612900
  {padding:0px;
  mso-ignore:padding;
  color:black;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:"\#\,\#\#0\.00\;\[Red\]\\-\#\,\#\#0\.00";
  text-align:left;
  vertical-align:middle;
  border-top:.5pt solid windowtext;
  border-right:.5pt solid windowtext;
  border-bottom:.5pt solid windowtext;
  border-left:none;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl42712900
  {padding:0px;
  mso-ignore:padding;
  color:windowtext;
  font-size:12.0pt;
  font-weight:700;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:General;
  text-align:center;
  vertical-align:middle;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl42812900
  {padding:0px;
  mso-ignore:padding;
  color:windowtext;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:General;
  text-align:left;
  vertical-align:middle;
  border-top:none;
  border-right:none;
  border-bottom:.5pt solid windowtext;
  border-left:.5pt solid windowtext;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl42912900
  {padding:0px;
  mso-ignore:padding;
  color:windowtext;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:General;
  text-align:left;
  vertical-align:middle;
  border-top:none;
  border-right:.5pt solid windowtext;
  border-bottom:.5pt solid windowtext;
  border-left:none;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl43012900
  {padding:0px;
  mso-ignore:padding;
  color:windowtext;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:General;
  text-align:left;
  vertical-align:middle;
  border-top:.5pt solid windowtext;
  border-right:none;
  border-bottom:none;
  border-left:.5pt solid windowtext;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
.xl43112900
  {padding:0px;
  mso-ignore:padding;
  color:windowtext;
  font-size:10.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-number-format:General;
  text-align:general;
  vertical-align:middle;
  border-top:.5pt solid windowtext;
  border-right:.5pt solid windowtext;
  border-bottom:1.0pt solid windowtext;
  border-left:none;
  mso-background-source:auto;
  mso-pattern:auto;
  white-space:nowrap;}
ruby
  {ruby-align:left;}
rt
  {color:windowtext;
  font-size:9.0pt;
  font-weight:400;
  font-style:normal;
  text-decoration:none;
  font-family:����;
  mso-generic-font-family:auto;
  mso-font-charset:134;
  mso-char-type:none;}
-->
</style>
</head>

<body>
<div id="CSS_Styles" align=center>

<table border=0 cellpadding=0 cellspacing=0 width=1295 class=xl34412900
 style="border-collapse:collapse;table-layout:fixed;width:974pt">
 <col class=xl34412900 width=14 style="mso-width-source:userset;mso-width-alt:
 448;width:11pt">
 <col class=xl34412900 width=10 style="mso-width-source:userset;mso-width-alt:
 320;width:8pt">
 <col class=xl34412900 width=187 style="mso-width-source:userset;mso-width-alt:
 5984;width:140pt">
 <col class=xl34412900 width=111 style="mso-width-source:userset;mso-width-alt:
 3552;width:83pt">
 <col class=xl34612900 width=60 style="mso-width-source:userset;mso-width-alt:
 1920;width:45pt">
 <col class=xl34412900 width=73 style="mso-width-source:userset;mso-width-alt:
 2336;width:55pt">
 <col class=xl34412900 width=102 style="mso-width-source:userset;mso-width-alt:
 3264;width:77pt">
 <col class=xl34412900 width=55 style="mso-width-source:userset;mso-width-alt:
 1760;width:41pt">
 <col class=xl34412900 width=12 style="mso-width-source:userset;mso-width-alt:
 384;width:9pt">
 <col class=xl38412900 width=18 style="mso-width-source:userset;mso-width-alt:
 576;width:14pt">
 <col class=xl38412900 width=161 style="mso-width-source:userset;mso-width-alt:
 5152;width:121pt">
 <col class=xl34412900 width=98 style="mso-width-source:userset;mso-width-alt:
 3136;width:74pt">
 <col class=xl34412900 width=55 style="mso-width-source:userset;mso-width-alt:
 1760;width:41pt">
 <col class=xl34412900 width=103 style="mso-width-source:userset;mso-width-alt:
 3296;width:77pt">
 <col class=xl34412900 width=98 style="mso-width-source:userset;mso-width-alt:
 3136;width:74pt">
 <col class=xl34412900 width=66 style="mso-width-source:userset;mso-width-alt:
 2112;width:50pt">
 <col class=xl33912900 width=72 style="width:54pt">
 <tr class=xl34012900 height=21 style="mso-height-source:userset;height:15.75pt">
  <td height=21 class=xl34012900 width=14 style="height:15.75pt;width:11pt">&nbsp;</td>
  <td class=xl34012900 width=10 style="width:8pt"></td>
  <td class=xl34112900 width=187 style="width:140pt"><span
  style="mso-spacerun:yes">&nbsp;</span></td>
  <td class=xl34212900 width=111 style="width:83pt"></td>
  <td class=xl34312900 width=60 style="width:45pt"></td>
  <td colspan=6 class=xl42712900 width=421 style="width:317pt">�J<span
  style="mso-spacerun:yes">&nbsp;&nbsp; </span>��<span
  style="mso-spacerun:yes">&nbsp;&nbsp; </span>��<span
  style="mso-spacerun:yes">&nbsp;&nbsp; </span>��<span
  style="mso-spacerun:yes">&nbsp;&nbsp; </span>��</td>
  <td class=xl38512900 width=98 style="width:74pt">��</td>
  <td class=xl38512900 width=55 style="width:41pt">��</td>
  <td class=xl38512900 width=103 style="width:77pt">��</td>
  <td class=xl38512900 width=98 style="width:74pt">��</td>
  <td class=xl38512900 width=66 style="width:50pt">��</td>
  </tr>
 <tr height=16 style="height:12.0pt">
  <td height=16 class=xl34412900 style="height:12.0pt"></td>
  <td class=xl34412900></td>
  <td class=xl34512900><span style="mso-spacerun:yes">&nbsp;</span></td>
  <td class=xl34412900></td>
  <td class=xl34412900></td>
  <td colspan=6 class=xl40512900>���: 2013���g: 09</td>
  <td class=xl38612900>��</td>
  <td class=xl38612900>��</td>
  <td class=xl38612900>��</td>
  <td class=xl38612900>��</td>
  <td class=xl38612900>��</td>
  </tr>
 <tr height=25 style="mso-height-source:userset;height:18.75pt">
  <td height=25 colspan=4 valign="middle" class=xl34412900 style="height:18.75pt">��˾��
  ĳĳĳ���޹�˾</td>
  <td class=xl34612900></td>
  <td align=left valign=top></td>
  <td class=xl34412900></td>
  <td class=xl34412900></td>
  <td class=xl34412900></td>
  <td class=xl34712900></td>
  <td class=xl34812900 align=center><span
  style="mso-spacerun:yes">&nbsp;</span></td>
  <td class=xl38612900>��</td>
  <td class=xl38612900>��</td>
  <td class=xl38612900>��</td>
  <td class=xl38712900>�gλ:USD,%</td>
  <td class=xl38612900>��</td>
  </tr>
 <tr height=16 style="height:12.0pt">
  <td colspan=3 rowspan=2 height=36 class=xl40612900 style="border-right:.5pt solid black;
  border-bottom:.5pt solid black;height:27.0pt">��<span
  style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>��</td>
  <td colspan=3 class=xl40012900 style="border-right:.5pt solid black;
  border-left:none">����</td>
  <td colspan=2 class=xl40012900 style="border-right:.5pt solid black;
  border-left:none">ǰ��</td>
  <td class=xl34912900 style="border-left:none">��</td>
  <td class=xl35012900><span style="mso-spacerun:yes">&nbsp;</span></td>
  <td rowspan=2 class=xl40812900 style="border-bottom:.5pt solid black">ؓ �� �� ��
  �Y ��</td>
  <td colspan=3 class=xl41212900 style="border-right:.5pt solid black;
  border-left:none">����</td>
  <td colspan=2 class=xl41212900 style="border-right:1.0pt solid black;
  border-left:none">ǰ��</td>
  </tr>
 <tr height=20 style="mso-height-source:userset;height:15.0pt">
  <td height=20 class=xl35112900 style="height:15.0pt;border-top:none;
  border-left:none">���</td>
  <td class=xl35212900 style="border-top:none;border-left:none"><span
  style="mso-spacerun:yes">&nbsp;</span>��<span
  style="mso-spacerun:yes">&nbsp;</span></td>
  <td class=xl35112900 style="border-top:none;border-left:none">���p</td>
  <td class=xl35112900 style="border-top:none;border-left:none">���</td>
  <td class=xl35212900 style="border-top:none;border-left:none"><span
  style="mso-spacerun:yes">&nbsp;</span>��<span
  style="mso-spacerun:yes">&nbsp;</span></td>
  <td class=xl35312900 style="border-left:none">��</td>
  <td class=xl35412900>��</td>
  <td class=xl38812900 style="border-top:none;border-left:none">���</td>
  <td class=xl38912900 style="border-top:none;border-left:none"><span
  style="mso-spacerun:yes">&nbsp;</span>��<span
  style="mso-spacerun:yes">&nbsp;</span></td>
  <td class=xl38812900 style="border-top:none;border-left:none">���p</td>
  <td class=xl38812900 style="border-top:none;border-left:none">���</td>
  <td class=xl39012900 style="border-top:none;border-left:none"><span
  style="mso-spacerun:yes">&nbsp;</span>��<span
  style="mso-spacerun:yes">&nbsp;</span></td>
  </tr>
 <tr height=24 style="mso-height-source:userset;height:18.0pt">
  <td colspan=3 height=24 class=xl41812900 style="border-right:.5pt solid black;
  height:18.0pt">�������Y�b��</td>
  <td class=xl35512900 style="border-top:none;border-left:none">c7+c8...+c15</td>
  <td class=xl35612900 style="border-top:none;border-left:none">D6/D28</td>
  <td class=xl35512900 style="border-top:none;border-left:none">D6-G6</td>
  <td class=xl35512900 style="border-top:none;border-left:none">G7+G8��+G15</td>
  <td class=xl35612900 style="border-top:none;border-left:none">G6/G28</td>
  <td class=xl35712900 style="border-left:none">��</td>
  <td colspan=2 class=xl41612900 style="border-right:.5pt solid black;
  border-left:none">������ؓ����</td>
  <td class=xl39112900 style="border-top:none;border-left:none">L7+L8��+L22</td>
  <td class=xl39212900 style="border-top:none;border-left:none">M6/M28</td>
  <td class=xl39112900 style="border-top:none;border-left:none">L6-LO</td>
  <td class=xl39112900 style="border-top:none;border-left:none">O7+O8��+O22</td>
  <td class=xl39312900 style="border-top:none;border-left:none">O6/O28</td>
  </tr>
 <tr height=24 style="mso-height-source:userset;height:18.0pt">
  <td height=24 class=xl35812900 style="height:18.0pt"><span
  style="mso-spacerun:yes">&nbsp;</span></td>
  <td class=xl35912900>��</td>
  <td class=xl36012900 style="border-left:none">��<span
  style="mso-spacerun:yes">&nbsp; </span>�� - �� �� Ԥ ��</td>
  <td class=xl35512900 style="border-top:none">��</td>
  <td class=xl35612900 style="border-top:none;border-left:none">D7/D28</td>
  <td class=xl35512900 style="border-top:none;border-left:none">��</td>
  <td class=xl35512900 style="border-top:none;border-left:none">��</td>
  <td class=xl35612900 style="border-top:none;border-left:none">G7/G28</td>
  <td class=xl35712900 style="border-left:none">��</td>
  <td class=xl34512900></td>
  <td class=xl36112900>֧�B����</td>
  <td class=xl39112900 style="border-top:none;border-left:none">��</td>
  <td class=xl39212900 style="border-top:none;border-left:none">��</td>
  <td class=xl39212900 style="border-top:none;border-left:none">��</td>
  <td class=xl39212900 style="border-top:none;border-left:none">��</td>
  <td class=xl39312900 style="border-top:none;border-left:none">��</td>
  </tr>
 <tr height=24 style="mso-height-source:userset;height:18.0pt">
  <td height=24 class=xl35812900 style="height:18.0pt">��</td>
  <td class=xl36212900>��</td>
  <td class=xl36012900 style="border-top:none;border-left:none">�Ӓ��</td>
  <td class=xl35512900 style="border-top:none">��</td>
  <td class=xl35612900 style="border-top:none;border-left:none">��</td>
  <td class=xl35512900 style="border-top:none;border-left:none">��</td>
  <td class=xl35512900 style="border-top:none;border-left:none">��</td>
  <td class=xl35612900 style="border-top:none;border-left:none">��</td>
  <td class=xl35712900 style="border-left:none">��</td>
  <td class=xl34512900></td>
  <td class=xl36112900 style="border-top:none">�I���</td>
  <td class=xl39112900 style="border-top:none;border-left:none">��</td>
  <td class=xl39212900 style="border-top:none;border-left:none">��</td>
  <td class=xl39212900 style="border-top:none;border-left:none">��</td>
  <td class=xl39212900 style="border-top:none;border-left:none">��</td>
  <td class=xl39312900 style="border-top:none;border-left:none">��</td>
  </tr>
 <tr height=24 style="mso-height-source:userset;height:18.0pt">
  <td height=24 class=xl35812900 style="height:18.0pt">��</td>
  <td class=xl36212900>��</td>
  <td class=xl36012900 style="border-top:none;border-left:none">δ�����</td>
  <td class=xl35612900 style="border-top:none">��</td>
  <td class=xl35612900 style="border-top:none;border-left:none">��</td>
  <td class=xl35612900 style="border-top:none;border-left:none">��</td>
  <td class=xl35612900 style="border-top:none;border-left:none">��</td>
  <td class=xl35612900 style="border-top:none;border-left:none">��</td>
  <td class=xl35712900 style="border-left:none">��</td>
  <td class=xl34512900></td>
  <td class=xl36112900 style="border-top:none">ݔ����������(D/A)</td>
  <td class=xl39112900 style="border-top:none;border-left:none">��</td>
  <td class=xl39212900 style="border-top:none;border-left:none">��</td>
  <td class=xl39212900 style="border-top:none;border-left:none">��</td>
  <td class=xl39212900 style="border-top:none;border-left:none">��</td>
  <td class=xl39312900 style="border-top:none;border-left:none">��</td>
  </tr>
 <tr height=24 style="mso-height-source:userset;height:18.0pt">
  <td height=24 class=xl35812900 style="height:18.0pt">��</td>
  <td class=xl36212900>��</td>
  <td class=xl36012900 style="border-top:none;border-left:none">ǰ�ɽ�</td>
  <td class=xl35612900 style="border-top:none">��</td>
  <td class=xl35612900 style="border-top:none;border-left:none">��</td>
  <td class=xl35612900 style="border-top:none;border-left:none">��</td>
  <td class=xl35612900 style="border-top:none;border-left:none">��</td>
  <td class=xl35612900 style="border-top:none;border-left:none">��</td>
  <td class=xl35712900 style="border-left:none">��</td>
  <td class=xl34512900></td>
  <td class=xl36112900 style="border-top:none">ݔ������(T/R)</td>
  <td class=xl39112900 style="border-top:none;border-left:none">��</td>
  <td class=xl39212900 style="border-top:none;border-left:none">��</td>
  <td class=xl39212900 style="border-top:none;border-left:none">��</td>
  <td class=xl39212900 style="border-top:none;border-left:none">��</td>
  <td class=xl39312900 style="border-top:none;border-left:none">��</td>
  </tr>
 <tr height=24 style="mso-height-source:userset;height:18.0pt">
  <td height=24 class=xl35812900 style="height:18.0pt">��</td>
  <td class=xl36212900>��</td>
  <td class=xl36012900 style="border-top:none;border-left:none">ǰ�B�M��</td>
  <td class=xl35612900 style="border-top:none">��</td>
  <td class=xl35612900 style="border-top:none;border-left:none">��</td>
  <td class=xl35612900 style="border-top:none;border-left:none">��</td>
  <td class=xl35612900 style="border-top:none;border-left:none">��</td>
  <td class=xl35612900 style="border-top:none;border-left:none">��</td>
  <td class=xl35712900 style="border-left:none">��</td>
  <td class=xl34512900></td>
  <td class=xl36112900 style="border-top:none">������Խ</td>
  <td class=xl39112900 style="border-top:none;border-left:none">��</td>
  <td class=xl39212900 style="border-top:none;border-left:none">��</td>
  <td class=xl39212900 style="border-top:none;border-left:none">��</td>
  <td class=xl39212900 style="border-top:none;border-left:none">��</td>
  <td class=xl39312900 style="border-top:none;border-left:none">��</td>
  </tr>
 <tr height=24 style="mso-height-source:userset;height:18.0pt">
  <td height=24 class=xl35812900 style="height:18.0pt">��</td>
  <td class=xl36212900>��</td>
  <td class=xl36012900 style="border-top:none;border-left:none">���B��</td>
  <td class=xl35612900 style="border-top:none">��</td>
  <td class=xl35612900 style="border-top:none;border-left:none">��</td>
  <td class=xl35612900 style="border-top:none;border-left:none">��</td>
  <td class=xl35612900 style="border-top:none;border-left:none">��</td>
  <td class=xl35612900 style="border-top:none;border-left:none">��</td>
  <td class=xl35712900 style="border-left:none">��</td>
  <td class=xl34512900></td>
  <td class=xl36112900 style="border-top:none">�ڽ����</td>
  <td class=xl39112900 style="border-top:none;border-left:none">��</td>
  <td class=xl39212900 style="border-top:none;border-left:none">��</td>
  <td class=xl39212900 style="border-top:none;border-left:none">��</td>
  <td class=xl39212900 style="border-top:none;border-left:none">��</td>
  <td class=xl39312900 style="border-top:none;border-left:none">��</td>
  </tr>
 <tr height=24 style="mso-height-source:userset;height:18.0pt">
  <td height=24 class=xl35812900 style="height:18.0pt">��</td>
  <td class=xl36212900>��</td>
  <td class=xl36012900 style="border-top:none;border-left:none">���뱣�^��</td>
  <td class=xl35512900 style="border-top:none">��</td>
  <td class=xl35612900 style="border-top:none;border-left:none">��</td>
  <td class=xl35612900 style="border-top:none;border-left:none">��</td>
  <td class=xl35512900 style="border-top:none;border-left:none">��</td>
  <td class=xl35612900 style="border-top:none;border-left:none">��</td>
  <td class=xl35712900 style="border-left:none">��</td>
  <td class=xl34512900></td>
  <td class=xl36112900 style="border-top:none">�������ڷ��g���L�ڽ����</td>
  <td class=xl39112900 style="border-top:none;border-left:none">��</td>
  <td class=xl39212900 style="border-top:none;border-left:none">��</td>
  <td class=xl39212900 style="border-top:none;border-left:none">��</td>
  <td class=xl39212900 style="border-top:none;border-left:none">��</td>
  <td class=xl39312900 style="border-top:none;border-left:none">��</td>
  </tr>
 <tr height=24 style="mso-height-source:userset;height:18.0pt">
  <td height=24 class=xl35812900 style="height:18.0pt">��</td>
  <td class=xl36212900>��</td>
  <td class=xl36012900 style="border-top:none;border-left:none">ίӚ�J��</td>
  <td class=xl35512900 style="border-top:none">��</td>
  <td class=xl35612900 style="border-top:none;border-left:none">��</td>
  <td class=xl35512900 style="border-top:none;border-left:none">��</td>
  <td class=xl35512900 style="border-top:none;border-left:none">��</td>
  <td class=xl35612900 style="border-top:none;border-left:none">��</td>
  <td class=xl35712900 style="border-left:none">��</td>
  <td class=xl34512900></td>
  <td class=xl36112900 style="border-top:none">��</td>
  <td class=xl39112900 style="border-top:none;border-left:none">��</td>
  <td class=xl39212900 style="border-top:none;border-left:none">��</td>
  <td class=xl39212900 style="border-top:none;border-left:none">��</td>
  <td class=xl39212900 style="border-top:none;border-left:none">��</td>
  <td class=xl39312900 style="border-top:none;border-left:none">��</td>
  </tr>
 <tr height=24 style="mso-height-source:userset;height:18.0pt">
  <td height=24 class=xl36312900 style="height:18.0pt">��</td>
  <td class=xl36412900>��</td>
  <td class=xl36012900 style="border-top:none;border-left:none">δ����Ϣ</td>
  <td class=xl35512900 style="border-top:none">��</td>
  <td class=xl35612900 style="border-top:none;border-left:none">��</td>
  <td class=xl35512900 style="border-top:none;border-left:none">��</td>
  <td class=xl35512900 style="border-top:none;border-left:none">��</td>
  <td class=xl35612900 style="border-top:none;border-left:none">��</td>
  <td class=xl35712900 style="border-left:none">��</td>
  <td class=xl34512900></td>
  <td class=xl36112900 style="border-top:none">δ�B��<font class="font712900">&#12539;</font><font
  class="font712900">δ�B�M��</font></td>
  <td class=xl39112900 style="border-top:none;border-left:none">��</td>
  <td class=xl39212900 style="border-top:none;border-left:none">��</td>
  <td class=xl39112900 style="border-top:none;border-left:none">��</td>
  <td class=xl39112900 style="border-top:none;border-left:none">��</td>
  <td class=xl39312900 style="border-top:none;border-left:none">��</td>
  </tr>
 <tr height=24 style="mso-height-source:userset;height:18.0pt">
  <td colspan=3 height=24 class=xl42112900 style="border-right:.5pt solid black;
  height:18.0pt">���R���Y�b��</td>
  <td class=xl35512900 style="border-top:none;border-left:none">c17+c18+c19</td>
  <td class=xl35612900 style="border-top:none;border-left:none">��</td>
  <td class=xl35612900 style="border-top:none;border-left:none">��</td>
  <td class=xl35512900 style="border-top:none;border-left:none">G17+G18+G19</td>
  <td class=xl35612900 style="border-top:none;border-left:none">��</td>
  <td class=xl35712900 style="border-left:none">��</td>
  <td class=xl34512900></td>
  <td class=xl36112900 style="border-top:none">�A���</td>
  <td class=xl39112900 style="border-top:none;border-left:none">��</td>
  <td class=xl39212900 style="border-top:none;border-left:none">��</td>
  <td class=xl39212900 style="border-top:none;border-left:none">��</td>
  <td class=xl39212900 style="border-top:none;border-left:none">��</td>
  <td class=xl39312900 style="border-top:none;border-left:none">��</td>
  </tr>
 <tr height=24 style="mso-height-source:userset;height:18.0pt">
  <td height=24 class=xl36512900 style="height:18.0pt">��</td>
  <td class=xl35912900>��</td>
  <td class=xl36012900 style="border-left:none">���������ʲ�</td>
  <td class=xl35512900 style="border-top:none">��</td>
  <td class=xl35612900 style="border-top:none;border-left:none">��</td>
  <td class=xl35612900 style="border-top:none;border-left:none">��</td>
  <td class=xl35512900 style="border-top:none;border-left:none">��</td>
  <td class=xl35612900 style="border-top:none;border-left:none">��</td>
  <td class=xl35712900 style="border-left:none">��</td>
  <td class=xl34512900></td>
  <td class=xl36112900 style="border-top:none">δ�B�����ֵ�</td>
  <td class=xl39112900 style="border-top:none;border-left:none">��</td>
  <td class=xl39212900 style="border-top:none;border-left:none">��</td>
  <td class=xl39112900 style="border-top:none;border-left:none">��</td>
  <td class=xl39112900 style="border-top:none;border-left:none">��</td>
  <td class=xl39312900 style="border-top:none;border-left:none">��</td>
  </tr>
 <tr height=24 style="mso-height-source:userset;height:18.0pt">
  <td height=24 class=xl35812900 style="height:18.0pt">��</td>
  <td class=xl35912900>��</td>
  <td class=xl36012900 style="border-top:none;border-left:none">�R������˰�Y�b</td>
  <td class=xl35612900 style="border-top:none">��</td>
  <td class=xl35612900 style="border-top:none;border-left:none">��</td>
  <td class=xl35612900 style="border-top:none;border-left:none">��</td>
  <td class=xl35612900 style="border-top:none;border-left:none">��</td>
  <td class=xl35612900 style="border-top:none;border-left:none">��</td>
  <td class=xl35712900 style="border-left:none">��</td>
  <td class=xl34512900></td>
  <td class=xl36112900 style="border-top:none">δ�B˰��</td>
  <td class=xl39112900 style="border-top:none;border-left:none">��</td>
  <td class=xl39212900 style="border-top:none;border-left:none">��</td>
  <td class=xl39112900 style="border-top:none;border-left:none">��</td>
  <td class=xl39112900 style="border-top:none;border-left:none">��</td>
  <td class=xl39312900 style="border-top:none;border-left:none">��</td>
  </tr>
 <tr height=24 style="mso-height-source:userset;height:18.0pt">
  <td height=24 class=xl35812900 style="height:18.0pt"><span
  style="mso-spacerun:yes">&nbsp;</span></td>
  <td class=xl36612900><span style="mso-spacerun:yes">&nbsp;</span></td>
  <td class=xl36012900 style="border-top:none;border-left:none">��������֧��</td>
  <td class=xl35612900 style="border-top:none">��</td>
  <td class=xl35612900 style="border-top:none;border-left:none">��</td>
  <td class=xl35612900 style="border-top:none;border-left:none">��</td>
  <td class=xl35612900 style="border-top:none;border-left:none">��</td>
  <td class=xl35612900 style="border-top:none;border-left:none">��</td>
  <td class=xl35712900 style="border-left:none">��</td>
  <td class=xl34512900></td>
  <td class=xl36112900 style="border-top:none">δ�B����˰</td>
  <td class=xl39112900 style="border-top:none;border-left:none">��</td>
  <td class=xl39212900 style="border-top:none;border-left:none">��</td>
  <td class=xl39112900 style="border-top:none;border-left:none">��</td>
  <td class=xl39112900 style="border-top:none;border-left:none">��</td>
  <td class=xl39312900 style="border-top:none;border-left:none">��</td>
  </tr>
 <tr height=24 style="mso-height-source:userset;height:18.0pt">
  <td colspan=3 height=24 class=xl41812900 style="border-right:.5pt solid black;
  height:18.0pt">�����̶��Y�b��</td>
  <td class=xl35512900 style="border-top:none;border-left:none">c21+c26</td>
  <td class=xl35612900 style="border-top:none;border-left:none">��</td>
  <td class=xl35512900 style="border-top:none;border-left:none">��</td>
  <td class=xl35512900 style="border-top:none;border-left:none">G21+G26</td>
  <td class=xl35612900 style="border-top:none;border-left:none">��</td>
  <td class=xl35712900 style="border-left:none">��</td>
  <td class=xl34512900></td>
  <td class=xl36712900 style="border-top:none">�R������˰ؓ��</td>
  <td class=xl39112900 style="border-top:none;border-left:none">��</td>
  <td class=xl39212900 style="border-top:none;border-left:none">��</td>
  <td class=xl39212900 style="border-top:none;border-left:none">��</td>
  <td class=xl39212900 style="border-top:none;border-left:none">��</td>
  <td class=xl39312900 style="border-top:none;border-left:none">��</td>
  </tr>
 <tr height=24 style="mso-height-source:userset;height:18.0pt">
  <td height=24 class=xl35812900 style="height:18.0pt">��</td>
  <td colspan=2 class=xl43012900 style="border-right:.5pt solid black">�t�̶��Y�b</td>
  <td class=xl35512900 style="border-top:none;border-left:none">c22+c23</td>
  <td class=xl35612900 style="border-top:none;border-left:none">��</td>
  <td class=xl35612900 style="border-top:none;border-left:none">��</td>
  <td class=xl35512900 style="border-top:none;border-left:none">G22+G23</td>
  <td class=xl35612900 style="border-top:none;border-left:none">��</td>
  <td class=xl35712900 style="border-left:none">��</td>
  <td class=xl34512900></td>
  <td class=xl36112900 style="border-top:none">�p���������</td>
  <td class=xl39112900 style="border-top:none;border-left:none">��</td>
  <td class=xl39212900 style="border-top:none;border-left:none">��</td>
  <td class=xl39112900 style="border-top:none;border-left:none">��</td>
  <td class=xl39112900 style="border-top:none;border-left:none">��</td>
  <td class=xl39312900 style="border-top:none;border-left:none">��</td>
  </tr>
 <tr height=24 style="mso-height-source:userset;height:18.0pt">
  <td height=24 class=xl35812900 style="height:18.0pt">��</td>
  <td class=xl36812900>��</td>
  <td class=xl36012900>����.����</td>
  <td class=xl35512900 style="border-top:none">��</td>
  <td class=xl35612900 style="border-top:none;border-left:none">��</td>
  <td class=xl35612900 style="border-top:none;border-left:none">��</td>
  <td class=xl35512900 style="border-top:none;border-left:none">��</td>
  <td class=xl35612900 style="border-top:none;border-left:none">��</td>
  <td class=xl35712900 style="border-left:none">��</td>
  <td class=xl36912900>��</td>
  <td class=xl36112900 style="border-top:none;border-left:none">���縶�濱��</td>
  <td class=xl39112900 style="border-top:none;border-left:none">��</td>
  <td class=xl39212900 style="border-top:none;border-left:none">��</td>
  <td class=xl39212900 style="border-top:none;border-left:none">��</td>
  <td class=xl39212900 style="border-top:none;border-left:none">��</td>
  <td class=xl39312900 style="border-top:none;border-left:none">��</td>
  </tr>
 <tr height=17 style="height:12.75pt">
  <td height=17 class=xl37012900 style="height:12.75pt">��</td>
  <td class=xl37112900 style="border-left:none">��</td>
  <td class=xl36012900 style="border-top:none;border-left:none">�������߂�Ʒ</td>
  <td class=xl35512900 style="border-top:none">��</td>
  <td class=xl35612900 style="border-top:none;border-left:none">��</td>
  <td class=xl35612900 style="border-top:none;border-left:none">��</td>
  <td class=xl35512900 style="border-top:none;border-left:none">��</td>
  <td class=xl35612900 style="border-top:none;border-left:none">��</td>
  <td class=xl35712900 style="border-left:none">��</td>
  <td colspan=2 class=xl41612900 style="border-right:.5pt solid black;
  border-left:none">���ʱ����</td>
  <td class=xl39112900 style="border-top:none;border-left:none">L24+L27</td>
  <td class=xl39212900 style="border-top:none;border-left:none">��</td>
  <td class=xl39112900 style="border-top:none;border-left:none">��</td>
  <td class=xl39112900 style="border-top:none;border-left:none">O24+O27</td>
  <td class=xl39312900 style="border-top:none;border-left:none">��</td>
  </tr>
 <tr height=16 style="mso-height-source:userset;height:12.0pt">
  <td height=16 class=xl37012900 style="height:12.0pt">��</td>
  <td class=xl37212900 style="border-left:none">��</td>
  <td class=xl36012900 style="border-top:none;border-left:none">܇�I�p����ȴ��Ӌ�~</td>
  <td class=xl39812900 style="border-top:none">����</td>
  <td class=xl35612900 style="border-top:none;border-left:none">��</td>
  <td class=xl35612900 style="border-top:none;border-left:none">��</td>
  <td class=xl39812900 style="border-top:none;border-left:none">����</td>
  <td class=xl35612900 style="border-top:none;border-left:none">��</td>
  <td class=xl35712900 style="border-left:none">��</td>
  <td class=xl37312900></td>
  <td class=xl36112900>�ʱ���</td>
  <td class=xl39112900 style="border-top:none;border-left:none">��</td>
  <td class=xl39212900 style="border-top:none;border-left:none">��</td>
  <td class=xl39212900 style="border-top:none;border-left:none">��</td>
  <td class=xl39112900 style="border-top:none;border-left:none">��</td>
  <td class=xl39312900 style="border-top:none;border-left:none">��</td>
  </tr>
 <tr height=17 style="height:12.75pt">
  <td height=17 class=xl37012900 style="height:12.75pt">��</td>
  <td class=xl37212900 style="border-left:none">��</td>
  <td class=xl36012900 style="border-top:none;border-left:none">�������߂�Ʒ�p����ȴ��Ӌ�~</td>
  <td class=xl39812900 style="border-top:none">����</td>
  <td class=xl35612900 style="border-top:none;border-left:none">��</td>
  <td class=xl35512900 style="border-top:none;border-left:none">��</td>
  <td class=xl39812900 style="border-top:none;border-left:none">����</td>
  <td class=xl35612900 style="border-top:none;border-left:none">��</td>
  <td class=xl35712900 style="border-left:none">��</td>
  <td class=xl37412900>��</td>
  <td class=xl36112900 style="border-top:none;border-left:none">����׼����</td>
  <td class=xl39112900 style="border-top:none;border-left:none">��</td>
  <td class=xl39212900 style="border-top:none;border-left:none">��</td>
  <td class=xl39212900 style="border-top:none;border-left:none">��</td>
  <td class=xl39112900 style="border-top:none;border-left:none">��</td>
  <td class=xl39312900 style="border-top:none;border-left:none">��</td>
  </tr>
 <tr height=17 style="height:12.75pt">
  <td height=17 class=xl37512900 style="height:12.75pt">��</td>
  <td colspan=2 class=xl42812900 style="border-right:.5pt solid black;
  border-left:none">�p����ȴ������</td>
  <td class=xl35512900 style="border-top:none;border-left:none">c24+C25<font
  class="font912900">����</font></td>
  <td class=xl35612900 style="border-top:none;border-left:none">��</td>
  <td class=xl35512900 style="border-top:none;border-left:none">��</td>
  <td class=xl35512900 style="border-top:none;border-left:none">G24+G25<font
  class="font912900">����</font></td>
  <td class=xl35612900 style="border-top:none;border-left:none">��</td>
  <td class=xl35712900 style="border-left:none">��</td>
  <td class=xl37412900>��</td>
  <td class=xl36112900 style="border-top:none;border-left:none">ǰ���RԽ����</td>
  <td class=xl39912900 style="border-top:none;border-left:none">��</td>
  <td class=xl39212900 style="border-top:none;border-left:none">��</td>
  <td class=xl39112900 style="border-top:none;border-left:none">��</td>
  <td class=xl39112900 style="border-top:none;border-left:none">��</td>
  <td class=xl39312900 style="border-top:none;border-left:none">��</td>
  </tr>
 <tr height=17 style="height:12.75pt">
  <td colspan=3 height=17 class=xl42412900 style="border-right:.5pt solid black;
  height:12.75pt"><span style="mso-spacerun:yes">&nbsp;</span>���������Y�b�ϼơ�</td>
  <td class=xl35512900 style="border-top:none;border-left:none">c16+c20</td>
  <td class=xl35612900 style="border-top:none;border-left:none">��</td>
  <td class=xl35512900 style="border-top:none;border-left:none">��</td>
  <td class=xl35512900 style="border-top:none;border-left:none">G16+G20</td>
  <td class=xl35612900 style="border-top:none;border-left:none">��</td>
  <td class=xl37612900 style="border-left:none">��</td>
  <td class=xl37712900>��</td>
  <td class=xl36712900 style="border-top:none;border-left:none">��������</td>
  <td class=xl39912900 style="border-top:none;border-left:none">��</td>
  <td class=xl39212900 style="border-top:none;border-left:none">��</td>
  <td class=xl39112900 style="border-top:none;border-left:none">��</td>
  <td class=xl39112900 style="border-top:none;border-left:none">��</td>
  <td class=xl39312900 style="border-top:none;border-left:none">��</td>
  </tr>
 <tr height=18 style="height:13.5pt">
  <td colspan=3 height=18 class=xl40312900 style="border-right:.5pt solid black;
  height:13.5pt">�Y�b�tӋ</td>
  <td class=xl37812900 style="border-top:none;border-left:none">c2+c27</td>
  <td class=xl37912900 align=right style="border-top:none;border-left:none">100</td>
  <td class=xl37812900 style="border-top:none;border-left:none">��</td>
  <td class=xl37812900 style="border-top:none;border-left:none">G2+G27</td>
  <td class=xl37912900 align=right style="border-top:none;border-left:none">100</td>
  <td class=xl38012900 style="border-left:none">��</td>
  <td class=xl38112900 style="border-top:none">��</td>
  <td class=xl38212900 style="border-top:none">ؓ�������Y���tӋ</td>
  <td class=xl39412900 style="border-top:none;border-left:none">L6+L23</td>
  <td class=xl39512900 style="border-top:none;border-left:none">��</td>
  <td class=xl39412900 style="border-top:none;border-left:none">��</td>
  <td class=xl39412900 style="border-top:none;border-left:none">��</td>
  <td class=xl39612900 style="border-top:none;border-left:none">��</td>
  </tr>
 <tr height=16 style="height:12.0pt">
  <td height=16 class=xl34412900 style="height:12.0pt"></td>
  <td class=xl34412900></td>
  <td class=xl34412900></td>
  <td class=xl34512900><span style="mso-spacerun:yes">&nbsp;</span></td>
  <td class=xl34612900></td>
  <td class=xl34412900></td>
  <td class=xl34412900></td>
  <td class=xl34412900></td>
  <td class=xl34412900></td>
  <td class=xl34412900></td>
  <td class=xl34412900></td>
  <td class=xl39712900><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;</span></td>
  <td class=xl38612900>��</td>
  <td class=xl38612900>��</td>
  <td class=xl38612900>��</td>
  <td class=xl38612900>��</td>
  </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style="display:none">
  <td width=14 style="width:11pt"></td>
  <td width=10 style="width:8pt"></td>
  <td width=187 style="width:140pt"></td>
  <td width=111 style="width:83pt"></td>
  <td width=60 style="width:45pt"></td>
  <td width=421 style="width:55pt"></td>
  <td width=102 style="width:77pt"></td>
  <td width=55 style="width:41pt"></td>
  <td width=12 style="width:9pt"></td>
  <td width=18 style="width:14pt"></td>
  <td width=161 style="width:121pt"></td>
  <td width=98 style="width:74pt"></td>
  <td width=55 style="width:41pt"></td>
  <td width=103 style="width:77pt"></td>
  <td width=98 style="width:74pt"></td>
  <td width=66 style="width:50pt"></td>
  </tr>
 <![endif]>
</table>
</div>
</body>
</html>
'; ---------------------End of Html Scripts---------------------------------------
  END;
END Chx_Html_Buffer;
/
