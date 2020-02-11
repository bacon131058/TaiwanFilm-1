<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css?family=Mukta&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="css/menuStyle.css" type="text/css">
<!-- 	<link href="https://fonts.googleapis.com/css?family=Mukta&display=swap" rel="stylesheet">

	<link href="https://fonts.googleapis.com/css?family=ZCOOL+XiaoWei&display=swap" rel="stylesheet"> -->
<!-- <link id="MonoTypeFontApiFontTracker" type="text/css" rel="stylesheet" href="https://fast.fonts.net/t/1.css?apiType=js&amp;projectid=b2d946f7-734c-4b45-a07f-3923a384b0dd"> -->

<body style="margin: 0">	

	<div class="fixed"></div>
	<div class="left-bar">  
		<a href="/TaiwanFilm">
			<div class='goToMid-l'>
				<div>Taiwan Films</div>   
			</div>	
		</a>
	</div>
	<div class="right-bar">
		<div class="goToMid">
			<div class="menu-click">Menu</div>
			<!-- 移動時會有小點點隨著你移動到的地方變色 -->
			 <div class="dots">
				<div id="home-area" class="dot dot-pink"></div>
				<div id="activity-area" class="dot"></div>
				<div id="funds-area" class="dot"></div>
				<div id="movie-area" class="dot"></div>
			</div>
		</div>
	</div>

	<div class="menu-bar">
		<div class="close-menu menu-buttonStyle">CLOSE</div>
		<div class="menu-button">
			<a href="activities">
				<div class="menu-buttonStyle">活動情報</div>
			</a>
			<a href="${pageContext.request.contextPath}/getAllProject">
				<div class="menu-buttonStyle">贊助電影</div>
			</a>
			<a href="">
				<div class="menu-buttonStyle">電影區</div>
			</a>
			<a href="movieIntro">
				<div class="menu-buttonStyle">網路訂票</div>
			</a>
		</div>
	</div>
	<div class="loginOrOut">
			<div class="right-menu">
		<c:if test="${sessionScope.members.memberId == 1}">		
			<div>
				<a href="activitiesM">活動後台</a>
			</div>
			<div>
				<a href="alterMovie">後台</a>
			</div>
			<div>
			<a href="${pageContext.request.contextPath}/_01_register/MemberBackstage">管理員後台</a>
			</div>
		</c:if>
		<c:if test="${not empty sessionScope.members.email}">
			<div class="myAccount">
				<span id="memberButton1"> ${sessionScope.members.memberName}</span>
				<!--  如果沒有給照片的話    性別是女生 就給女生照片   無照片跟男性給男生照片 -->
				<c:if test="${empty sessionScope.members.fileName}">
					<c:choose>
						<c:when test="${sessionScope.members.gender =='女生' }">
						<img width='20' height='20' src='img/NoImage_Female.jpg' />
						</c:when>
						<c:otherwise>
						<img width='20' height='20' src='img/NoImage_Male.png' />
						</c:otherwise>
					</c:choose>
				</c:if>
				<c:if test="${not empty sessionScope.members.fileName}">
				<img width='20' height='20' src='${pageContext.request.contextPath}/crm/picture/${sessionScope.members.memberId}' />
				</c:if>
			</div>
		</c:if>
		<c:if test="${empty sessionScope.members.email}">
			<div class="myAccount">
				<a href="${pageContext.request.contextPath}/register">登入/註冊</a>
			</div>
		</c:if>
	</div>
		<div id="memberDetail"
		style="padding: 5px; display: block; width: 100px; height: 200px; background: #ebebeb; 
		position: absolute; right: 5px; top: 68px; z-index: 800">
		<a href="${pageContext.request.contextPath}/UpdateMember">會員資料</a> <br>
		<a href="${pageContext.request.contextPath}/member/purchase">個人贊助</a> <br>
		<a href="alterTicket">訂票資料</a> <br>
		<a href="${pageContext.request.contextPath}/logout">登出</a>
	</div>   
	</div>


</body>

<script>
	//登入登出
	$("#memberButton1").click(function() {
	/* 	$("#memberDetail").fadeToggle(500); */
	$("#memberDetail").css({display:"inline-block"})
		alert("1");
	}); 



$(".menu-click").click(function() {
	$(".right-bar").hide(500);
	$(".menu-bar").css("display", "inline-block");
	$(".menu-bar").animate({
		right : "0%"
	});
	$(".fixed").show(500);
	$(".fixed").animate({
		width : "100%"
	});
	$('body').css('overflow', 'hidden');

});

$(".close-menu").click(function() {
	$(".right-bar").show();
	$(".menu-bar").animate({
		right : "-40%"
	});
	$(".indexWidth").animate({
		opacity : "1"
	});
	$(".fixed").hide(500);
	$(".fixed").animate({
		width : "0%"
	});
	$('body').css('overflow', 'visible');

});



</script>
<html>