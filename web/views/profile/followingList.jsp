<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.user.model.vo.User"%>
<%
   ArrayList<User> list = (ArrayList<User>)request.getAttribute("list");
   int followingCount = (Integer)request.getAttribute("followingCount");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Pick Page</title>

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
<!-- 프로필 사진 업을 때 기본이미지 보여주기 -->
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

<section class="works text-center">

<div class="outer">
   <h2 align="center">Following</h2>
   <h5><%=followingCount %>명</h5>
      <br /><br /><br />
      
      <div class="followerArea container col-sm-4">
         
         <% for (User followingList : list) { %>
         <div class="row">
            <div class="following-list col" align="center" 
            onclick="location.href='<%= request.getContextPath() %>/uPage.pr?uno='+<%=followingList.getUserNo() %>">
               <% if(user.getProfile() != null) {%>
                 <img src="/pickme/resources/profileImage/<%= followingList.getProfile() %>" alt="Me" class="rounded-circle attr">
               <% } else{ %>
               <img src="/pickme/resources/profileImage/generalprofile.jpg" alt="Me" class="rounded-circle attr">
               <% }%>
            </div>
            <div class="col">
               <%= followingList.getUserId() %> 
            </div>
            <div class="col">
               <button value=<%= followingList.getUserNo() %> >follow</button>
            </div>
         </div>
         <% } %>
      </div>   
</div>
</section>
<%@ include file="../common/footer.jsp" %>


<script src="/pickme/resources/js/jquery-3.3.1.min.js"></script>

<script>

   function move(){
      alret("dd");
   };
</script>
</html>

</body>
</html>