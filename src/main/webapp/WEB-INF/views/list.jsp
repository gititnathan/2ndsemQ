<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<html>
<head>
	<title>메인뷰 목록</title>
</head>
<body>
<div align="center">
	<b>글 목 록</b>
	<table border="0" width="600">
		<tr bgcolor="yellow">
			<td align="right"><a href="board_write">글쓰기</a></td>
		</tr>
	</table>
		<table border="1" width="600">
		<tr bgcolor="green">
			<th>번호</th>
			<th width="30%">앨범타이틀</th>
			<th>장르</th>
		</tr>
		<c:choose>
		<c:when test = "${albumList == null}" >
		<tr>
			<td colspan="6">등록된 게시글이 없습니다.</td>
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




