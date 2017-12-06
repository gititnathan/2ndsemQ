<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
	<title>mp3업로드 할 것들</title>
	<style>
        #order_container {position:absolute;left:0px;text-align:right;margin:5px;}
    </style>
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
 <script src="js\jquery-3.2.1.min.js"></script>

</head>	
<body>
<div align="center">
	<form  id="fileUpload" name="fileUpload"  action="board_write" method="post" 
	onsubmit="return check()" enctype= "multipart/form-data">
	<table border="1" width="500">
		<tr bgcolor="yellow">
			<th colspan="2">앨범등록하기</th>
		</tr>
		<tr>
			<input type="hidden" name="artistnum" value="0" />
			<input type="hidden" name="albumnum" value="0" />
			<th bgcolor="yellow" size="50">앨 범 이 름</th>
			<td><input type="text" name="albumtitle" class="box"></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">앨범 자켓 이미지</th>
			<td><input type="file" id="up_files" name="albumImage" onchange="handleFileSelect()"/><br>
			<div id="list"></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">음악 파일</th>
			<td><input type="file" id="up_files" name="musicFiles" onchange="handleFileSelect()"/></td>
		</tr>
	  <div class="form-group">
        <label class="col-xs-3 control-label">Options</label>
        <div class="col-xs-5">
            <input type="text" class="form-control" name="option[]" />
        </div>
        <div class="col-xs-4">
            <button type="button" class="btn btn-default addButton"><i class="fa fa-plus"></i></button>
        </div>
    </div>

    <!-- The option field template containing an option field and a Remove button -->
    <div class="form-group hide" id="optionTemplate">
        <div class="col-xs-offset-3 col-xs-5">
            <input class="form-control" type="text" name="option[]" />
        </div>
        <div class="col-xs-4">
            <button type="button" class="btn btn-default removeButton"><i class="fa fa-minus"></i></button>
        </div>
    </div>

    <div class="form-group">
        <div class="col-xs-5 col-xs-offset-3">
            <button type="submit" class="btn btn-default">Validate</button>
        </div>
    </div>
		
	<script>
$(document).ready(function() {
    // The maximum number of options
    var MAX_OPTIONS = 5;

    $('#fileUpload')
        .formValidation({
            framework: 'bootstrap',
            icon: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                question: {
                    validators: {
                        notEmpty: {
                            message: 'The question required and cannot be empty'
                        }
                    }
                },
                'option[]': {
                    validators: {
                        notEmpty: {
                            message: 'The option required and cannot be empty'
                        },
                        stringLength: {
                            max: 100,
                            message: 'The option must be less than 100 characters long'
                        }
                    }
                }
            }
        })

        // Add button click handler
        .on('click', '.addButton', function() {
            var $template = $('#optionTemplate'),
                $clone    = $template
                                .clone()
                                .removeClass('hide')
                                .removeAttr('id')
                                .insertBefore($template),
                $option   = $clone.find('[name="option[]"]');

            // Add new field
            $('#fileUpload').formValidation('addField', $option);
        })

        // Remove button click handler
        .on('click', '.removeButton', function() {
            var $row    = $(this).parents('.form-group'),
                $option = $row.find('[name="option[]"]');

            // Remove element containing the option
            $row.remove();

            // Remove field
            $('#fileUpload').formValidation('removeField', $option);
        })

        // Called after adding new field
        .on('added.field.fv', function(e, data) {
            // data.field   --> The field name
            // data.element --> The new field element
            // data.options --> The new field options

            if (data.field === 'option[]') {
                if ($('#fileUpload').find(':visible[name="option[]"]').length >= MAX_OPTIONS) {
                    $('#fileUpload').find('.addButton').attr('disabled', 'disabled');
                }
            }
        })

        // Called after removing the field
        .on('removed.field.fv', function(e, data) {
           if (data.field === 'option[]') {
                if ($('#fileUpload').find(':visible[name="option[]"]').length < MAX_OPTIONS) {
                    $('#fileUpload').find('.addButton').removeAttr('disabled');
                }
            }
        });
});
</script>	
	
		<tr>
			<th bgcolor="yellow" width="20%">장르</th>
			<td><input type="text" name="genre" class="box" size="50"></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">뮤비 링크</th>
			<td><input type="text" name="mvLink" class="box" size="50"></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">세션 및 작곡</th>
			<td><textarea name="contributor" rows="13" cols="50" class="box"></textarea></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">앨 범 소 개</th>
			<td><textarea name="albumDesc" rows="13" cols="50" class="box"></textarea></td>
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