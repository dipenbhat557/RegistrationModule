<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

<!-- Compiled and minified JavaScript -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

</head>
<body
	style="background: url(img/Fimg.jpg); background-size: cover; background-attachment: fixed;">
	<div class="container">
		<div class="row">
			<div class="col m6 offset-m3">
				<div class="card">
					<div class="card-content">
						<h3 style="margin-top: 0px;" class="center-align">Register
							here</h3>

						<h5 id="msg" class="center-align"></h5>

						<div class="form center-align">
							<form action="fproserve" method="post" id="myform">
								<input type="text" name="username"
									placeholder="Enter your name here"> <input type="email"
									name="user_email" placeholder="Enter your email here">
								<input type="password" name="password"
									placeholder="Enter your password here">
								<div class="file-field input-field">
									<div class="btn">
										<span>File</span> 
										<input name="image" type="file">
									</div>
									<div class="file-path-wrapper">
										<input class="file-path validate" type="text">
									</div>
								</div>
								<button type="submit" class="btn #76ff03 light-green accent-3">Submit</button>
							</form>
						</div>

						<div class="loader center-align"
							style="margin-top: 10px; display: none;">
							<div class="preloader-wrapper big active">
								<div class="spinner-layer spinner-blue">
									<div class="circle-clipper left">
										<div class="circle"></div>
									</div>
									<div class="gap-patch">
										<div class="circle"></div>
									</div>
									<div class="circle-clipper right">
										<div class="circle"></div>
									</div>
								</div>

								<div class="spinner-layer spinner-red">
									<div class="circle-clipper left">
										<div class="circle"></div>
									</div>
									<div class="gap-patch">
										<div class="circle"></div>
									</div>
									<div class="circle-clipper right">
										<div class="circle"></div>
									</div>
								</div>

								<div class="spinner-layer spinner-yellow">
									<div class="circle-clipper left">
										<div class="circle"></div>
									</div>
									<div class="gap-patch">
										<div class="circle"></div>
									</div>
									<div class="circle-clipper right">
										<div class="circle"></div>
									</div>
								</div>

								<div class="spinner-layer spinner-green">
									<div class="circle-clipper left">
										<div class="circle"></div>
									</div>
									<div class="gap-patch">
										<div class="circle"></div>
									</div>
									<div class="circle-clipper right">
										<div class="circle"></div>
									</div>
								</div>
							</div>
							<h5>Please Wait...</h5>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"
		integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="
		crossorigin="anonymous">
		
	</script>
	<script>
		$(document).ready(function() {
			console.log("JQuery Connected successfully")
		})

		$("#myform").on('submit', function(event) {
			event.preventDefault();

			//var f = $(this).serialize();
			let f=new FormData(this);

			console.log(f);

			$(".loader").show();
			$(".form").hide();

			$.ajax({
				url : "fproserve",
				data : f,
				type : 'POST',
				success : function(data, textStatus, errorThrown) {
					console.log(textStatus);
					console.log("success...");
					$(".loader").hide();
					$(".form").show();
		
					if (data.trim() == "Success") {
						$('#msg').html("Successfully Registered");
						$('#msg').addClass('green-text');
					} else {
						$('#msg').html("Something went wrong on server");
						$('#msg').addClass('red-text');
					}

				},
				error : function(jqXHR, textStatus, errorThrown) {
					console.log(data);
					console.log("error....");
					$(".loader").hide();
					$(".form").show();
					$('#msg').html("Something went wrong on server");
				},
				processData: false,
				contentType: false
			})
		})
	</script>
</body>
</html>