<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.9/css/all.css"
	integrity="sha384-5SOiIsAziJl6AWe0HWRKTXlfcSHKmYV4RBF18PPJ173Kzn7jzMyFuTtk8JA7QQG1"
	crossorigin="anonymous"></link>
<title>TaiwanFilms</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/movie.css"
	type="text/css">
<style>
body {
	background: #f1f1f1;
}

.activityContent {
	display: none;
	height: 580px;
	overflow:hidden;  
	} 


.activity-content {
	width: 80%;
	padding: 10px;
	border-radius: 10px;
	margin: 10px;
	font-weight: bold;
	background: white;
	display: inline-block; 
	height: 140px;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
	transition: 0.3s;
	border-radius: 10px;
}  

.activity-content:hover {
	transform: translateY(-10px);
	box-shadow: 0 15px 25px rgba(0, 0, 0, 0.15);
}
     
.activity-content-show{
	display: inline-block;
}

.activity-content-show {
	width: 80%;
	padding: 10px;
	border-radius: 10px;
	margin: 10px;
	font-weight: bold;
	display: inline-block;
}

.allActivityM-width {
	width: 25%;
	height: 200px;
	display: inline-block;
}


.acitivityUpdateWidth {
	width: 19%;
	padding: 20px;

	display: inline-block;
	vertical-align: top;
	text-align: center;
	color: black;
}

.activityUpdateButton {
	width: 7%;
	display: inline-block;
	margin-top: 12px;
	text-align: center;
}

.activityUpdateButtonStyle {
	width: 100%;
	color: white;
	background-color: red;
	padding: 3px;
	border-radius: 3px
}

#category .change-category div{
color: #EA0082;

}
#category .change-category .change-menu .buttonBorder-active{
border-bottom: 5px solid #EA0082;
} 

</style>


