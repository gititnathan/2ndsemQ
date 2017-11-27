<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
	<title>mvc게시판</title>
	<script type="text/javascript">
		function check(){
			if (f.writer.value==""){
				alert("이름을 입력해 주세요!!")
				f.writer.focus()
				return false
			}
			if (f.subject.value==""){
				alert("제목을 입력해 주세요!!")
				f.subject.focus()
				return false
			}
			if (f.content.value==""){
				alert("내용을 입력해 주세요!!")
				f.content.focus()
				return false
			}
			if (f.passwd.value==""){
				alert("비밀번호를 입력해 주세요!!")
				f.passwd.focus()
				return false
			}
			return true
		}
	</script>
</head>	
<body>

<div align="center">
	<form name="f" action="board_write" method="post" 
	onsubmit="return check()" enctype= "multipart/form-data">
	<table border="1" width="500">
		<tr bgcolor="yellow">
			<th colspan="2">앨범등록하기</th>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">앨 범 이 름</th>
			<td><input type="text" name="albumtitle" class="box"></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">아티스트 이름</th>
			<td><input type="text" name="artistname" class="box" size="50"></td>
		</tr>
		
		<tr>
			<th bgcolor="yellow" width="20%">앨범 자켓 이미지</th>
			<td><input type="file" name="albumimage" class="box" size="50"></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">음악 파일</th>
			<td><input type="file" name="musicfile" class="box" size="50"></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">거주지</th>
			<td><input type="text" name="whereIlive" class="box" size="50"></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">장르</th>
			<td><input type="text" name="genre" class="box" size="50"></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">좋아하는 아티스트</th>
			<td><input type="text" name="favoriteartist" class="box" size="50"></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">뮤비 링크</th>
			<td><input type="text" name="videolink" class="box" size="50"></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">연락처</th>
			<td><input type="text" name="email" class="box" size="50"></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">세션 및 작곡</th>
			<td><textarea name="content" rows="13" cols="50" class="box"></textarea></td>
		</tr>
				<tr>
			<th bgcolor="yellow" width="20%">앨 범 소 개</th>
			<td><textarea name="content" rows="13" cols="50" class="box"></textarea></td>
		</tr>
		<tr bgcolor="yellow">
			<td colspan="2" align="center">
				<input type="submit" value="업로드">
				<input type="reset" value="다시작성">
				<input type="button" value="목록보기" 	onclick="window.location='board_list'">
			</td>	
		</tr>
	</table>
	</form>
</div>
</body>
</html>












