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

	<%@ include file="../common/header.jsp" %>

	<div class="pm-section col-xs-12 col-md-8">
		<h1>pick1 세부 통계</h1>
		
		<div id="chart"></div>
		
		
	</div>
	
	<%@ include file="../common/footer.jsp" %>
	
	<script>
		var chart = bb.generate({
		    bindto: "#chart",
		    data: {
		        type: "bar",
		        columns: [
		            ["pick1", 30, 200, 100, 170, 150, 250],
		            ["pick2", 130, 100, 140, 35, 110, 50]
		        ]
		    }
		});
	</script>
</body>
</html>