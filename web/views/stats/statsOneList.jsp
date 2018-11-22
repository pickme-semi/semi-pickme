<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*" import="com.stats.model.vo.*"%>
<% ArrayList<Integer> ageList1 = (ArrayList<Integer>)session.getAttribute("ageList1"); %>
<% ArrayList<Integer> ageList2 = (ArrayList<Integer>)session.getAttribute("ageList2"); %>
<% ArrayList<Integer> genderList = (ArrayList<Integer>)session.getAttribute("genderList"); %>
<% ArrayList<Integer> genderList1 = (ArrayList<Integer>)session.getAttribute("genderList1"); %>
<% ArrayList<Integer> genderList2 = (ArrayList<Integer>)session.getAttribute("genderList2"); %>
<% ArrayList<Integer> catList = (ArrayList<Integer>)session.getAttribute("catList"); %>
<% ArrayList<ResultVo> dayList = (ArrayList<ResultVo>)session.getAttribute("dayList"); %>
<% ArrayList<ResultVo> dayPick1List = (ArrayList<ResultVo>)session.getAttribute("dayPick1List"); %>
<% ArrayList<ResultVo> dayPick2List = (ArrayList<ResultVo>)session.getAttribute("dayPick2List"); %>
<% ArrayList<Integer> totalList = (ArrayList<Integer>)session.getAttribute("totalList"); %>
<% ArrayList<ResultVo> cat5List = (ArrayList<ResultVo>)session.getAttribute("cat5List"); %>
<% ArrayList<ResultVo> cat5Pick1List = (ArrayList<ResultVo>)session.getAttribute("cat5Pick1List"); %>
<% ArrayList<ResultVo> cat5Pick2List = (ArrayList<ResultVo>)session.getAttribute("cat5Pick2List"); %>


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
		width : 30%;
	}
	
	.nav>li>a{
	
		font-size: 12px;
	    color: black;
	    text-transform: uppercase;
	    text-decoration: none;
	    margin: 0 15px;
	
	}
	
	.nav>li>a.active {
	
		border-bottom:5px solid pink;
		
	}
	
	.nav-item:hover {
		border-bottom : 5px solid blue;
		color : none;
		text-decoration : none;
		
	}
	
	.catClass {
		width : 900px;
	}
