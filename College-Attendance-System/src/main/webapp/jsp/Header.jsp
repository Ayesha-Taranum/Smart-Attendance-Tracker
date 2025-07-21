<%@page import="in.co.college.att.mgt.controller.LoginCtl"%>
<%@page import="in.co.college.att.mgt.bean.UserBean"%>
<%@page import="in.co.college.att.mgt.controller.CASView"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- <link rel="stylesheet" type="text/css"
	href="/College-Attendance-System/css/style.css">-->
	<link rel="stylesheet" type="text/css"
	href="/College-Attendance-System/css/styles.css">
<link rel="stylesheet"
	href="https://bootswatch.com/5/lux/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
  $( function() {
    $( "#datepicker" ).datepicker();
  } );
  $( function() {
	    $( "#datepicker1" ).datepicker({
	      changeMonth: true,
	      changeYear: true
	    });
	  } );
  </script>

<script language="javascript">
	$(function() {
		$("#selectall").click(function() {
			$('.case').attr('checked', this.checked);
		});
		$(".case").click(function() {

			if ($(".case").length == $(".case:checked").length) {
				$("#selectall").attr("checked", "checked");
			} else {
				$("#selectall").removeAttr("checked");
			}

		});
	});
</script>
<title>College Attendance Mangement System</title>

<link rel="icon" type="image/png" sizes="16x16" href="/Resources/favicon/favicon-16x16.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/Resources/favicon/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="192x192" href="/Resources/favicon/android-chrome-192x192.png">
    <link rel="icon" type="image/png" sizes="512x512" href="/Resources/favicon/android-chrome-512x512.png">
    <link rel="apple-touch-icon" sizes="180x180" href="/Resources/favicon/apple-touch-icon.png">
    <link rel="icon" type="image/x-icon" href="/Resources/favicon/favicon.ico">
<style>
        /* Navbar link style */
        .nav-item .nav-link {
            color: #007bff;
            transition: transform 0.2s ease;
        }

        .nav-item .nav-link:hover {
            color: #0056b3;
            transform: scale(1.05);
        }

        /* Dropdown menu item style */
        .dropdown-item {
            color: #007bff;
            display: flex;
            align-items: center;
            padding: 10px;
            border-radius: 4px;
            text-decoration: none;
            transition: background-color 0.2s ease, color 0.2s ease;
        }

        .dropdown-item:hover {
            background-color: #007bff;
            color: white;
        }

        /* Active dropdown item style */
        .dropdown-item:active {
            background-color: #0056b3;
            color: white;
        }
        
    </style>
   
</head>
<body>

	<%
		UserBean userBean = (UserBean) session.getAttribute("user");

		boolean userLoggedIn = userBean != null;

		String welcomeMsg = "Hi, ";

		if (userLoggedIn) {
			String role = (String) session.getAttribute("role");
			welcomeMsg += userBean.getFirstName() + " (" + role + ")";
		} else {
			welcomeMsg += "Guest";
		}
	%>
	<div style="height: 39px">
		<div >
			<div style="margin: 16px">
				<span style="font-size: 20px; font-family: sans-serif; color: #007bff;" class="logo">College Attendance System</span>
				<span style="float: right;" class="menu" style="color: blue"><%=welcomeMsg%></span>
			</div>
			
		</div>
	</div>
