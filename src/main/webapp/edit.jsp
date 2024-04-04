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
		<div class="customer_title">
			<strong>MovieTheater</strong>
			<p>MovieTheater 입니다.</p>
		</div>
		<div class="customer_edit_wrap">
				   <div class="regi_log row">
             <div class="col-md-6 offset-md-3">
                <h2 class="register-title">고객 정보 수정</h2>
			<form name="frm" method="post" action="update?id=${customer.id}" enctype="multipart/form-data">
				<div class="customer_register">
					<div class="info">
						<dl>
							<dd><input type="text" name="name" maxlength="10" value="${customer.name }" /></dd>
						</dl>
						<dl>
							<dd><input type="text" name="address" maxlength="50" value="${customer.address }"/></dd>
						</dl>
						<dl>
							<dd><input type="text" name="phone" maxlength="50" value="${customer.phone }" /></dd>
						</dl>
						<dl>
							<dd>
								<input type="radio" id="male" name="gender" value="남자" checked/>
								<label for="male">남자</label>
								<input type="radio" id="female" name="gender" value="여자"/>
								<label for="female">여자</label>
							</dd>
						</dl>
						<dl>
							<dd><input type="text" name="age" maxlength="10" value="${customer.age }" /></dd>
						</dl>
					<div class="padding-top:10px">
						<label style="font-size: 1.4rem; padding-right: 20px;" for="file">이미지 업로드</label>
						<input type="file" name="file" id="file" />
						<br />
						<c:if test="${customer.img != null }" >
							<img src="${customer.img }" alt="업로드 이미지" width:"100" />
						</c:if>
						<input type="hidden" name="origin_file" value="${customer.img}" />
					</div>
					<dl>
							<dd><input type="text" name="point" maxlength="10" value="${customer.point }" /></dd>
						</dl>
						<dl>
							<dd>
								<label for="grade">등급을 선택하세요:</label>
								<select name="grade" id="grade">
									<option value="bronze">bronze</option>
									<option value="silver">silver</option>
									<option value="gold">gold</option>
									<option value="vip">vip</option>
								</select>
							</dd>
						</dl>
				</div>
				</div>
			</form>
			<div class="bt_wrap">
				<a onclick = "chkForm(); return false;" class="on log__btn">수정</a>
				<a href="index" class="log__btn">취소</a>
			</div>
		</div>
</div>
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
</body>
</html>