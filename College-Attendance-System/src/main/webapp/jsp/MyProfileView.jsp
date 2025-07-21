<%@page import="in.co.college.att.mgt.controller.MyProfileCtl"%>
<%@page import="in.co.college.att.mgt.controller.UserRegistrationCtl"%>
<%@page import="in.co.college.att.mgt.util.HTMLUtility"%>
<%@page import="java.util.HashMap"%>
<%@page import="in.co.college.att.mgt.util.DataUtility"%>
<%@page import="in.co.college.att.mgt.util.ServletUtility"%>
<%@ include file="Header.jsp"%>
<div class="container"
	style="border: ridge; margin-top: 20px; margin-left: 50px; padding: 50px;">
	<div style="margin-top: 18px">
		<h2 style="color: #007bff;">
			<i class="fas fa-user"></i> My Profile
		</h2>
	</div>

	<jsp:useBean id="bean" class="in.co.college.att.mgt.bean.UserBean"
		scope="request"></jsp:useBean>
	<b><font color="red"><%=ServletUtility.getErrorMessage(request)%></font></b>
	<b><font color="green"><%=ServletUtility.getSuccessMessage(request)%></font></b>

	<form style="width: 60%; margin-top: 25px"
		action="<%=CASView.MY_PROFILE_CTL%>" method="post">
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

		<%HashMap<String, String> map = new HashMap();
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
					class="fas fa-birthday-cake"></i> Date Of Birth:
				</label> <input type="text" class="form-control" name="dob"
					placeholder="Enter Date Of Birth.."
					value="<%=DataUtility.getDateString(bean.getDob())%>"> <font
					color="red" style="font-size: 13px"><%=ServletUtility.getErrorMessage("dob", request)%></font>
			</div>
			<div class="form-group col-md-6">
				<label for="inputPassword4" style="color: #007bff;"> <i
					class="fas fa-mobile-alt"></i> Mobile No:
				</label> <input type="text" class="form-control" name="mobile"
					placeholder="Enter Mobile No"
					value="<%=DataUtility.getStringData(bean.getMobileNo())%>">
				<font color="red" style="font-size: 13px"><%=ServletUtility.getErrorMessage("mobile", request)%></font>
			</div>
		</div>

		<button type="submit" name="operation" class="btn btn-primary rounded"
			value="<%=MyProfileCtl.OP_SAVE%>" style="background-color: #007bff;">
			<i class="fas fa-save"></i> Save
		</button>
		or
		<button type="submit" name="operation" class="btn btn-primary rounded"
			value="<%=MyProfileCtl.OP_CHANGE_MY_PASSWORD%>"
			style="background-color: #007bff;">
			<i class="fas fa-key"></i> Change Password
		</button>

		<br>
		<br>
	</form>
</div>
<br>
<br>
<%@ include file="Footer.jsp"%>
