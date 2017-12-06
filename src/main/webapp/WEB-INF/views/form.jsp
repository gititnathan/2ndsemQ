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
        var files = document.getElementById('up_files').files[0]; //파일 객체
 
        var reader = new FileReader();
 
        //파일정보 수집        
        reader.onload = (function(theFile) 
        {
            return function(e) 
            {
                //이미지 뷰
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
<!-- 1. 전송하고자 하는 입력 폼을 <form>과 </form>사이에 위치해놓는다. 
2. action 값은 데이터를 전송받아서 처리할 Controller url로 설정한다. 
3. method를 반드시 post로 설정해준다. get으로 설정시 parameter들이 url에 따라간다. 
4. enctype을 multipart/form-data로 설정한다. 
5. <form>과 </form>사이에 input type submit버튼을 위치시킨다. --> 
<form action="file_upload" id="fileUpload" name="fileUpload" method="post" enctype="multipart/form-data"> 
이름 : <input type="text" name="name" id="cmd" value="namevla"><br>
<input type="file" id="up_files" name="up_files" onchange="handleFileSelect()"/>
<input type="file" id="up_files2" name="up_files2" onchange="handleFileSelect()"/>
<input type="file" id="up_files3" name="up_files3" onchange="handleFileSelect()"/>
<div id="list"></div><input type="submit" name="업로드" value="제출"><br> </form>
</body>
</html>