<%@page import="com.web.model.AlbumDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%
String upPath = application.getRealPath("/resources/images/");
%>
<html>
<head>
	<title>mvc�Խ���</title>
</head>
<body>
<div align="center">
	<b>�۳��� ����</b>
	<table border="1" width="500">
		<tr>
			<th bgcolor="yellow" width="15%">�۹�ȣ</th>
			<td align="center" width="35%">${getBoard.albumNum}</td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="15%">��Ƽ��Ʈ</th>
			<td align="center" width="35%">${getBoard.artistName}</td>
			<th bgcolor="yellow" width="15%">�ۼ���</th>
			<td align="center" width="35%">${getBoard.regdate}</td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="15%">������</th>
			<td align="center" colspan="3">${getBoard.albumName}</td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="15%">�۳���</th>
			<td colspan="3"><iframe width="560" height="315" src="${getBoard.mvlink}" frameborder="0" allowfullscreen></iframe>
		</td>
		</tr>
		<td align="center" class="m3">
			<img src="<%=upPath%>/${getBoard.albumImage}"
															width="200" height="200">
		</td>
		<tr bgcolor="yellow">
			<td colspan="4" align="right">
				<input type="button" value="��۾���"
					onclick="window.location='board_write?num=${getBoard.albumNum}'">
				<input type="button" value="�ۼ���"
					onclick="window.location='board_update?num=${getBoard.albumNum}'">
				<input type="button" value="�ۻ���"
					onclick="window.location='board_delete?num=${getBoard.albumNum}'">
				<input type="button" value="�۸��" 
					onclick="window.location='board_list'">
			</td>
		</tr>
	</table>
</div>
</body>
</html>



















