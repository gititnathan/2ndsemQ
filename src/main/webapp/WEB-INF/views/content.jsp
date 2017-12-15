<%@page import="com.web.model.AlbumDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%
String upPath = application.getRealPath("/resources/images/");
%>
<html>
<head>
	<title>mvc게시판</title>
</head>
<body>
<div align="center">
	<b>글내용 보기</b>
	<table border="1" width="500">
		<tr>
			<th bgcolor="yellow" width="15%">글번호</th>
			<td align="center" width="35%">${getBoard.albumNum}</td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="15%">아티스트</th>
			<td align="center" width="35%">${getBoard.artistName}</td>
			<th bgcolor="yellow" width="15%">작성일</th>
			<td align="center" width="35%">${getBoard.regdate}</td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="15%">글제목</th>
			<td align="center" colspan="3">${getBoard.albumName}</td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="15%">글내용</th>
			<td colspan="3"><iframe width="560" height="315" src="${getBoard.mvlink}" frameborder="0" allowfullscreen></iframe>
		</td>
		</tr>
		<td align="center" class="m3">
			<img src="<%=upPath%>/${getBoard.albumImage}"
															width="200" height="200">
		</td>
		<tr bgcolor="yellow">
			<td colspan="4" align="right">
				<input type="button" value="답글쓰기"
					onclick="window.location='board_write?num=${getBoard.albumNum}'">
				<input type="button" value="글수정"
					onclick="window.location='board_update?num=${getBoard.albumNum}'">
				<input type="button" value="글삭제"
					onclick="window.location='board_delete?num=${getBoard.albumNum}'">
				<input type="button" value="글목록" 
					onclick="window.location='board_list'">
			</td>
		</tr>
	</table>
</div>
</body>
</html>



















