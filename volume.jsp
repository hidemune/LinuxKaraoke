<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
 import="java.io.*,java.util.*,java.text.*,java.nio.file.*" %>

<!DOCTYPE html>
<html lang="ja">
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <link rel="stylesheet" type="text/css" href="jcard.css" />
 <meta http-equiv="Pragma" content="no-cache">
 <meta http-equiv="Cache-Control" content="no-cache">
 <meta http-equiv="Expires" content="0">
<title>カラオケ</title>
</head>

<body id="iframe">
　【音量】<br>

<%
    String vol = "";
    FileReader objFr=new FileReader("/tmp/que/volume");
    BufferedReader objBr=new BufferedReader(objFr);
    String line = "";
    while((line = objBr.readLine()) != null){
      vol = line;
    }
    objBr.close();

  for(int i=100;i >= 0;i = i - 10){
    String num = "    " + i;
    num = num.substring(num.length()-4,num.length()).replace(" ","&nbsp;");
%>

<a href="input.jsp?volume=<%=i%>" target="_top">
<button type="button" name="volume" value="<%=i%>">
<font size="5" color="#333399"><%=num%></font>
</button>
<%
  if (vol.equals("" + i)) {
    out.println("★");
  }
%>
</a>
<br>

<%
  }
%>


<br>
</body>
</html>