<nav class="navbar navbar-expand-lg navbar-light bg-light" style="padding-left:40px">
  <button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>


  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
       <li class="nav-item active">
        <a class="nav-link" href="<%=CASView.WELCOME_CTL%>"
        style="border: 2px solid #007bff; border-radius: 5px; padding: 5px 10px; background-color: #007bff; color: #FFFFFF; text-decoration: none; display: flex; align-items: center; padding: 8px;"
        ><span class="mx-1">Home</span><span class="sr-only">(current)</span><i class="fas fa-home"></i></a>
      </li>
    <%
		if (userLoggedIn) {
	%>

			<%
				if (userBean.getRoleId() == 1) {
			%>
			
			 <li class="nav-item dropdown rounded Facultybutton" >
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
        >
           Faculty
        </a>
        <div class="dropdown-menu rounded" aria-labelledby="navbarDropdown" style= "padding: 10px">
          <a class=" dropdown-item" href="<%=CASView.USER_REGISTRATION_CTL%>"
          >Add Faculty</a>
          <a class="dropdown-item" href="<%=CASView.USER_LIST_CTL%>">Faculty List</a>
        </div>
      </li>
     
      <li class="nav-item dropdown ">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
           Student
        </a>
        <div class="dropdown-menu rounded" aria-labelledby="navbarDropdown" style= "padding: 10px">
          <a class="dropdown-item " href="<%=CASView.STUDENT_CTL%>">Add Student</a>
          <a class="dropdown-item " href="<%=CASView.STUDENT_LIST_CTL%>">Student List</a>
        </div>
      </li>
      <li class="nav-item dropdown ">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
           Course
        </a>
        <div class="dropdown-menu rounded" aria-labelledby="navbarDropdown"  style= "padding: 10px">
          <a class="dropdown-item" href="<%=CASView.COURSE_CTL%>"> Add Course</a>
          <a class="dropdown-item" href="<%=CASView.COURSE_LIST_CTL%>"> Course List</a>
        </div>
      </li>
      
        <li class="nav-item dropdown ">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
        >
					<i class="fas fa-book-open"></i> Subject
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown" style="border-radius: 8px; background-color: #f8f9fa; padding: 10px;">
          <a class="dropdown-item" href="<%=CASView.SUBJECT_CTL%>">
						<i class="fas fa-book" style="margin-right: 8px;"></i>Add Subject</a>
			
          <a class="dropdown-item" href="<%=CASView.SUBJECT_LIST_CTL%>"
						>
						<i class="fas fa-list" style="margin-right: 8px;"></i>Subject List
					</a>
          
        </div>
      </li>
      
        <li class="nav-item dropdown rounded">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
          style="color: #17a2b8; transition: color 0.3s ease, transform 0.3s ease;"
				onmouseover="this.style.color='#0056b3'; this.style.transform='scale(1.05)';"
				onmouseout="this.style.color='#17a2b8'; this.style.transform='scale(1)';">
					<i class="fas fa-chalkboard-teacher"></i> Assign Faculty
          
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown"
        style="border-radius: 8px; background-color: #f8f9fa; padding: 10px;">
          <a class="dropdown-item" href="<%=CASView.ASSIGN_FACULTY_CTL%>"style="color: #17a2b8; display: flex; align-items: center; padding: 10px; border-radius: 4px; text-decoration: none;"
						onmouseover="this.style.backgroundColor='#17a2b8'; this.style.color='white';"
						onmouseout="this.style.backgroundColor=''; this.style.color='#17a2b8';"
						onclick="this.style.backgroundColor='#138496'; this.style.color='white';">
						<i class="fas fa-user-plus" style="margin-right: 8px;"></i>Add
						Assign Faculty
</a>
          <a class="dropdown-item" href="<%=CASView.ASSIGN_FACULTY_LIST_CTL%>"style="color: #17a2b8; display: flex; align-items: center; padding: 10px; border-radius: 4px; text-decoration: none;"
						onmouseover="this.style.backgroundColor='#17a2b8'; this.style.color='white';"
						onmouseout="this.style.backgroundColor=''; this.style.color='#17a2b8';"
						onclick="this.style.backgroundColor='#138496'; this.style.color='white';">
						<i class="fas fa-list-alt" style="margin-right: 8px;"></i>Assign
						Faculty List</a>
        </div>
      </li>
     	
      
      
      <%}else if (userBean.getRoleId() == 2) {%>
     
     <li class="nav-item dropdown" >
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
           style="color: #28a745; transition: color 0.3s ease, transform 0.3s ease;"
				onmouseover="this.style.color='#218838'; this.style.transform='scale(1.05)';"
				onmouseout="this.style.color='#28a745'; this.style.transform='scale(1)';">
					<i class="fas fa-user"></i> Student

        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown" style="border-radius: 8px; background-color: #f8f9fa; padding: 10px;">
          <a class="dropdown-item" href="<%=CASView.STUDENT_CTL%>"style="color: #28a745; display: flex; align-items: center; padding: 10px; border-radius: 4px; text-decoration: none;"
						onmouseover="this.style.backgroundColor='#28a745'; this.style.color='white';"
						onmouseout="this.style.backgroundColor=''; this.style.color='#28a745';"
						onclick="this.style.backgroundColor='#218838'; this.style.color='white';">
						<i class="fas fa-user-plus" style="margin-right: 8px;"></i>Add
						Student
</a>
          <a class="dropdown-item" href="<%=CASView.STUDENT_LIST_CTL%>"style="color: #28a745; display: flex; align-items: center; padding: 10px; border-radius: 4px; text-decoration: none;"
						onmouseover="this.style.backgroundColor='#28a745'; this.style.color='white';"
						onmouseout="this.style.backgroundColor=''; this.style.color='#28a745';"
						onclick="this.style.backgroundColor='#218838'; this.style.color='white';">
						<i class="fas fa-list-alt" style="margin-right: 8px;"></i>Student
						List
</a>
        </div>
      </li>
     <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"style="color: #dc3545; transition: color 0.3s ease, transform 0.3s ease;"
				onmouseover="this.style.color='#c82333'; this.style.transform='scale(1.05)';"
				onmouseout="this.style.color='#dc3545'; this.style.transform='scale(1)';">
					<i class="fas fa-clipboard-list"></i> Attendance

        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown" style="border-radius: 8px; background-color: #f8f9fa; padding: 10px;">
          <a class="dropdown-item" href="<%=CASView.ATTENDANCE_CTL%>"style="color: #dc3545; display: flex; align-items: center; padding: 10px; border-radius: 4px; text-decoration: none;"
						onmouseover="this.style.backgroundColor='#dc3545'; this.style.color='white';"
						onmouseout="this.style.backgroundColor=''; this.style.color='#dc3545';"
						onclick="this.style.backgroundColor='#bd2130'; this.style.color='white';">
						<i class="fas fa-check-square" style="margin-right: 8px;"></i>Add
						Attendance
</a>
           <a class="dropdown-item" href="<%=CASView.ATTENDANCE_LIST_CTL%>"style="color: #dc3545; display: flex; align-items: center; padding: 10px; border-radius: 4px; text-decoration: none;"
						onmouseover="this.style.backgroundColor='#dc3545'; this.style.color='white';"
						onmouseout="this.style.backgroundColor=''; this.style.color='#dc3545';"
						onclick="this.style.backgroundColor='#bd2130'; this.style.color='white';">
						<i class="fas fa-list-alt" style="margin-right: 8px;"></i>Attendance
						List
</a>
           <a class="dropdown-item" href="<%=CASView.SEMESTER_ATTENDACE_LIST_CTL%>"	style="color: #dc3545; display: flex; align-items: center; padding: 10px; border-radius: 4px; text-decoration: none;"
						onmouseover="this.style.backgroundColor='#dc3545'; this.style.color='white';"
						onmouseout="this.style.backgroundColor=''; this.style.color='#dc3545';"
						onclick="this.style.backgroundColor='#bd2130'; this.style.color='white';">
						<i class="fas fa-calendar-alt" style="margin-right: 8px;"></i>Semester
						Attendance
           </a>
        </div>
      </li>

      
      
      
      <%}}else{%>
      <li class="nav-item">
        <a class="nav-link btn btn-primary rounded" href="<%=CASView.LOGIN_CTL%>"role="button"
				style="background-color: black; color: #FFFFFF; border: 2px solid black; border-radius: 5px; padding: 5px 10px; text-decoration: none; display: flex; align-items: center; padding: 8px;">
					<i class="bi bi-box-arrow-in-right"
					style="vertical-align: middle; color: #FFFFFF;"></i> <span
					style="vertical-align: middle; padding-left: 5px;">Login</span>
			</a></li>

      
      	
      <%} %>
    </ul>
    <form class="form-inline my-2 my-lg-0">
    <%
	if (userLoggedIn) {
		%>
    <ul class="navbar-nav mr-auto">
    <li class="nav-item">
        <a class="nav-link" href="<%=CASView.MY_PROFILE_CTL%>"style="color: #007bff; transition: color 0.3s ease, transform 0.3s ease;"
					onmouseover="this.style.color='#0056b3'; this.style.transform='scale(1.05)';"
					onmouseout="this.style.color='#007bff'; this.style.transform='scale(1)';">
						<i class="fas fa-user"></i>My Profile</a>
        
      </li>
     <li class="nav-item">
        <a class="nav-link" href="<%=CASView.CHANGE_PASSWORD_CTL%>"style="color: #ffc107; transition: color 0.3s ease, transform 0.3s ease;"
					onmouseover="this.style.color='#e0a800'; this.style.transform='scale(1.05)';"
					onmouseout="this.style.color='#ffc107'; this.style.transform='scale(1)';">
						<i class="fas fa-key"></i>Change Password</a>
        
      </li>
      <li class="nav-item">
      <a class="nav-link" href="<%=CASView.LOGIN_CTL%>?operation=<%=LoginCtl.OP_LOG_OUT%>"style="color: #dc3545; transition: color 0.3s ease, transform 0.3s ease;"
					onmouseover="this.style.color='#c82333'; this.style.transform='scale(1.05)';"
					onmouseout="this.style.color='#dc3545'; this.style.transform='scale(1)';">
						<i class="fas fa-sign-out-alt"></i>Logout</a>
      </li>

</ul>   
<%} %>
 </form>
  </div>
</nav>