<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Upload files</title>
<script src="/webjars/jquery/2.1.3/dist/jquery.min.js"></script>

<script type="text/javascript">
<!--
    function handleFileSelect() 
    {
        var files = document.getElementById('up_files').files[0]; //���� ��ü
 
        var reader = new FileReader();
 
        //�������� ����        
        reader.onload = (function(theFile) 
        {
            return function(e) 
            {
                //�̹��� ��
                var img_view = ['<img src="', e.target.result, '" title="', escape(theFile.name), '"/>'].join('');                
                document.getElementById('list').innerHTML = img_view;
            };
 
        })(files);
            
        reader.readAsDataURL(files);    
    }
 
//-->
</script>
</head>
<body>
<!-- 1. �����ϰ��� �ϴ� �Է� ���� <form>�� </form>���̿� ��ġ�س��´�. 
2. action ���� �����͸� ���۹޾Ƽ� ó���� Controller url�� �����Ѵ�. 
3. method�� �ݵ�� post�� �������ش�. get���� ������ parameter���� url�� ���󰣴�. 
4. enctype�� multipart/form-data�� �����Ѵ�. 
5. <form>�� </form>���̿� input type submit��ư�� ��ġ��Ų��. --> 
<form action="file_upload" id="fileUpload" name="fileUpload" method="post" enctype="multipart/form-data"> 
�̸� : <input type="text" name="name" id="cmd" value="namevla"><br>
<input type="file" id="up_files" name="up_files" onchange="handleFileSelect()"/>
<input type="file" id="up_files2" name="up_files2" onchange="handleFileSelect()"/>
<input type="file" id="up_files3" name="up_files3" onchange="handleFileSelect()"/>
<div id="list"></div><input type="submit" name="���ε�" value="����"><br> </form>
</body>
</html>