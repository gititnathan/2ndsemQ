<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
	<title>mvc�Խ���</title>
	<script type="text/javascript">
		function check(){
			if (f.writer.value==""){
				alert("�̸��� �Է��� �ּ���!!")
				f.writer.focus()
				return false
			}
			if (f.subject.value==""){
				alert("������ �Է��� �ּ���!!")
				f.subject.focus()
				return false
			}
			if (f.content.value==""){
				alert("������ �Է��� �ּ���!!")
				f.content.focus()
				return false
			}
			if (f.passwd.value==""){
				alert("��й�ȣ�� �Է��� �ּ���!!")
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
			<th colspan="2">�ٹ�����ϱ�</th>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">�� �� �� ��</th>
			<td><input type="text" name="albumtitle" class="box"></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">��Ƽ��Ʈ �̸�</th>
			<td><input type="text" name="artistname" class="box" size="50"></td>
		</tr>
		
		<tr>
			<th bgcolor="yellow" width="20%">�ٹ� ���� �̹���</th>
			<td><input type="file" name="albumimage" class="box" size="50"></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">���� ����</th>
			<td><input type="file" name="musicfile" class="box" size="50"></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">������</th>
			<td><input type="text" name="whereIlive" class="box" size="50"></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">�帣</th>
			<td><input type="text" name="genre" class="box" size="50"></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">�����ϴ� ��Ƽ��Ʈ</th>
			<td><input type="text" name="favoriteartist" class="box" size="50"></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">�º� ��ũ</th>
			<td><input type="text" name="videolink" class="box" size="50"></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">����ó</th>
			<td><input type="text" name="email" class="box" size="50"></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">���� �� �۰�</th>
			<td><textarea name="content" rows="13" cols="50" class="box"></textarea></td>
		</tr>
				<tr>
			<th bgcolor="yellow" width="20%">�� �� �� ��</th>
			<td><textarea name="content" rows="13" cols="50" class="box"></textarea></td>
		</tr>
		<tr bgcolor="yellow">
			<td colspan="2" align="center">
				<input type="submit" value="���ε�">
				<input type="reset" value="�ٽ��ۼ�">
				<input type="button" value="��Ϻ���" 	onclick="window.location='board_list'">
			</td>	
		</tr>
	</table>
	</form>
</div>
</body>
</html>












