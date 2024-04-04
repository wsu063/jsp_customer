<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩 -->
      <link
         href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
         rel="stylesheet"
         integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
         crossorigin="anonymous"
      />
<link rel="stylesheet" href="./css/style.css"/>
<link rel="stylesheet" href="./css/common.css" />
</head>
<body>
<div class="wrap">
	<header>
	<!-- nav 바 -->
            <nav class="navbar navbar-dark nav__bg">
               <div class="container">
                  <a class="navbar-brand" href="./index"
                     ><img src="/img/logo.png" alt="로고"/>   
                  </a>
                  <form class="d-flex" role="search">
                     <label for="q"></label>
                     <input
                        class="form-control me-2 head-search"
                        type="search"
                        placeholder="Search"
                        aria-label="Search"
                        id="q"
                        name="q"
                        alt="검색창"
                     />
                     <a class="searchBtn" alt="검색창">Search</a>
                  </form>
                  <button
                     class="navbar-toggler"
                     type="button"
                     data-bs-toggle="offcanvas"
                     data-bs-target="#offcanvasDarkNavbar"
                     aria-controls="offcanvasDarkNavbar"
                     aria-label="Toggle navigation"
                  >
                     <span class="navbar-toggler-icon"></span>
                  </button>
                  <div
                     class="offcanvas offcanvas-end text-bg-dark nav__bg"
                     tabindex="-1"
                     id="offcanvasDarkNavbar"
                  >
                     <div class="offcanvas-header">
                        <button
                           type="button"
                           class="btn-close btn-close-white"
                           data-bs-dismiss="offcanvas"
                           aria-label="Close"
                        ></button>
                     </div>
                     <div class="offcanvas-log">
                        <a href="./register" class="log__btn">
                           회원가입
                        </a>
                        <a href="#" class="log__btn">로그인</a>
                     </div>
                     <hr />
                     <div class="offcanvas-body">
                        <ul
                           class="navbar-nav justify-content-end flex-grow-1 pe-3"
                        >
                           <li class="nav-item">
                              <a
                                 class="nav-link active"
                                 aria-current="page"
                                 href="./menu.html?site=now_playing&page=1"
                                 >현재 상영중</a
                              >
                           </li>
                           <li class="nav-item">
                              <a
                                 class="nav-link active"
                                 aria-current="page"
                                 href="./menu.html?site=popular&page=1"
                                 >인기 영화</a
                              >
                           </li>
                           <li class="nav-item">
                              <a
                                 class="nav-link active"
                                 aria-current="page"
                                 href="./menu.html?site=top_rated&page=1"
                                 >최고 평점</a
                              >
                           </li>
                           <li class="nav-item">
                              <a
                                 class="nav-link active"
                                 aria-current="page"
                                 href="./menu.html?site=upcoming&page=1"
                                 >개봉 예정</a
                              >
                           </li>
                        </ul>
                     </div>
                  </div>
               </div>
               </nav>
	</header>
	<main>
		<table class="customer_list">
			<thead>
				<tr>
					<th>ID</th>
					<th>이름</th>
					<th>고객 점수</th>
					<th>고객 등급</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="customer" items="${customerList}"> 
				<tr>
					<td>${customer.id}</td>
					<td class="name"><a href="./detail?id=${customer.id}">${customer.name}</a></td>
					<td>${customer.point}</td>
					<td>
					<c:if test="${customer.grade eq 'bronze'}"> 
					<span style="color:rgb(165, 42, 42);">${customer.grade}</span>
					</c:if>
					<c:if test="${customer.grade eq 'silver'}"> 
					<span style="color: #c0c0c0;">${customer.grade}</span>
					</c:if>
					<c:if test="${customer.grade eq 'gold'}"> 
					<span style="color: gold;">${customer.grade}</span>
					</c:if>
					<c:if test="${customer.grade eq 'vip'}"> 
					<span style="rgb(229, 228, 226);">${customer.grade}</span>
					</c:if>
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="bt_wrap bt_list">
			<a href="register" class="log__btn">등록하기</a>
		</div>
		<div class="customer_page">
			<a href="#" class="bt first">&lt;&lt;</a>
			<a href="#" class="bt prev">&lt;</a>
			<a href="#" class="num on">1</a>
			<a href="#" class="num">2</a>
			<a href="#" class="num">3</a>
			<a href="#" class="num">4</a>
			<a href="#" class="num">5</a>
			<a href="#" class="bt next">&gt;</a>
			<a href="#" class="bt last">&gt;&gt;</a>
		</div>
	</main>
	<footer>
	<div>
               <div class="container foot">
                  <div >
                     <img src="/img/logo_big.png" alt="로고" />
                  </div>
                  <div>
                  <br/>
                     <p>
                        Address: Guro, Seoul, South Korea | Email:
                        wsu063@gmail.com |
                     </p>
                     <p>Copyright ⓒ 2024. Sangun Won. All rights reserved.</p>

                  </div>
                  <div class="logo">
                     <img src="/img/gaming_cat.png" alt="로고" />
                     <img src="/img/cheonan.png" alt="로고" />
                     <img src="/img/Wolf.gif" alt="로고"/>

                     </div>   
               </div>
            </div>
	</footer>
</div>
      <!-- 부트스트랩 -->
      <script
         src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
         integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
         crossorigin="anonymous"
      ></script>
	<script type="text/javascript" src="./js/script.js"></script>
	<script>
		//request객체에 error가 있을 경우 에러메시지 출력
		<c:if test = "${error != null}">
			alert("${error}");
		</c:if>
		
		//쿼리스트링에 error가 있을 경우 에러메시지 출력
		<c:if test = "${param.error != null}">
		alert("${param.error}");
		</c:if>
	</script>
</body>
</html>