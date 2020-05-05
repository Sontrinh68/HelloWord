<!DOCTYPE html>
<%@page import="dao.QuestionDao"%>
<%@page import="persist.Kysymykset"%>
<%@page import="java.util.List"%>
<html>
<head>
<title>Diginide vaalikone</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

	<%
	List<Kysymykset> questionList = QuestionDao.getAllQuestions();
	int lastQuestionId = questionList.get(questionList.size()-1).getKysymysId();
	
	%>

	<div id="container">

		<img id="headerimg" src="Logo.png" width="720" />
		<div class="kysymys">
			<h1>Vaalikone</h1>
		</div>
		<br> <br>

		<form action="./questionservlet" method="POST">
			<input type="text" name="lastquestionid" value="<%=lastQuestionId+1%>">
			<label for="inputUser">Question: </label>
			<textarea name="question" required></textarea>
			<br>
			<button type="submit" class="btn btn-primary">Add Question</button>
		</form>
	</div>
</body>
</html>