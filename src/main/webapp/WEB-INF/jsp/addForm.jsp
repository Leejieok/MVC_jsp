<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<style>
	
	.divContainer {
		margin: 10px 50px 10px 10px;
	}
	.innerdivcontainer{
		margin: 10px 50px 10px 10px;
	}
	.btnContainer{
		margin: 10px 50px 10px 10px;
	}
</style>
 <script>
 window.onload=function(){}
 function f(){
	 let id = $('#id').val();
	 let url= '<%=request.getContextPath()%>/member/idcheck.do?id='+encodeURIComponent(id);
	 $.ajax({
		 url:url,
		 dataType:"json",
		 success:function(obj){
			 if(obj.msg != null)
			 $('#checkIdContainer').text(obj.msg);
		 }
	 });
 }
 
 </script>
</head>
<body>
	
	<div class="divContainer">
		<div class="innerdivContainer">
			<form action="">
				<div class="col-md-6">
					<label for="inputEmail4" class="form-label">ID</label> <input
						type="text" name="id" id="id" class="form-control">
				</div>
				<input type="button" onclick="f()" value="ID중복확인" /> <a
					id="checkIdContainer"></a><br />
				<div class="col-md-6">
					<label for="inputPassword4" class="form-label">Password</label> <input
						type="password" name="pw" class="form-control">
				</div>
				<div class="col-12">
					<label for="inputAddress" class="form-label">Address</label> <input
						type="text" name="addr" class="form-control"
						placeholder="1234 Main St">
				</div>
				<div class="col-md-2">
					<label for="inputZip" class="form-label">Tel</label> <input
						type="text" name="tel" class="form-control">
				</div>
				<div class="col-12">
					<div class="form-check">
						<input class="form-check-input" type="checkbox"> <label
							class="form-check-label" for="gridCheck"> Check me out </label>
					</div>
				</div>
				<div class="col-12">
					<button class="btn btn-primary"
						onclick="this.form.action='<%=request.getContextPath()%>/member/add.do'">Sign
						in</button>
				</div>
			</form>
		</div>
	</div>
	<div class="btnContainer">
	<button class="btn btn-primary" onclick="location.href='<%=request.getContextPath()%>/menu.html'">Home</button>
	</div>
</body>
</html>