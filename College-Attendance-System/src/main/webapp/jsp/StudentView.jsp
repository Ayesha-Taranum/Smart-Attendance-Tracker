<%@page import="in.co.college.att.mgt.controller.StudentCtl"%>
<%@page import="in.co.college.att.mgt.controller.SubjectCtl"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.List"%>
<%@page import="in.co.college.att.mgt.controller.UserRegistrationCtl"%>
<%@page import="in.co.college.att.mgt.util.HTMLUtility"%>
<%@page import="java.util.HashMap"%>
<%@page import="in.co.college.att.mgt.util.DataUtility"%>
<%@page import="in.co.college.att.mgt.util.ServletUtility"%>
<%@ include file="Header.jsp"%>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
	integrity="sha384-k6RqeWeci5ZR/Lv4MR0sA0FfDOM3iw5xfMj6Tzi4ttO4U1z0F4zo55UOG6C7fIuj"
	crossorigin="anonymous">

<div class="container"
	style="border: ridge; margin-top: 20px; margin-left: 50px; padding: 50px;">
	<div style="margin-top: 18px">
		<h2 style="color: #007bff;">
			<i class="fas fa-user-graduate"></i> Add Student
		</h2>
	</div>

	<jsp:useBean id="bean" class="in.co.college.att.mgt.bean.StudentBean"
		scope="request"></jsp:useBean>
	<b><font color="red"><%= ServletUtility.getErrorMessage(request) %></font></b>
	<b><font color="green"><%= ServletUtility.getSuccessMessage(request) %></font></b>
	<form style="width: 60%; margin-top: 25px"
		action="<%= CASView.STUDENT_CTL %>" method="post">

		<input type="hidden" name="id" value="<%= bean.getId() %>"> <input
			type="hidden" name="createdBy" value="<%= bean.getCreatedBy() %>">
		<input type="hidden" name="modifiedBy"
			value="<%= bean.getModifiedBy() %>"> <input type="hidden"
			name="createdDatetime"
			value="<%= DataUtility.getTimestamp(bean.getCreatedDatetime()) %>">
		<input type="hidden" name="modifiedDatetime"
			value="<%= DataUtility.getTimestamp(bean.getModifiedDatetime()) %>">

		<% List list = (List)request.getAttribute("courseList"); %>

		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="courseId" style="color: #007bff;"> <i
					class="fas fa-book"></i> Course Name:
				</label>
				<%= HTMLUtility.getList("courseId", String.valueOf(bean.getCourseId()), list) %>
				<font color="red" style="font-size: 13px"><%= ServletUtility.getErrorMessage("courseId", request) %></font>
			</div>
			<%
                LinkedHashMap map = new LinkedHashMap();
                map.put("Ist Semester", "Ist Semester");
                map.put("IInd Semester", "IInd Semester");
                map.put("IIIrd Semester", "IIIrd Semester");
                map.put("IVth Semester", "IVth Semester");
                map.put("Vth Semester", "Vth Semester");
                map.put("VIth Semester", "VIth Semester");
            %>
			<div class="form-group col-md-6">
				<label for="semester" style="color: #007bff;"> <i
					class="fas fa-calendar-alt"></i> Semester:
				</label>
				<%= HTMLUtility.getList("semester", String.valueOf(bean.getSemester()), map) %>
				<font color="red" style="font-size: 13px"><%= ServletUtility.getErrorMessage("semester", request) %></font>
			</div>
		</div>

		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="firstName" style="color: #007bff;"> <i
					class="fas fa-user"></i> First Name:
				</label> <input type="text" class="form-control" name="firstName"
					placeholder="Enter First Name"
					value="<%= DataUtility.getStringData(bean.getFirstName()) %>">
				<font color="red" style="font-size: 13px"><%= ServletUtility.getErrorMessage("firstName", request) %></font>
			</div>
			<div class="form-group col-md-6">
				<label for="lastName" style="color: #007bff;"> <i
					class="fas fa-user"></i> Last Name:
				</label> <input type="text" class="form-control" name="lastName"
					placeholder="Enter Last Name"
					value="<%= DataUtility.getStringData(bean.getLastName()) %>">
				<font color="red" style="font-size: 13px"><%= ServletUtility.getErrorMessage("lastName", request) %></font>
			</div>
		</div>

		<div class="form-group">
			<label for="email" style="color: #007bff;"> <i
				class="fas fa-envelope"></i> Email Id:
			</label> <input type="text" class="form-control" name="email"
				placeholder="Enter Email Id..."
				value="<%= DataUtility.getStringData(bean.getEmailId()) %>">
			<font color="red" style="font-size: 13px"><%= ServletUtility.getErrorMessage("email", request) %></font>
		</div>

		<% HashMap map1 = new HashMap();
            map1.put("Male", "Male");
            map1.put("Female", "Female"); %>

		<div class="form-group">
			<label for="gender" style="color: #007bff;"> <i
				class="fas fa-venus-mars"></i> Gender:
			</label>
			<%= HTMLUtility.getList("gender", String.valueOf(bean.getGender()), map1) %>
			<font color="red" style="font-size: 13px"><%= ServletUtility.getErrorMessage("gender", request) %></font>
		</div>

		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="dob" style="color: #007bff;"> <i
					class="fas fa-calendar-alt"></i> Date Of Birth:
				</label> <input type="text" class="form-control" name="dob"
					placeholder="Enter Date Of Birth.."
					value="<%= DataUtility.getDateString(bean.getDob()) %>"> <font
					color="red" style="font-size: 13px"><%= ServletUtility.getErrorMessage("dob", request) %></font>
			</div>
			<div class="form-group col-md-6">
				<label for="mobileNo" style="color: #007bff;"> <i
					class="fas fa-phone"></i> Mobile No:
				</label> <input type="text" class="form-control" name="mobileNo"
					placeholder="Enter Mobile No"
					value="<%= DataUtility.getStringData(bean.getMobileNo()) %>">
				<font color="red" style="font-size: 13px"><%= ServletUtility.getErrorMessage("mobileNo", request) %></font>
			</div>
		</div>

		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="fatherEmail" style="color: #007bff;"> <i
					class="fas fa-envelope"></i> Father Email Id:
				</label> <input type="text" class="form-control" name="fatherEmail"
					placeholder="Enter Father Email Id.."
					value="<%= DataUtility.getStringData(bean.getFatherEmailId()) %>">
				<font color="red" style="font-size: 13px"><%= ServletUtility.getErrorMessage("fatherEmail", request) %></font>
			</div>
			<div class="form-group col-md-6">
				<label for="fmobileNo" style="color: #007bff;"> <i
					class="fas fa-phone"></i> Father Mobile No:
				</label> <input type="text" class="form-control" name="fmobileNo"
					placeholder="Enter Father Mobile No..."
					value="<%= DataUtility.getStringData(bean.getFatherMobileNo()) %>">
				<font color="red" style="font-size: 13px"><%= ServletUtility.getErrorMessage("fmobileNo", request) %></font>
			</div>
		</div>

		<div class="form-row">
			<div class="form-group" style="margin-top: 20px; margin-left: 10px;">
				<button type="submit" name="operation" class="btn"
					value="<%= StudentCtl.OP_SAVE %>"
					style="background-color: #007bff; border-color: #007bff; color: #fff; border: 1px solid transparent; border-radius: 0.375rem; padding: 0.5rem 1rem; font-size: 1rem; font-weight: 400; line-height: 1.5;">
					<i class="fas fa-save"></i> Save
				</button>
				<button type="submit" name="operation" class="btn"
					value="<%= StudentCtl.OP_RESET %>"
					style="background-color: #007bff; border-color: #007bff; color: #fff; border: 1px solid transparent; border-radius: 0.375rem; padding: 0.5rem 1rem; font-size: 1rem; font-weight: 400; line-height: 1.5; margin-left: 10px;">
					<i class="fas fa-undo"></i> Reset
				</button>
			</div>
		</div>

		<br>
		<br>
	</form>
</div>
<br>
<br>
<%@ include file="Footer.jsp"%>
