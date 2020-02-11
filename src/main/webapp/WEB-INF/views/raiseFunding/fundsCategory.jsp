<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/FlyingV.css"
	type="text/css">
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/menuStyle.css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/UtilTool.js" ></script>
</head>
<body>
<jsp:include page="../fragment/menu.jsp" />
	<div class="section" id="category">
		<div class="width-limit">
			<!-- 分頁按鈕 -->
			<div class="change-category">
				<div class="change-menu">
					<div class="buttonBorder buttonBorder-active" id="hot-button">熱門項目</div>
					<div class="buttonBorder" id="new-button">最新發起</div>
					<div class="buttonBorder" id="end-button">即將結束</div>
				</div>
			</div>


			<!-- 熱門分頁區塊 -->
			<div>   <!-- 可以在這個上面設100%跟高(有東西的話就會撐大了) 然後用margin-top跟上面元素有點距離 -->
				<div class="category-content active" id="hot">
					<c:forEach items="${Fundings}" var="proj">
						<div class="inner" id="project${proj.projBean.projectId}">
							<div class="projectThumb">
							
								<img
									src="${pageContext.request.contextPath}/getProject/photo/${proj.projBean.projectId}">
							</div>
							<div class="project">
								<p class="title"></p>
								<p class="small-title">${proj.projBean.projectName}</p>
								<p class="content">${proj.projBean.projDescript}</p>
							</div>
							<div class="downMeta">
								<div class="wholePercent"></div>
								<div class="realPercent" style="width:${proj.percent}%"></div>
							</div>
							<div class="plan">
								<span class="money">$ ${proj.fundsNow}</span> <span
									class="percent">${proj.percent}%</span> <span class="date">還剩
									<strong id="dayCount" data-endDay="${proj.dateEnd}"></strong>天
								</span>
							</div>
						</div>
					</c:forEach>
				</div>
				<div class="category-content" id="new">
					<c:forEach items="${Fundings}" var="proj">
						<div class="inner" id="project${proj.projBean.projectId}">
							<div class="projectThumb">
							
								<img
									src="${pageContext.request.contextPath}/getProject/photo/${proj.projBean.projectId}">
							</div>
							<div class="project">
								<p class="title"></p>
								<p class="small-title">${proj.projBean.projectName}</p>
								<p class="content">${proj.projBean.projDescript}</p>
							</div>
							<div class="downMeta">
								<div class="wholePercent"></div>
								<div class="realPercent" style="width:${proj.percent}%"></div>
							</div>
							<div class="plan">
								<span class="money">$ ${proj.fundsNow}</span> <span
									class="percent">${proj.percent}%</span> <span class="date">還剩
									<strong id="dayCount" data-endDay="${proj.dateEnd}"></strong>天
								</span>
							</div>
						</div>
					</c:forEach>
				</div>
				<div class="category-content" id="end">
					<c:forEach items="${Fundings}" var="proj">
						<div class="inner" id="project${proj.projBean.projectId}">
							<div class="projectThumb">
							  
								<img
									src="${pageContext.request.contextPath}/getProject/photo/${proj.projBean.projectId}">
							</div>
							<div class="project">
								<p class="title"></p>
								<p class="small-title">${proj.projBean.projectName}</p>
								<p class="content">${proj.projBean.projDescript}</p>
							</div>
							<div class="downMeta">
								<div class="wholePercent"></div>
								<div class="realPercent" style="width:${proj.percent}%"></div>
							</div>
							<div class="plan">
								<span class="money">$ ${proj.fundsNow}</span> <span
									class="percent">${proj.percent}%</span> <span class="date">還剩
									<strong id="dayCount" data-endDay="${proj.dateEnd}"></strong>天
								</span>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<script>
		//點擊切換
			$("#hot-button").click(function(){
				$(".buttonBorder").removeClass("active buttonBorder-active");
				$(this).addClass("active buttonBorder-active");	
			});
			$("#new-button").click(function(){
				$(".buttonBorder").removeClass("active buttonBorder-active");
				$(this).addClass("active buttonBorder-active");	
			});
			$("#end-button").click(function(){
				$(".buttonBorder").removeClass("active buttonBorder-active");
				$(this).addClass("active buttonBorder-active");	
			});
	
		
	
		$(".inner").click(function(){
			console.log("success");
			var id = $(this).attr("id");
			var url = "${pageContext.request.contextPath}/"+id;
			$(location).attr('href',url);

		});
		var dayCount = $("#dayCount").attr("data-endDay");
	    $("#dayCount").text(DaysCountdown(dayCount));
	</script>
</body>
</html>