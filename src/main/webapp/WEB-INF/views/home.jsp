    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Roboto'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
html,body,h1,h2,h3,h4,h5,h6 {font-family: "Roboto", sans-serif}
</style>
<body class="w3-light-grey">

<!-- Page Container -->
<div class="w3-content w3-margin-top" style="max-width:1400px;">

  <!-- The Grid -->
  <div class="w3-row-padding">
  
    <!-- Left Column -->
    <div class="w3-third">
    
      <div class="w3-white w3-text-grey w3-card-4">
        <div class="w3-display-container">
		  <p>앨범명</p>
          <p>아티스트 이름</p>
          <img src="${pageContext.request.contextPath}/resources/redvelvet.jpg" style="width:100%" alt="앨범이미지">
          <div class="w3-display-bottomleft w3-container w3-text-black">
          </div>
        </div>
        <div class="w3-container">
          
          <p><i class="fa fa-home fa-fw w3-margin-right w3-large w3-text-teal"></i>사는 곳</p>
          <p><i class="fa fa-music fa-fw w3-margin-right w3-large w3-text-teal"></i>장르</p>
          <p><i class="fa fa-group fa-fw w3-margin-right w3-large w3-text-teal"></i>좋아하는 아티스트</p>
          <hr>

          <p class="w3-large"><b><i class="fa fa-asterisk fa-fw w3-margin-right w3-text-teal"></i></b></p>
          <p>팁 주기 버튼 <input type="button" onload=""  class="w3-light-grey w3-round-xlarge w3-small" value="팁주기"></p>
          <p><a href="">굿즈 구매 웹사이트 링크</a></p>
          <p>Trending Music Playlist</p>
          <div class="w3-light-grey w3-round-xlarge w3-small">
            <div class="w3-container w3-center w3-round-xlarge w3-teal" style="width:75%">75%</div>
          </div>
          <p>광고</p>
          <div class="w3-light-grey w3-round-xlarge w3-small">
            <div class="w3-container w3-center w3-round-xlarge w3-teal" style="width:50%">50%</div>
          </div>
          <br>

          <br>
        </div>
      </div><br>

    <!-- End Left Column -->
    </div>

    <!-- Right Column -->
    <div class="w3-twothird">
    
      <div class="w3-container w3-card w3-white w3-margin-bottom">
        <h2 class="w3-text-grey w3-padding-16"><i class="fa fa-suitcase fa-fw w3-margin-right w3-xxlarge w3-text-teal"></i>음악목록</h2>
        <div class="w3-container">
          <h5 class="w3-opacity"><b>음악 리스트</b></h5>
          <h6 class="w3-text-teal"><i class="fa fa-headphones fa-fw w3-margin-right"></i>Jan 2015 -	<span class="w3-tag w3-teal w3-round">Current</span></h6>
          <p align="center"><i class="fa fa-backward fa-fw w3-margin-right"></i><i class="fa fa-play fa-fw w3-margin-right"></i><i class="fa fa-forward fa-fw w3-margin-right"></i></p>
          <hr>
        </div>
        <div class="w3-container">
          <h5 class="w3-opacity"><b>앨범 다운로드</b> <input type="button" onload=""  class="w3-light-grey w3-round-xlarge w3-small" value="다운로드 하기"></h5>
          <hr>
        </div>
        <div class="w3-container">
          <h5 class="w3-opacity"><b>음악목록</b></h5>
          <h6 class="w3-text-teal"><i class="fa fa-calendar fa-fw w3-margin-right"></i>Jun 2010 - Mar 2012</h6>
          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. </p><br>
        </div>
      </div>


	<!-- right under -->
      <div class="w3-container w3-card w3-white">
        <h6 class="w3-text-grey w3-padding-16"><i class="fa fa-certificate fa-fw w3-margin-right w3-xxlarge w3-text-teal"></i>
        <input  class="w3-light-white w3-round-xlarge w3-small"  type="button" onload="" value="앨범영상">
        <input class="w3-light-white w3-round-xlarge w3-small"  type="button" onload="" value="앨범설명">
        <input class="w3-light-white w3-round-xlarge w3-small"  type="button" onload="" value="연락처"></h6>
        <div class="w3-container">
          <hr>
        </div>
        <div class="w3-container">
          <p>본인 연락처(이메일) / 외부 SNS 링크들/ 매니저 연락처</p><br>
        </div>
      </div>
	

    <!-- End Right Column -->
    </div>
    
  <!-- End Grid -->
  </div>
  
  <!-- End Page Container -->
</div>

<footer class="w3-container w3-teal w3-center w3-margin-top">
  <p>Find me on social media.</p>
  <i class="fa fa-facebook-official w3-hover-opacity"></i>
  <i class="fa fa-instagram w3-hover-opacity"></i>
  <i class="fa fa-snapchat w3-hover-opacity"></i>
  <i class="fa fa-pinterest-p w3-hover-opacity"></i>
  <i class="fa fa-twitter w3-hover-opacity"></i>
  <i class="fa fa-linkedin w3-hover-opacity"></i>
  <p>Powered by <a href="https://www.w3schools.com/w3css/default.asp" target="_blank">w3.css</a></p>
</footer>

</body>
</html>









