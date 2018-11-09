<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Pick Page</title>


<link rel="preload" href="/pickme/resources/css/swell-2472ebd5fc.css" as="style" onload="this.rel='stylesheet'">

<style>
	
</style>
</head>
<body>

<%@ include file="../common/header.jsp" %>


<div class="col-md-12 text-center user">
  <img src="/pickme/resources/images/user.jpg" alt="Me" class="rounded-circle">
<h2>아이디</h2>
<h3>한 줄 소개</h3>

<a href="/pickme/fList.pr">Follower</a>
<a href="/pickme/fiList.pr">Following</a>
<a href="/pickme/mPicks.pr">My Picks</a>
<a href="/pickme/mPage.pr">My Page</a>

</div>




<section class="page-section page-section--vote">


  <div class="page-section__content">
    <header class="page-section__header">
      <h2 class="page-section__header__title page-section__header__title--vote">
        What's Your Pick?</h2></header>
       
        
        <div class="live-swell">
          <div class="live-swell__pics">
            <div id="live-swell-img-a" class="live-swell__pics__pic live-swell__pics__pic--a">

            </div>
            <div id="live-swell-img-b" class="live-swell__pics__pic live-swell__pics__pic--b">
              
            </div>
            <div class="live-swell__results">
              <div id="live-swell-result-a" class="live-swell__results__result live-swell__results__result--a option option-a">
              </div>
              <div id="live-swell-result-b" class="live-swell__results__result live-swell__results__result--b option option-b">
                57%</div>
              </div>
              <div class="live-swell__pics__or">
                  or</div>
                </div>
                      </div>
                    </div>
                  </section>





<%@ include file="../common/footer.jsp" %>
</body>

</html>