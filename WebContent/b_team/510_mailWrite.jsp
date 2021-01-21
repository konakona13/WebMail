<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메일 쓰기</title>
<link rel="stylesheet" href="css/510_mailWrite.css">
</head>
<body>
	<div id="message">
		<div class="header">
			<h1 class="page-title">
				<a class="icon circle-icon glyphicon glyphicon-chevron-left trigger-message-close mr_20">
					<img class="munjong_bigimg" src="img/list_icon.png">
				</a>
				메일 쓰기
			</h1>
			
		</div>
		<div id="message-nano-wrapper" class="nano">
			<div class="nano-content" tabindex="0">
				<ul class="message-container">
					<li class="received">
						<div class="details">
							<div class="left">
								<span class="width80">제목</span>
								<div class="arrow orange"></div>
								<div class="ui input">
									<input type="text" placeholder="제목">
								</div>
							</div>
						</div>
						<div class="details">
							<div class="left">
								<span class="width80">받는 사람</span>
								<div class="arrow orange"></div>
								<div class="ui input">
									<input type="text" placeholder="받는 사람">
								</div>
							</div>
						</div>
						<div class="message">
							<textarea class="myTextArea"></textarea>
						</div>
						<div class="tool-box">
							<a href="#" class="circle-icon">
								<img class="munjong_img" src="img/delete_icon.png">
							</a>
							<a href="#" class="circle-icon">
								<img class="munjong_img" src="img/send_icon.png">
							</a>
						</div>
					</li>
				</ul>
			</div>
			<div class="nano-pane">
				<div class="nano-slider" style="height: 20px; transform: translate(0px, 6.13746px);"></div>
			</div>
		</div>
	</div>
</body>
</html>