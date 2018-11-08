<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My page</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="/pickme/resources/css/bootstrap.min.css">


<link href='https://fonts.googleapis.com/css?family=PT+Serif:400,700' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=PT+Sans:400,700' rel='stylesheet' type='text/css'>

<link rel="preload" href="/pickme/resources/css/swell-2472ebd5fc.css" as="style" onload="this.rel='stylesheet'">
<link rel="stylesheet" href="/pickme/resources/css/style.css">



<script src="/pickme/resources/js/modernizr.js" type="993585227198c70882fa5f41-text/javascript"></script>

</head>

<body>
<div class="banner" id="home"></div>

<header class="header">
<div class="top-nav"></div>

<div class="row">
<div class="col-md-12 text-center user">
  <img src="/pickme/resources/images/user.jpg" alt="Me" class="img-circle">
<h1>아이디</h1>
<h4>한 줄 소개</h4>
<div class="social-icons">
<a href="#"><i class="fa fa-facebook"></i></a>
<a href="#"><i class="fa fa-twitter"></i></a>
<a href="#"><i class="fa fa-instagram"></i></a>
<a href="#"><i class="fa fa-linkedin"></i></a>
<a href="#"><i class="fa fa-google-plus"></i></a>
</div>
</div>
<!-- main nav -->
<div class="col-md-12">
<div class="main-nav">
<nav class="navbar navbar-default">
<div class="container-fluid">
<!-- main > header nav -->
<div class="navbar-header">
<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
<span class="sr-only">Toggle navigation</span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
</button>
</div>
<!-- main > footer nav -->
<div class="collapse navbar-collapse text-center" id="bs-example-navbar-collapse-1">
<ul class="nav navbar-nav">
<li><a href="/pickme/fList.pr">Follower</a></li>
<li><a href="/pickme/fiList.pr">Following</a></li>
<li><a href="/pickme/mPicks.pr">My Picks</a></li>
<li><a href="/pickme/mPage.pr">My Page</a></li>
</ul>
</div>
</div>
</nav>
</div>
</div>
</div>
</header>
	

<section class="works text-center">

<div class="container">
<div class="row">
<div class="col-md-12">
<h2>My latest Picks</h2>
<ul class="list-inline">
<li class="filter active" data-filter=".all">All</li>
<li class="filter" data-filter=".web-development">Web Development</li>
<li class="filter" data-filter=".web-design">Web Design</li>
<li class="filter" data-filter=".website-customization">Website Customisation</li>
</ul>
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

</div>
</div>
</section>

<%@ include file="../common/footer.jsp" %>

<script data-cfasync="false" src="/pickme/resources/js/jquery-2.1.1.js" type="5202d73d56a5dd51f2120085-text/javascript"></script>
<script src="/pickme/resources/js/jquery.mixitup.js" type="5202d73d56a5dd51f2120085-text/javascript"></script>
<script src="/pickme/resources/js/smoothscroll.js" type="5202d73d56a5dd51f2120085-text/javascript"></script>
<script src="/pickme/resources/js/bootstrap.min.js" type="5202d73d56a5dd51f2120085-text/javascript"></script>
<script src="/pickme/resources/js/custom.js" type="5202d73d56a5dd51f2120085-text/javascript"></script>
<script src="/pickme/resources/js/rocket-loader.min.js" defer=""></script></body>
</html>

</body>
</html>