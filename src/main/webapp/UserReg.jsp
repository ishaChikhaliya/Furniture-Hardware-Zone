<%@page import="frm.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*"%>


<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Registration</title>
</head>

<style>
@import
	url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap')
	;

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Poppins', sans-serif;
}

body {
	
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 8%;
	
}
.error{
	color: red;
	font-size: 20px;
	
}
.container {
	max-width: 700px;
	width: 100%;
	background-color: #fff;
	padding: 25px 30px;
	border-radius: 5px;
	box-shadow: 0 5px 10px rgba(0, 0, 0, 0.15);
}

.container .title {
	font-size: 25px;
	font-weight: 500;
	position: relative;
}

.container .title::before {
	content: "";
	position: absolute;
	left: 0;
	bottom: 0;
	height: 3px;
	width: 30px;
	border-radius: 5px;
	background: linear-gradient(135deg, #71b7e6, #9b59b6);
}

.content form .user-details {
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
	margin: 20px 0 12px 0;
}

form .user-details .input-box {
	margin-bottom: 15px;
	width: calc(100%/ 2 - 20px);
}

form .input-box span.details {
	display: block;
	font-weight: 500;
	margin-bottom: 5px;
}

.user-details .input-box input {
	height: 45px;
	width: 100%;
	outline: none;
	font-size: 16px;
	border-radius: 5px;
	padding-left: 15px;
	border: 1px solid #ccc;
	border-bottom-width: 2px;
	transition: all 0.3s ease;
}

.user-details .input-box input:focus, .user-details .input-box input:valid
	{
	border-color: #9b59b6;
}

form .gender-details .gender-title {
	font-size: 20px;
	font-weight: 500;
}

form .category {
	display: flex;
	width: 80%;
	margin: 14px 0;
	justify-content: space-between;
}

form .category label {
	display: flex;
	align-items: center;
	cursor: pointer;
}

form .button {
	height: 45px;
	margin: 35px 0
}

form .button input {
	height: 100%;
	width: 100%;
	border-radius: 5px;
	border: none;
	color: #fff;
	font-size: 18px;
	font-weight: 500;
	letter-spacing: 1px;
	cursor: pointer;
	transition: all 0.3s ease;
	background: linear-gradient(135deg, #71b7e6, #9b59b6);
}

form .button input:hover {
	/* transform: scale(0.99); */
	background: linear-gradient(-135deg, #71b7e6, #9b59b6);
}

@media ( max-width : 584px) {
	.container {
		max-width: 100%;
	}
	form .user-details .input-box {
		margin-bottom: 15px;
		width: 100%;
	}
	form .category {
		width: 100%;
	}
	.content form .user-details {
		max-height: 300px;
		overflow-y: scroll;
	}
	.user-details::-webkit-scrollbar {
		width: 5px;
	}
}

@media ( max-width : 459px) {
	.container .content .category {
		flex-direction: column;
	}
}
</style>
<body   style="background-image:url('about-bg.jpg');  background-size:cover; height: 110%; background-position: center; background-repeat: no-repeat; ">
	<div class="container">
		<div class="title">Customer Registration</div>
		<div class="content">
			<form action="UserReg.jsp" method="GET">
				<div class="user-details">
					<div class="input-box">
						<span class="details">Full Name</span> <input type="text"
							placeholder="Enter your name" name="txtfullname" required>
					</div>
					<div class="input-box">
						<span class="details">Username</span> <input type="text"
							placeholder="Enter your username" name="txtname" required>
					</div>
					<div class="input-box">
						<span class="details">Email</span> <input type="email"
							placeholder="Enter your email" name="txtemail" required>
					</div>
					<div class="input-box">
						<span class="details">Phone Number</span> <input type="number"
							placeholder="Enter your number"  name="txtphonenumber"  required>
					</div>
					<div class="input-box">
						<span class="details">Password</span> <input type="password"
							id="password" placeholder="Enter your password" name="txtpass"
							required>
					</div>
					<div class="input-box">
						<span class="details">Confirm Password</span> <input type="text"
							id="confirm_password" placeholder="Confirm your password"
							name="txtconpass" required><span id='message'></span>
					</div>
				</div>

				<div class="button">
					<input type="submit" value="Register" name="submit">
				</div>
				<div class="error">
<%
DBConnection cn = new DBConnection(
		application.getInitParameter("MySQL_ConnString").toString(),
		application.getInitParameter("MySQL_User").toString(),
		application.getInitParameter("MySQL_Pass").toString(),
		application.getInitParameter("MySQL_Driver").toString()
		);

if(request.getParameter("submit")!=null)
{
			String fname=request.getParameter("txtfullname");
			String uname=request.getParameter("txtname");
			String email=request.getParameter("txtemail");
			String pnumber=request.getParameter("txtphonenumber");
			String password=request.getParameter("txtpass");
			String conpassword=request.getParameter("txtconpass");
			
			
			String SQLInsert="INSERT INTO `tbl_user`(`user_fullname`, `user_name`, `password`, `email`, `contact_no`,`address`)";
			SQLInsert+="VALUES ('"+fname+"','"+uname+"','"+password+"','"+email+"','"+pnumber+"','"+null+"')";

			String SqlDQry = "select * from tbl_user where ";
			SqlDQry += " user_fullname = '"+ fname +"' or ";
			SqlDQry += " user_name = '"+ uname +"' or ";
			SqlDQry += " email = '"+ email +"' ";
			
			if(password.equals(conpassword))
			{
				try
	    		{
	     			if(cn.openConn())
					{	
		     			if(cn.exeQuery(SqlDQry))
		     			{
		     				%>
		     				
		     				<p>*Please Select Uniq date (Full Name,UserName,E-mail)</p>
		     				<%
		     			}else
		     			{		     				
							if(cn.exeUpdate(SQLInsert))
							{
								RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
								rd.forward(request, response);				
							}else
							{
								%><p>Something is wrong Data is note Registed</p>
								<%
							}
		     			}					
					}else
					{
						%><p>Connection is Not Done</p><%
					}			
		        }
	       		catch(Exception e)
	         	{
	           			out.print("Error is : "+e.toString());
	         	}
			}else
			{
				%>
				<p>*Confirm Password is not Same</p>
				<% 
			}
}
  %>		
  				</div>			
			</form>
		</div>
	</div>


</body>
</html>


               