</head>
<body>


	<jsp:include page="../fragment/menu.jsp" /> 



	<div class="section" id="popular">
		<div class="section" id="category">
			<div class="width-limit">
				<h1>Activities</h1>

				<div class="change-category">
					<div class="change-menu">
						<div class="buttonBorder-active buttonBorder" id="new-button">最新發起</div>
						<div class="buttonBorder" id="trend-button">趨勢話題</div>
						<div class="buttonBorder" id="coming-button">即將開始</div>
						<div class="buttonBorder" id="end-button">即將結束</div>
						<a href="allActivity">
							<div style="float: right;width: 10%;color: black; font-weight: bold;">瀏覽全部活動</div>
						<!-- <a href="allActivityM">
							<div
								style="float: right; width: 10%; color: black; font-weight: bold;">全部活動頁面</div>
						</a> -->
						</a>
					</div>
				</div>
			</div>

			<div class="activityContent active" id="new">
				<div class="activity-content-show">
					<div class="acitivityUpdateWidth">活動照片</div>
					<div class="acitivityUpdateWidth">活動主題</div>
					<div class="acitivityUpdateWidth">活動廠商</div>
					<div class="acitivityUpdateWidth">活動開始時間</div>
					<div class="activityUpdateButton"></div>
				</div>
				<c:forEach var='activity' items='${activityList}'>
					<c:if test="${activity.category == '1'}">
						<a
							href="<spring:url value='/activity?id=${activity.activityId}' />"
							class="anchor-style"> <a
							href="<spring:url value='/queryMyActivity/${activity.activityId}' />">
								<div class="activity-inner"
									data-number="${activity.activityWatched}">
									<div class="activity-content">       
										<div class="activityThumb"
									style="background-image: url('getPicture/${activity.activityId}');background-size:cover;height: 120px;width:20%;display: inline-block;	">
								</div>
										<%-- <div class="acitivityUpdateWidth"style="color:red">${activity.activityNumber}</div> --%>
										<div class="acitivityUpdateWidth" style="font-size: 18px;">${activity.activityTitle}</div>
										<div class="acitivityUpdateWidth">${activity.activityAuthor}</div>
										<div class="acitivityUpdateWidth">${activity.startTime}</div>
										<div class="acitivityUpdateWidth"><i class="fas fa-eye"></i>${activity.activityWatched}</div>
									</div> 	
								</div>    
							</a> 
						</a> 
					</c:if>
				</c:forEach>
			</div>

			<div class="activityContent" id="trend">
				<div class="activity-content-show">
					<div class="acitivityUpdateWidth">活動照片</div>
					<div class="acitivityUpdateWidth">活動主題</div>
					<div class="acitivityUpdateWidth">活動廠商</div>
					<div class="acitivityUpdateWidth">活動開始時間</div>
					<div class="activityUpdateButton"></div>
				</div>
				<c:forEach var='activity' items='${activitiesViews}'>
					<c:if test="${activity.category == '1'}">
						<a
							href="<spring:url value='/activity?id=${activity.activityId}' />"
							class="anchor-style"> <a
							href="<spring:url value='/queryMyActivity/${activity.activityId}' />">
								<div class="activity-inner"
									data-number="${activity.activityWatched}">
									<div class="activity-content">       
										<div class="activityThumb"
									style="background-image: url('getPicture/${activity.activityId}');background-size:cover;height: 120px;width:20%;display: inline-block;	">
								</div>
										<%-- <div class="acitivityUpdateWidth"style="color:red">${activity.activityNumber}</div> --%>
										<div class="acitivityUpdateWidth" style="font-size: 18px;">${activity.activityTitle}</div>
										<div class="acitivityUpdateWidth">${activity.activityAuthor}</div>
										<div class="acitivityUpdateWidth">${activity.startTime}</div>
										<div class="acitivityUpdateWidth"><i class="fas fa-eye"></i>${activity.activityWatched}</div>
									</div> 	
								</div>    
							</a> 
						</a> 
					</c:if>
				</c:forEach>
			</div>

			<div class="activityContent" id="coming">
				<div class="activity-content-show">
					<div class="acitivityUpdateWidth">活動照片</div>
					<div class="acitivityUpdateWidth">活動主題</div>
					<div class="acitivityUpdateWidth">活動廠商</div>
					<div class="acitivityUpdateWidth">活動開始時間</div>
					<div class="activityUpdateButton"></div>
				</div>
				<c:forEach var='activity' items='${activitiesStart}'>
					<c:if test="${activity.category == '3'}">
						<a
							href="<spring:url value='/activity?id=${activity.activityId}' />"
							class="anchor-style"> <a
							href="<spring:url value='/queryMyActivity/${activity.activityId}' />">
								<div class="activity-inner"
									data-number="${activity.activityWatched}">
									<div class="activity-content">       
										<div class="activityThumb"
									style="background-image: url('getPicture/${activity.activityId}');background-size:cover;height: 120px;width:20%;display: inline-block;	">
								</div>
										<%-- <div class="acitivityUpdateWidth"style="color:red">${activity.activityNumber}</div> --%>
										<div class="acitivityUpdateWidth" style="font-size: 18px;">${activity.activityTitle}</div>
										<div class="acitivityUpdateWidth">${activity.activityAuthor}</div>
										<div class="acitivityUpdateWidth">${activity.startTime}</div>
										<div class="acitivityUpdateWidth"><i class="fas fa-eye"></i>${activity.activityWatched}</div>
									</div> 	
								</div>    
							</a> 
						</a> 
					</c:if>
				</c:forEach>
			</div>

 

			<div class="activityContent" id="end">
				<div class="activity-content-show">
					<div class="acitivityUpdateWidth">活動照片</div>
					<div class="acitivityUpdateWidth">活動主題</div>
					<div class="acitivityUpdateWidth">活動廠商</div>
					<div class="acitivityUpdateWidth">活動開始時間</div>
					<div class="activityUpdateButton"></div>
				</div>
				<c:forEach var='activity' items='${activitiesEnd}'>
					<c:if test="${activity.category == '1'}">
						<a
							href="<spring:url value='/activity?id=${activity.activityId}' />"
							class="anchor-style"> <a
							href="<spring:url value='/queryMyActivity/${activity.activityId}' />">
								<div class="activity-inner"
									data-number="${activity.activityWatched}">
									<div class="activity-content">       
										<div class="activityThumb"
									style="background-image: url('getPicture/${activity.activityId}');background-size:cover;height: 120px;width:20%;display: inline-block;	">
								</div>
										<%-- <div class="acitivityUpdateWidth"style="color:red">${activity.activityNumber}</div> --%>
										<div class="acitivityUpdateWidth" style="font-size: 18px;">${activity.activityTitle}</div>
										<div class="acitivityUpdateWidth">${activity.activityAuthor}</div>
										<div class="acitivityUpdateWidth">${activity.startTime}</div>
										<div class="acitivityUpdateWidth"><i class="fas fa-eye"></i>${activity.activityWatched}</div>
									</div> 	
								</div>    
							</a> 
						</a> 
					</c:if>
				</c:forEach>
			</div>
		</div>
	</div>






			<script>
				$('#new-button').click(function() {
					$('.activityContent').removeClass("active active-bottom");
					$('#new').addClass("active");
					$('.buttonBorder').removeClass("buttonBorder-active");
					$('#new-button').addClass("buttonBorder-active");

				});
				$('#trend-button').click(function() {
					$('.activityContent').removeClass("active active-bottom");
					$('#trend').addClass("active");
					$('.buttonBorder').removeClass("buttonBorder-active");
					$('#trend-button').addClass("buttonBorder-active");
				});
				$('#coming-button').click(function() {
					$('.activityContent').removeClass("active active-bottom");
					$('#coming').addClass("active");
					$('.buttonBorder').removeClass("buttonBorder-active");
					$('#coming-button').addClass("buttonBorder-active");
				});
				$('#end-button').click(function() {
					$('.activityContent').removeClass("active active-bottom");
					$('#end').addClass("active");
					$('.buttonBorder').removeClass("buttonBorder-active");
					$('#end-button').addClass("buttonBorder-active");
				});
			</script>
</body>
</html>