</style>
</head>
<body>
<!--  세션에 유저정보 있는 사람만 내용 보여주기 -->
<% if( session.getAttribute("user") == null){ %>
	<%@ include file="../common/NotLogin.jsp" %>
<% }else { %>
	<%@ include file="../common/header.jsp" %>
	
	<div class="pm-section col-xs-12 col-md-8" style="margin-left:auto;margin-right:auto">
		<h1>pick1 세부 통계</h1>
		<br />
		<ul class="nav justify-content-left" >
		  <li class="nav-item active">
		    <a onclick="showDiv(total);" style="color : none;
			text-decoration : none;">전체</a>
		  </li>
		  <li class="nav-item">
		    <a onclick="showDiv(age);" style="color : none;
			text-decoration : none;">연령별 </a>
		  </li>
		  <li class="nav-item">
		    <a onclick="showDiv(gender);" style="color : none;
			text-decoration : none;">성별</a>
		  </li>
		  <li class="nav-item">
		    <a onclick="showDiv(category);" style="color : none;
			text-decoration : none;">카테고리별</a>
		  </li>
		  <li class="nav-item">
		    <a onclick="showDiv(date);" style="color : none;
			text-decoration : none;">일자별</a>
		  </li>
		</ul>
		<hr />
		
		
		<br />
		<div class="chart">
		<div id = "age" class = "divShow" style = "display:none">
		<h5 >연령별 pick</h5>
		<div id="chart"></div>
		</div>
		<div id = "gender" class = "divShow" style = "display:none">
		<div class = "genderPie row">
			<div class = "col gPie" id = "mainPie">
			<h5 align="center">성별 pick</h5>
			<div id="PieChart2" class = "gPie"></div>
			</div>
			<div class = "col gPie" id = "manPie" style = "display:none">
			<h5 align="center">남성 pick</h5>
			<div id="PieChart1" class = "gPie"></div>
			</div>
			<div class = "col gPie" id = "womanPie" style = "display:none">
			<h5 align="center">여성 pick</h5>
			<div id="PieChart3" class = "gPie"></div>
			</div>
		</div>
		</div>
		<div id = "total" class = "divShow" style = "display:">
			<h5>전체 통계</h5>
			<div id="DonutChart1"></div>
		</div>
		<div id = "date" class = "divShow" style = "display:none">
			<h5>일자별 통계</h5>
			<div id="AreaChart"></div>
		</div>
		<div id = "category" class = "divShow" style = "display:none">
			<h5>카테고리별 통계</h5>
			<div class = "catClass row col-sm-12">
				<br />
				<div class ="col col-sm-8">
				<p align="center">카테고리 일치 여부</p>
				<div id="DonutChart"></div>
				</div>
				<br />
				<div class="col col-sm-8">
				<p align="center">카테고리 Top 5</p>
				<div id="RadarChart"></div>
				</div>
			</div>
		</div>
		</div>
		
		
	</div>
	
	<%@ include file="../common/footer.jsp" %>
	

	<script>
		var chart = bb.generate({
			  data: {
			    columns: [
				["pick1", <%=totalList.get(0)%>],
				["pick2", <%=totalList.get(1)%>]
			    ],
			    type: "donut",
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
			  donut: {
			    title: "전체"
			  },
			  bindto: "#DonutChart1"
			});
		// 나이별 차트
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
		//성별차트
		var chartGender = bb.generate({
			  data: {
			    columns: [
				["pick1", <%=genderList1.get(0)%>],
				["pick2", <%=genderList1.get(1)%>]
			    ],
			    type: "pie",
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
			    	console.log("data" + d);
			    if(d.id == "남성"){
			    $("#manPie").attr("style","display:");
			    $("#womanPie").attr("style","display:none");
			    }else{
			    $("#womanPie").attr("style","display:");
			    $("#manPie").attr("style","display:none");
			    }
				console.log("onclick", d, i);
			   }
			  },
			  bindto: "#PieChart2"
			});
		
		var chartGender = bb.generate({
			  data: {
			    columns: [
				["pick1", <%=genderList2.get(0)%>],
				["pick2", <%=genderList2.get(1)%>]
			    ],
			    type: "pie",
			    onclick: function(d, i) {
				console.log("onclick", d, i);
			   }
			  },
			  bindto: "#PieChart3"
			});
		
		//카테고리 차트
		var categoryChart = bb.generate({
			  data: {
			    columns: [
				["카테고리가 일치하는 회원", <%=catList.get(0)%>],
				["카테고리가 일치하지 않는 회원", <%=catList.get(1)%>]
			    ],
			    type: "donut",
			    onclick: function(d, i) {
				console.log("onclick", d, i);
			   }
			  },
			  donut: {
			    title: "카테고리"
			  },
			  bindto: "#DonutChart"
			});
		
		//일자별 차트
		var chart = bb.generate({
			  data: {
			    columns: [
				["전체", 
				<%for(int i = 0; i<dayList.size(); i++){%>
				<%=dayList.get(i).getResult()%>,
				<%}%>
				],
				["pick1",
					<%for(int i = 0; i<dayPick1List.size(); i++){%>
					<%=dayPick1List.get(i).getResult()%>,
					<%}%>	
				],
				["pick2",
					<%for(int i = 0; i<dayPick2List.size(); i++){%>
					<%=dayPick2List.get(i).getResult()%>,
					<%}%>	
				]
			    ],
			    types: {
			           전체: "area",
			      pick1: "area",
			      pick2: "area"
			    }
			  },
		        
			    axis:{
			    	x : {
			    		type : "category",
			    		categories:[
			    			<%for(int i = 0 ; i<dayList.size(); i++){%>
			    			"<%=dayList.get(i).getDate()%>",
			    			<%}%>
			    			]
			    			}
			    	},
					  bindto: "#AreaChart"
			    
			});
		
		//카테고리 top5
		var chart = bb.generate({
		  data: {
			    x: "x",
			    columns: [
				["x", 
					<%for(int i = 0 ; i<cat5List.size(); i++){%>
	    			"<%=cat5List.get(i).getCategory()%>",
	    			<%}%>
					],
				["전체",
					<%for(int i = 0 ; i<cat5List.size(); i++){%>
	    			"<%=cat5List.get(i).getCatCount()%>",
	    			<%}%>
					],
			<%-- ["pick1", 
				<%for(int i = 0 ; i<cat5Pick1List.size(); i++){%>
    			"<%=cat5Pick1List.get(i).getCatCount()%>",
    			<%}%>
				],
			["pick2", 
				<%for(int i = 0 ; i<cat5Pick2List.size(); i++){%>
    			"<%=cat5Pick2List.get(i).getCatCount()%>",
    			<%}%>
    			] --%>
		    ],
		    type: "radar",
		    labels: true
		  },
		  radar: {
			  
		    
		    level: {
		      depth: 4
		    },
		    direction: {
		      clockwise: true
		    }
		  },
		  bindto: "#RadarChart"
		});
		
		
		function showDiv(id){
			$(".divShow").attr("style","display:none");
			$(id).attr("style","display:");
		}
	</script>
<% } %>
</body>
</html>