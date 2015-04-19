<%-- 
    Document   : word
    Created on : Apr 18, 2015, 5:10:23 PM
    Author     : R
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
		String exportToWord = request.getParameter("exportToWord");
		if (exportToWord != null
				&& exportToWord.toString().equalsIgnoreCase("YES")) {
			response.setContentType("application/vnd.ms-word");
			response.setHeader("Content-Disposition", "inline; filename="
					+ "word.doc");

		}
	%>
	This is the plain text. 
	
      
        
	<p>
	<font color="green">This is the color text. </font>
	<p>
	<a href="#">This is hyperlink. </a>
	<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<%
		if (exportToWord == null) {
	%>
	<a href="word.jsp?exportToWord=YES">Export to Word</a>
	<%
		}
	%>
    </body>
</html>
