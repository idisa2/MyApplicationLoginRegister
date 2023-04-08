<!DOCTYPE html >
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="Expires" content="sat, 01 Dec 2001 00:00:00 GMT" />
<title>projet-sujet2 | home</title>
<link th:href="@{/css/bootstrap.min.css}" rel="stylesheet" />
<link  th:href="@{/css/style.css}" rel="stylesheet" />
</head>
<body>
	<div role="navigation">
		<div class="navbar navbar-inverse">
			<a href="/" class="navbar-brand">Projet-sujet2</a>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="/login">Login</a></li>
					<li><a href="/register">New Registration</a></li>
					<li><a href="/show-users">All Users </a></li>
				</ul>
			</div>
		</div>
	</div>

	<div th:switch="${mode}">'
		<div th:case="MODE_HOME">
			<div class="container" id="homediv">
				<div class="jumbotron text-center">
					<h1>Welcome to Projet-sujet2</h1>
					<h3>Subscribe my channel to support me </h3>

				</div>
				<div class="navbar navbar-inverse">
					<a href="/" class="navbar-brand">Home</a>
					<div class="navbar-collapse collapse">
						<ul class="nav navbar-nav">
							<li><a href="/login">Login</a></li>
							<li><a href="/register">New Registration</a></li>
							<li><a href="/show-users">All Users</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<div th:case="MODE_REGISTER">
			<div class="container text-center">
				<h3>New Registration</h3>
				<hr/>
				<form class="form-horizontal" method="POST" action="save-user">
					<input type="hidden" name="id"/>
					<div class="form-group">
						<label class="control-label col-md-3">Email</label>
						<div class="col-md-7">
							<input type="email" class="form-control" name="email" required="required"
								   />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Nom</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="name" required="required"
								  />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Mot de passe</label>
						<div class="col-md-7">
							<input type="password" class="form-control" id="password" name="password" required="required"
								   />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Confirmation</label>
						<div class="col-md-7">
							<input type="password" class="form-control" id="confirm_password" name="confirm_password" required="required"
							/>
						</div>
					</div>
					<div class="form-group ">
						<input type="submit" class="btn btn-primary" value="S'inscrire" />
					</div>
				</form>
			</div>
		</div>
		<div th:case="ALL_USERS">
			<div class="container text-center" id="tasksDiv">
				<h3>All Users</h3>
				<hr/>
				<div class="table-responsive">
					<table class="table table-striped table-bordered">
						<thead>
							<tr>
								<th>Id</th>
								<th>Email</th>
								<th>Nom</th>
								<th>Delete</th>
								<th>Edit</th>
							</tr>
						</thead>
						<tbody>
							<tr th:each="user:${users}">
								<td th:text="${user.id}"></td>
								<td th:text="${user.email}"></td>
								<td th:text="${user.name}"></td>
								<td><a th:href="@{delete-user(id=${user.id})}"><span
										class="glyphicon glyphicon-trash"></span></a></td>
								<td><a th:href="@{edit-user(id=${user.id})}"><span
										class="glyphicon glyphicon-pencil"></span></a></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>

		<div th:case="'MODE_UPDATE'">
			<div class="container text-center">
				<h3>Update User</h3>
				<hr/>
				<form class="form-horizontal" method="POST" action="save-user">
					<input type="hidden" name="id" th:value="${user.id }" />
					<div class="form-group">
						<label class="control-label col-md-3">Nom</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="name"
								   th:value="${user.name }" required="required"/>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Identifiant</label>
						<div class="col-md-7">
							<input type="email" class="form-control" name="email" required="required"
								th:value="${user.email }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Mot de passe</label>
						<div class="col-md-7">
							<input type="password" class="form-control" name="password" id="password" required="required"
								th:value="${user.password }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Confirmation</label>
						<div class="col-md-7">
							<input type="password" class="form-control" id="confirm_password" name="confirm_password" required="required"
							/>
						</div>
					</div>
					<div class="form-group ">
						<input type="submit" class="btn btn-primary" value="Update" />
					</div>
				</form>
			</div>
		</div>

		<div th:case="'MODE_LOGIN'">
			<div class="container text-center">
				<h3>Connexion</h3>
				<hr/>
				<form class="form-horizontal" method="POST" action="/login-user">
					<div th:if="${error}">
						<div class= "alert alert-danger">
							<p th:text="${error}"></p>
							</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Identifiant</label>
						<div class="col-md-7">
							<input type="email" class="form-control" name="email"
								   required="required"/>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Mot de passe</label>
						<div class="col-md-7">
							<input type="password" class="form-control" name="password" required="required"
								/>
						</div>
					</div>
					<div class="form-group ">
						<a href="/register" class="ml-4">S'inscrire</a>
						<input type="submit" class="btn btn-primary" value="Connexion" />
					</div>
				</form>
			</div>
		</div>
	</div>


	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="/js/jquery-1.11.1.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script>
		var password = document.getElementById("password")
				, confirm_password = document.getElementById("confirm_password");

		function validatePassword(){
			if(password.value != confirm_password.value) {
				confirm_password.setCustomValidity("Les mots de passe ne correspondent pas");
			} else {
				confirm_password.setCustomValidity('');
			}
		}

		password.onchange = validatePassword;
		confirm_password.onkeyup = validatePassword;
	</script>
</body>
</html>