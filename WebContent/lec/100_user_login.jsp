<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<jsp:include page="../template/jsp_common.jsp" />

<html lang="ko" class=" -webkit-">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  
</head>

<body translate="no">

	<nav th:replace="022_layout_header.html :: header_01" class="navbar fixed-top navbar-expand-lg bg-primary text-center p-0 ">

		<div class="container justify-content-center text-nowrap">
			<div class="row">
				<div class="col">
					<table style="width: 100%;">
						<tbody>
							<tr>
								<td class="align-middle"> 
									&nbsp;
								</td>
								<td>
									<a class="text-muted" href="#">
										<p class="display-4 font-weight-bold d-inline-block mb-0 align-center pl-2" style="color:#083358">FDW</p>
									</a>
									&nbsp;
								</td>
								<td></td>

								<td class="text-left"> 
								</td>
								<td>
									&nbsp; 
								</td>

							</tr>

						</tbody>
					</table>

				</div>
			</div>
		</div>

	</nav>

	<main>

		<!-- content -->

		<section class="container mt-4" style=" margin-bottom: 70px;">

			<div class="row bg-info rouded">
				<div class="col-12">
					<a class="navbar-brand font-weight-bold text-dark " href="#">
						<i class="fas fa-bars d-inline-block"></i>&nbsp;
						<p class="m-0 pt-1  d-inline-block"> 로그인 </p>
					</a>
				</div>
			</div>

			<br/> 

			<div class="row py-5 mb-4 ">
				<div class="col-6 flex-nowrap justify-content-between align-items-center m-auto h-auto pb-2">
					<div class="card flex-md-row mb-4 shadow-sm h-md-250 bg-light p-0">
						<div class="card-body d-flex flex-column ">
							<form class=" p-3 py-4 " method="GET">

								<div th:if="${ showLoginId }" class="form-group pb-3 text-primary">
									&nbsp;
									<i class="far fa-user"></i> &nbsp; 아이디 &nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;
									<i class="far fa-envelope"></i> &nbsp; 이메일
									<input type="text" id="user_id" name="user_id" class="form-control mt-2" placeholder="아이디" />
									<small class="form-text text-muted mt-2">
										&nbsp;&nbsp;&nbsp;&nbsp;
										<span th:text="${ login_error_msg }" id="user_id_error" class="text-danger">
											아이디 또는 이메일 주소를 입력하세요.
										</span>
									</small>
								</div>

								<div class="form-group pb-3">
									<div class="text-primary">
										&nbsp;
										<i class="fas fa-key"></i> &nbsp; 암호
									</div>
									<input type="password" id="user_pass" name="user_pass" class="form-control mt-2" placeholder="암호" />
									<small class="form-text text-muted mt-2">
										&nbsp;&nbsp;&nbsp;&nbsp;
										<span th:text="${ '' }" id="user_pass_error" class="text-danger">
											비밀번호를 입력하세요.
										</span>
									</small>
								</div>

								<div>
									<br/>
									<br/>
									<br/>
								</div>

								<button type="submit" class="btn btn-primary btn-md btn-block align-center">
									<i class="fas fa-check ml-2"></i> &nbsp; 로그인
								</button>

							</form>
						</div>

					</div>
				</div>
			</div>
		</section>
	</main>

	<footer th:replace="024_layout_footer.html" class="bg-dark text-center">

		<div class="container py-3 text-center text-nowrap">
			<div class="row text-nowrap">
				<div class="col">
					<a class="nav-link text-white" href="#">
						<i class="fas fa-home"></i>
						&nbsp; 소개
					</a>
				</div>
				<div class="col">
					<a class="nav-link text-white" href="#">
						<i class="fas fa-chalkboard-teacher"></i>
						&nbsp; 제품소개</a>
				</div>
				<div class="col">
					<a class="nav-link text-white" href="#">
						<i class="fas fa-user-secret"></i>
						&nbsp; 개인정보취급방침</a>
				</div>
				<div class="col">
					<a class="nav-link text-white" href="#">
						<i class="fas fa-newspaper"></i>
						&nbsp; 게시판</a>
				</div>
				<div class="col">
					<a class="nav-link text-white" href="#">
						<i class="fas fa-sitemap"></i>
						&nbsp; 사이트맵</a>
				</div>
			</div>

			<div class="row text-nowrap">
				<div class="col small">
					<span>전화 : 042-253-7007 &nbsp;&nbsp;
					</span>
					<span>팩스 : 042-253-7009 &nbsp;&nbsp;
					</span>
					<span>메일 : procom@procom.co.kr &nbsp;&nbsp;
					</span>
					<p class="copyright">Copyright ⓒ (주)프로컴시스템 All Rights Reserved. </p>
				</div>
			</div>
		</div>

	</footer>
 
</body>
</html>