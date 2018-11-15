<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<h5 align="center">성별 pick</h5>
		<div id="PieChart"></div>
		
		</div>
		
		
	</div>
	
	<%@ include file="../common/footer.jsp" %>
	

	<script>
		var chartAge = bb.generate({
		    
		    data: {
		    	bindto: "#chart",
		    	type:"bar",
		        columns: [
		            ["pick1", 30, 200, 100, 170, 150],
		            ["pick2", 130, 100, 140, 35, 110]
		        ]
		},
		        
		    axis:{
		    	x : {
		    		type : "category",
		    		categories:[
		    			"10대↓","20대","30대","40대","50대↑"]
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
			  bindto: "#PieChart"
			});

	</script>
<% } %>
</body>
</html>