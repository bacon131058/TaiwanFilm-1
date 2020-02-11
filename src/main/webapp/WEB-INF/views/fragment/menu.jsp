<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>




<!-- 	<link href="https://fonts.googleapis.com/css?family=Mukta&display=swap" rel="stylesheet">

	<link href="https://fonts.googleapis.com/css?family=ZCOOL+XiaoWei&display=swap" rel="stylesheet"> -->
<!-- <link id="MonoTypeFontApiFontTracker" type="text/css" rel="stylesheet" href="https://fast.fonts.net/t/1.css?apiType=js&amp;projectid=b2d946f7-734c-4b45-a07f-3923a384b0dd"> -->
	

	<div class="fixed"></div>
	<div class="left-bar">  
		<a href="/TaiwanFilm" style="text-decoration: none">
			<div class='goToMid-l' style="text-decoration: none">
				<div>Taiwan Films</div>   
			</div>	
		</a> 
	</div>
	<div class="right-bar">
		<div class="goToMid">
			<div class="menu-click">Menu</div>
			<!-- 移動時會有小點點隨著你移動到的地方變色 -->
			 <!-- <div class="dots">
				<div id="home-area" class="dot dot-pink"></div>
				<div id="activity-area" class="dot"></div>
				<div id="funds-area" class="dot"></div>
				<div id="movie-area" class="dot"></div>
			</div> -->
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
			
			<a href="messages">
			 <div class="menu-buttonStyle">留言板</div>
			</a>
			<c:if test="${sessionScope.members.memberMode == 2}">
			
			<a href="backstage">
				<div class="menu-buttonStyle">進入後台</div>
			</a>    
			</c:if>
		</div>

	</div>
	<div class="loginOrOut" style=" width:125px;">
			<div class="right-menu">

		<c:if test="${not empty sessionScope.members.email}">
			<div class="myAccount">
				<p style="z-index: 800"  onclick="memberButton()">${sessionScope.members.memberName}
				
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
				</p>
			</div>
		</c:if>
		<c:if test="${empty sessionScope.members.email}">
			<div class="myAccount">
				<a href="${pageContext.request.contextPath}/register">登入/註冊</a>
			</div>
		</c:if>
	</div>
		<div id="memberDetail"
		style="padding: 5px; display: none; width: 100px; height: 110px; background: #ebebeb; 
		position: absolute; right: 5px; top: 68px; z-index: 800">
		<a href="${pageContext.request.contextPath}/UpdateMember">修改個人資料</a> <br>
		<a href="${pageContext.request.contextPath}/member/purchase">個人贊助</a> <br>
		<a href="alterTicket">訂票資料</a> <br>
		<a href="${pageContext.request.contextPath}/logout">登出</a> 
	</div>
	</div>




<script>
	//登入登出
	function memberButton(){
		$("#memberDetail").fadeToggle(500); 
	}

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