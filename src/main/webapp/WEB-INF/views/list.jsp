<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<html>
<head>
	<title>���κ� ���</title>
</head>
<body>
<div align="center">
	<b>�� �� ��</b>
	<table border="0" width="600">
		<tr bgcolor="yellow">
			<td align="right"><a href="board_write">�۾���</a></td>
		</tr>
	</table>
		<table border="1" width="600">
		<tr bgcolor="green">
			<th>��ȣ</th>
			<th width="30%">�ٹ�Ÿ��Ʋ</th>
			<th>�帣</th>
		</tr>
		<c:choose>
		<c:when test = "${albumList == null}" >
		<tr>
			<td colspan="6">��ϵ� �Խñ��� �����ϴ�.</td>
		</tr>	
		</c:when>
		<c:otherwise>
			<c:forEach items="${albumList}" var="list">
				<tr>
			<td>${list.albumnum}</td>
			<td>
				<a href="board_content?albumnum=${list.albumnum}">
					${list.albumtitle}
				</a>
				
			</td>
			<td>${list.genre}</td>
		</tr>						
			</c:forEach>
		</c:otherwise>
		</c:choose>
	
	</table>
</div>
</body>
</html>




