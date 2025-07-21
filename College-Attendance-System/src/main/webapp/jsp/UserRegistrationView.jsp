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
			<i class="fas fa-user-plus"></i> Add Faculty
		</h2>
	</div>

	<jsp:useBean id="bean" class="in.co.college.att.mgt.bean.UserBean"
		scope="request"></jsp:useBean>
	<b><font color="red"><%=ServletUtility.getErrorMessage(request)%></font></b>
	<b><font color="green"><%=ServletUtility.getSuccessMessage(request)%></font></b>

	<form style="width: 60%; margin-top: 25px"
		action="<%=CASView.USER_REGISTRATION_CTL%>" method="post">
		<input type="hidden" name="id" value="<%=bean.getId()%>"> <input
			type="hidden" name="createdBy" value="<%=bean.getCreatedBy()%>">
		<input type="hidden" name="modifiedBy"
			value="<%=bean.getModifiedBy()%>"> <input type="hidden"
			name="createdDatetime"
			value="<%=DataUtility.getTimestamp(bean.getCreatedDatetime())%>">
		<input type="hidden" name="modifiedDatetime"
			value="<%=DataUtility.getTimestamp(bean.getModifiedDatetime())%>">

		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="inputEmail4" style="color: #007bff;"> <i
					class="fas fa-user"></i> First Name:
				</label> <input type="text" class="form-control" name="firstName"
					placeholder="Enter First Name"
					value="<%=DataUtility.getStringData(bean.getFirstName())%>">
				<font color="red" style="font-size: 13px"><%=ServletUtility.getErrorMessage("firstName", request)%></font>
			</div>
			<div class="form-group col-md-6">
				<label for="inputPassword4" style="color: #007bff;"> <i
					class="fas fa-user"></i> Last Name:
				</label> <input type="text" class="form-control" name="lastName"
					placeholder="Enter Last Name"
					value="<%=DataUtility.getStringData(bean.getLastName())%>">
				<font color="red" style="font-size: 13px"><%=ServletUtility.getErrorMessage("lastName", request)%></font>
			</div>
		</div>

		<div class="form-group">
			<label for="inputAddress" style="color: #007bff;"> <i
				class="fas fa-envelope"></i> Login Id:
			</label> <input type="text" class="form-control" name="login"
				placeholder="Enter Login Id..."
				value="<%=DataUtility.getStringData(bean.getLogin())%>"> <font
				color="red" style="font-size: 13px"><%=ServletUtility.getErrorMessage("login", request)%></font>
		</div>

		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="inputEmail4" style="color: #007bff;"> <i
					class="fas fa-lock"></i> Password:
				</label> <input type="password" class="form-control" name="password"
					placeholder="Enter Password..."
					value="<%=DataUtility.getStringData(bean.getPassword())%>">
				<font color="red" style="font-size: 13px"><%=ServletUtility.getErrorMessage("password", request)%></font>
			</div>
			<div class="form-group col-md-6">
				<label for="inputPassword4" style="color: #007bff;"> <i
					class="fas fa-lock"></i> Confirm Password:
				</label> <input type="password" class="form-control" name="confirmPassword"
					placeholder="Enter Confirm Password"
					value="<%=DataUtility.getStringData(bean.getConfirmPassword())%>">
				<font color="red" style="font-size: 13px"><%=ServletUtility.getErrorMessage("confirmPassword", request)%></font>
			</div>
		</div>

		<%HashMap map = new HashMap();
    map.put("Male", "Male");
    map.put("Female", "Female"); %>

		<div class="form-group">
			<label for="inputAddress" style="color: #007bff;"> <i
				class="fas fa-venus-mars"></i> Gender:
			</label>
			<%=HTMLUtility.getList("gender", String.valueOf(bean.getGender()), map) %>
			<font color="red" style="font-size: 13px"><%=ServletUtility.getErrorMessage("gender", request)%></font>
		</div>

		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="inputEmail4" style="color: #007bff;"> <i
					class="fas fa-calendar-alt"></i> Date Of Birth:
				</label> <input type="text" class="form-control" name="dob" id="datepicker1"
					readonly="readonly" placeholder="Enter Date Of Birth.."
					value="<%=DataUtility.getDateString(bean.getDob())%>"> <font
					color="red" style="font-size: 13px"><%=ServletUtility.getErrorMessage("dob", request)%></font>
			</div>
			<div class="form-group col-md-6">
				<label for="inputPassword4" style="color: #007bff;"> <i
					class="fas fa-phone"></i> Mobile No:
				</label> <input type="text" class="form-control" name="mobile"
					placeholder="Enter Mobile No"
					value="<%=DataUtility.getStringData(bean.getMobileNo())%>">
				<font color="red" style="font-size: 13px"><%=ServletUtility.getErrorMessage("mobile", request)%></font>
			</div>
		</div>

		<div class="form-group" style="margin-top: 20px; margin-left: 10px;">
			<button type="submit" name="operation" class="btn"
				value="<%=UserRegistrationCtl.OP_SAVE%>"
				style="background-color: #007bff; border-color: #007bff; color: #fff; border: 1px solid transparent; border-radius: 0.375rem; padding: 0.5rem 1rem; font-size: 1rem; font-weight: 400; line-height: 1.5; cursor: pointer; transition: background-color 0.3s ease, border-color 0.3s ease, transform 0.3s ease; margin-bottom: 10px;"
				onmouseover="this.style.backgroundColor='#0056b3'; this.style.borderColor='#0056b3'; this.style.transform='scale(1.05)';"
				onmouseout="this.style.backgroundColor='#007bff'; this.style.borderColor='#007bff'; this.style.transform='scale(1)';">
				<i class="fas fa-save"></i> Save
			</button>
			<button type="submit" name="operation" class="btn"
				value="<%=UserRegistrationCtl.OP_RESET%>"
				style="background-color: #007bff; border-color: #007bff; color: #fff; border: 1px solid transparent; border-radius: 0.375rem; padding: 0.5rem 1rem; font-size: 1rem; font-weight: 400; line-height: 1.5; cursor: pointer; transition: background-color 0.3s ease, border-color 0.3s ease, transform 0.3s ease; margin-left: 20px; margin-bottom: 10px;"
				onmouseover="this.style.backgroundColor='#0056b3'; this.style.borderColor='#0056b3'; this.style.transform='scale(1.05)';"
				onmouseout="this.style.backgroundColor='#007bff'; this.style.borderColor='#007bff'; this.style.transform='scale(1)';">
				<i class="fas fa-undo"></i> Reset
			</button>
		</div>

	</form>
</div>
<br>
<br>
<%@ include file="Footer.jsp"%>
