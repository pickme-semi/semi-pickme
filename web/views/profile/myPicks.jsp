<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*, com.pick.model.vo.*"%>
<%
ArrayList<PickMe> myPick = (ArrayList<PickMe>)request.getAttribute("myPick");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Pick Page</title>


<link rel="preload" href="/pickme/resources/css/swell-2472ebd5fc.css" as="style" onload="this.rel='stylesheet'">

<style>
	.attr {
		height : 50px;
		position : relative;
		width : 50px;
			}
</style>
</head>
<body>

<%@ include file="../common/header.jsp" %>


<div class="col-md-12 text-center user">
 
<% if(user.getProfile() != null) {%>
  <img src="/pickme/resources/profileImage/<%= user.getProfile() %>" alt="Me" class="rounded-circle attr">
<% } else{ %>
	<img src="/pickme/resources/profileImage/generalprofile.jpg" alt="Me" class="rounded-circle attr">
<% }%>
<h2><%= user.getUserId() %></h2>
<h3>한 줄 소개</h3>

<a href="/pickme/fList.pr">Follower</a>
<a href="/pickme/fiList.pr">Following</a>
<a href="/pickme/mPicks.pr?uno=<%= user.getUserNo() %>">My Picks</a>
<a href="/pickme/mPage.pr">My Page</a>


</div>




<section class="page-section page-section--vote">


  <div class="page-section__content">
    <header class="page-section__header">
      <h2 class="page-section__header__title page-section__header__title--vote">
        What's Your Pick?</h2>
     </header>
       
        <% for (int i=0; i<myPick.size(); i++) {%>
        <div class="live-swell">
          <div class="live-swell__pics">
            <div id="live-swell-img-a" class="live-swell__pics__pic live-swell__pics__pic--a">

            </div>
            <div id="live-swell-img-b" class="live-swell__pics__pic live-swell__pics__pic--b">
              
            </div>
            
            <div class="live-swell__results">
              <div id="live-swell-result-a" class="live-swell__results__result live-swell__results__result--a option option-a">
              <img src="/pickme/resources/profileImage/"<%=myPick.get(i).getSelect_1() %>></img>
              </div>
              <div id="live-swell-result-b" class="live-swell__results__result live-swell__results__result--b option option-b">
                57%</div>
              </div>
              <div class="live-swell__pics__or">
                  or</div>
           </div>
           
         </div>
         <% } %>
   </div>
</section>





<%@ include file="../common/footer.jsp" %>
</body>

</html>