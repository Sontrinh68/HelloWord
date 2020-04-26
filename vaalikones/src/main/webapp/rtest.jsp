<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE html>
<html>
<head>
<title>Diginide vaalikone</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

</head>
<body>
	<%
		String uname = request.getParameter("username");
		String driverName = "com.mysql.jdbc.Driver";
		String connectionUrl = "jdbc:mysql://localhost:3306/";
		String dbName = "vaalikone";
		String userId = "root";
		String password = "quan12952151";

		try {
			Class.forName(driverName);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
	%>
	
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-11">
				<h1>All the candidates</h1>
			</div>
			<div class="col-lg-1">
				<a href="welcome.jsp" class="btn btn-warning btn-lg" style="margin-top:15px;"><b>Back</b></a>
			</div>
		</div>
		<br>
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th><b>Ehdokas_ID</b></th>
					<th><b>Sukunimi</b></th>
					<th><b>Etunimi</b></th>
					<th><b> Puolue </b></th>
					<th><b> Kotipaikkakunta </b></th>
					<th><b> Ika </b></th>
					<th><b> Miksi eduskuntaan? </b></th>
					<th><b> Mita asioita haluat edistaa? </b></th>
					<th><b> Ammatti </b></th>
					<th><b>Action</b></th>
					<th><b>Action</b></th>

				</tr>
			</thead>
			<tbody>
				<%
					try {
						connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
						statement = connection.createStatement();
						String sql = "SELECT ehdokas_id,sukunimi,etunimi,puolue,kotipaikkakunta,ika,miksi_eduskuntaan,mita_asioita_haluat_edistaa,ammatti FROM ehdokkaat";

						resultSet = statement.executeQuery(sql);
						while (resultSet.next()) {
				%>
				<tr>

					<td><%=resultSet.getString("ehdokas_id")%></td>
					<td><%=resultSet.getString("sukunimi")%></td>
					<td><%=resultSet.getString("etunimi")%></td>
					<td><%=resultSet.getString("puolue")%></td>
					<td><%=resultSet.getString("kotipaikkakunta")%></td>
					<td><%=resultSet.getString("ika")%></td>
					<td><%=resultSet.getString("miksi_eduskuntaan")%></td>
					<td><%=resultSet.getString("mita_asioita_haluat_edistaa")%></td>
					<td><%=resultSet.getString("ammatti")%></td>
					<td><a
						href="updateCan.jsp?ehdokas_id=<%=resultSet.getString("ehdokas_id")%>"
						class="btn btn-warning">Update</a></td>
					<td><a
						href="delete.jsp?ehdokas_id=<%=resultSet.getString("ehdokas_id")%>"
						class="btn btn-warning">Delete</a></td>

				</tr>

				<%
					}

					} catch (Exception e) {
						e.printStackTrace();
					}
				%>
			</tbody>
		</table>
		<br>
		  <a href="add.jsp" class="btn btn-warning btn-lg">Add more candidate</a>
	</div>
</body>
</html>