<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" language="javascript">
function chk_onclick()
{
	var myform=document.pform;
	if(myform.username.value=="" || myform.passwd.value=="")
	{
		alert("PLEASE COMPLETE ALL THE SPECIFICATION");
		if(myform.username.value=="")
		{
			myform.username.focus();
		}
		else
		{
			myform.passwd.focus();
		}
	}
	
}
	  </script>
</head>
<body background="c.jpg">
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">WebSiteName</a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href="index.jsp">Home</a></li>
      <li class="active><a href="login_e.jsp">Employer login</a></li>
      <li ><a href="LOGIN_A.jsp">Applicant login</a></li>
      
    </ul>
  </div>
</nav>

<font face="verdana,arial" size=-1>
<center><table cellpadding=2 cellspacing=0 border=0 height=500 width=600>

<tr><td bgcolor="white"><B>EMPLOYER'S LOGIN</B>
<table cellpadding=0 cellspacing=0 border=0 width=100%><tr>
<img src="login-icon.gif"   width="100" height="100">
<td bgcolor="white" align=center style="padding:2;padding-bottom:4">

<b><font size=-1 color="white" 
face="verdana,arial"><b>Enter your login and password</b></font></td></tr>
<tr><td bgcolor="white" style="padding:5"><br>

<form method="post" action="login_e.jsp" name=pform>

<center><table>
<tr><td><font face="verdana,arial" size=-1>USERNAME:</td><td>
<input type="text" name="username"></td></tr>
<tr><td><font face="verdana,arial" size=-1>PASSWORD:</td><td>
<input type="password" name="passwd"></td></tr>
<tr><td><font face="verdana,arial" size=-1>&nbsp;
</td><td><font face="verdana,arial" size=-1>
<input type="submit" value="SUBMIT" name=chkform onclick="chk_onclick()"></td></tr>
<tr><td colspan=2><font face="verdana,arial" size=-1>&nbsp;</td></tr>

<tr><td colspan=2><font face="verdana,arial" size=-1>Not member yet? Click <a 

href="emp_reg.jsp">here</a> to register.</td></tr>
<td align="right" valign="bottom"><img src="1.gif"   width="5" height="5" ></td>
</table></center>
</form>
<form method="post" action="home1.jsp">
<input maxlength="255" size="30" value="HOME" type="submit" >
</form>
</td></tr></table></td></tr></table>

<%
String k1=request.getParameter("username");
session.setAttribute("x1",k1);
if(k1!=null){
try{
	
	String k2=request.getParameter("passwd");
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection c=DriverManager.getConnection("jdbc:odbc:abc","root","root");
	Statement s =c.createStatement();
	String sql = "select * from employer where emp_name='"+k1+"'";// and password='"+k2+"'";
	ResultSet rs=s.executeQuery(sql);
	rs.next();
	String pass=rs.getString(2);
	
	if(k2.equals(pass))
	{
		 %>
		  <jsp:forward page="emp_home.jsp" />
	<%}
	else
	{
	 %><script type="text/javascript" language="javascript">
		  alert("Your ID and Password do not match.Enter a valid Login Id and Password.");
		  </script>
	 <%}
	
	}catch(Exception e) 
	{
	%><script type="text/javascript" language="javascript">
			alert("INVALID USER ID");
			</script>
	<%}
}
%>
</body>
</html>