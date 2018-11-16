<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*"%>
<% ArrayList<Integer> ageList1 = (ArrayList<Integer>)session.getAttribute("ageList1"); %>
<% ArrayList<Integer> ageList2 = (ArrayList<Integer>)session.getAttribute("ageList2"); %>
<% ArrayList<Integer> genderList = (ArrayList<Integer>)session.getAttribute("genderList"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pick 세부 통계</title>
<!-- Step 1) Load D3.js -->
<script src="https://d3js.org/d3.v5.min.js"></script>

<!-- Step 2) Load billboard.js with style -->
<script src="../../resources/stats/billboard.js"></script>

<!-- Load with base style -->
<link rel="stylesheet" href="../../resources/stats/billboard.css">

<!-- Or load different theme style -->
<link rel="stylesheet" href="../../resources/stats/insight.css">
<style>
	.gPie{
		
	}
</style>
</head>
<body>
<!--  세션에 유저정보 있는 사람만 내용 보여주기 -->
<% if( session.getAttribute("user") == null){ %>
	<%@ include file="../common/NotLogin.jsp" %>
<% }else { %>
	<%@ include file="../common/header.jsp" %>

	<div class="pm-section col-xs-12 col-md-8">
		<h1>pick1 세부 통계</h1>
		<div class="chart">
		<h5 align="center">연령별 pick</h5>
		<div id="chart"></div>
		<div class = "genderPie row">
			<div class = "col" id = "manPie" style = "visibility:hidden">
			<h5 align="center">성별 pick</h5>
			<div id="PieChart1" class = "gPie"></div>
			</div>
			<div class = "col" id = "mainPie">
			<h5 align="center">성별 pick</h5>
			<div id="PieChart2" class = "gPie"></div>
			</div>
			<div class = "col" id = "womanPie" style = "visibility:hidden">
			<h5 align="center">성별 pick</h5>
			<div id="PieChart3" class = "gPie"></div>
			</div>
		</div>
		
		</div>
		
		
	</div>
	
	<%@ include file="../common/footer.jsp" %>
	

	<script>
		var chartAge = bb.generate({
		    data: {
		    	bindto: "#chart",
		    	type:"bar",
		        columns: [
		        	["pick1", <%= ageList1.get(0)+ageList1.get(1) %>, <%= ageList1.get(1) %>, <%= ageList1.get(2) %>, <%= ageList1.get(3) %>, <%= ageList1.get(4) %>,<%= ageList1.get(5) %>],
		            ["pick2", <%= ageList2.get(0)+ageList2.get(1) %>, <%= ageList2.get(1) %>, <%= ageList2.get(2) %>, <%= ageList2.get(3) %>, <%= ageList2.get(4) %>,<%= ageList2.get(5) %>]
		            
		        ]
		},
		        
		    axis:{
		    	x : {
		    		type : "category",
		    		categories:[
		    			"10대↓","10대","20대","30대","40대","50대↑"]
		    	}
		    }
		    
		    
		});
		
		var chartGender = bb.generate({
			  data: {
			    columns: [
				["data1", 50],
				["data2", 120]
			    ],
			    type: "pie",
			    onclick: function(d, i) {
			    
				console.log("onclick", d, i);
			   },
			    onover: function(d, i) {
				console.log("onover", d, i);
			   },
			    onout: function(d, i) {
				console.log("onout", d, i);
			   }
			  },
			  bindto: "#PieChart1"
			});

		var chartGender = bb.generate({
			  data: {
			    columns: [
				["남성", <%=genderList.get(0)%>],
				["여성", <%=genderList.get(1)%>]
			    ],
			    type: "pie",
			    onclick: function(d, i) {
			    if(d.id == "data1"){
			    $("#PieChart1").attr("style","visibility:visible");
			    }else{
			    $("#PieChart3").attr("style","visibility:visible");	
			    }
				console.log("onclick", d, i);
			   },
			    onover: function(d, i) {
				console.log("onover", d, i);
			   },
			    onout: function(d, i) {
				console.log("onout", d, i);
			   }
			  },
			  bindto: "#PieChart2"
			});
		
		var chartGender = bb.generate({
			  data: {
			    columns: [
				["data1", 50],
				["data2", 120]
			    ],
			    type: "pie",
			    onclick: function(d, i) {
				console.log("onclick", d, i);
			   },
			    onover: function(d, i) {
				console.log("onover", d, i);
			   },
			    onout: function(d, i) {
				console.log("onout", d, i);
			   }
			  },
			  bindto: "#PieChart3"
			});
	</script>
<% } %>
</body>
</html>