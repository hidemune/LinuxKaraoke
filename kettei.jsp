<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
 import="java.io.*,java.util.*,java.text.*" %>

<html>
  <head>
    <meta http-equiv="refresh" content="3;URL=input.jsp">
    <title>カラオケ</title>
  </head>
  <body>
<%
  request.setCharacterEncoding("UTF-8");

  String strTxt = request.getParameter("filename");
  //strTxt = "'" + strTxt + "'";
  out.println("入力：" + strTxt + "：予約します");
%>


 <%
SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");

File file = new File(application.getRealPath("que" + sdf.format(Calendar.getInstance().getTime())));
file.setWritable(true);

FileWriter objFr=new FileWriter(file);
BufferedWriter objBr=new BufferedWriter(objFr);
objBr.write(strTxt);
objBr.write("\n");
objBr.close();
 %>
    <br>
    <br>
    <a href="input.jsp">予約システムに移動</a>
  </body>
</html>
