<%@page import="com.web.model.AlbumDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%
		AlbumDBBean albumdto = (AlbumDBBean)request.getAttribute("getAlbum"); 
		String upPath = application.getRealPath("/shop/images");
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
			<td align="center" width="35%">${getBoard.num}</td>
			<th bgcolor="yellow" width="15%">��ȸ��</th>
			<td align="center" width="35%">${getBoard.readcount}</td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="15%">�ۼ���</th>
			<td align="center" width="35%">${getBoard.writer}</td>
			<th bgcolor="yellow" width="15%">�ۼ���</th>
			<td align="center" width="35%">${getBoard.reg_date}</td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="15%">������</th>
			<td align="center" colspan="3">${getBoard.subject}</td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="15%">�۳���</th>
			<td colspan="3">${getBoard.content}</td>
		</tr>
		<td align="center" class="m3">
			<img src="<%=upPath%>/<%=albumdto.getAlbumImage()%>"
															width="200" height="200">
		</td>
		<tr bgcolor="yellow">
			<td colspan="4" align="right">
				<input type="button" value="��۾���"
					onclick="window.location='board_write?num=${getBoard.num}'">
				<input type="button" value="�ۼ���"
					onclick="window.location='board_update?num=${getBoard.num}'">
				<input type="button" value="�ۻ���"
					onclick="window.location='board_delete?num=${getBoard.num}'">
				<input type="button" value="�۸��" 
					onclick="window.location='board_list'">
			</td>
		</tr>
	</table>
</div>
</body>
</html>



















