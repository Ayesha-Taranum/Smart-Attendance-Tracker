<%@page import="java.util.Iterator"%>
<%@page import="in.co.college.att.mgt.bean.StudentBean"%>
<%@page import="in.co.college.att.mgt.controller.AttendanceCtl"%>
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
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

<div class="container"
	style="border: ridge; margin-top: 20px; margin-left: 50px">
	<div style="margin-top: 18px">
		<h2 style="color: #007bff;">
			<i class="fas fa-check-circle"></i> Make Attendance
		</h2>
	</div>

	<b><font color="red"><%=ServletUtility.getErrorMessage(request)%></font></b>
	<b><font color="green"><%=ServletUtility.getSuccessMessage(request)%></font></b>

	<form style="width: 60%; margin-top: 25px"
		action="<%=CASView.ATTENDANCE_CTL%>" method="post">
		<jsp:useBean id="bean"
			class="in.co.college.att.mgt.bean.AttendaceBean" scope="request"></jsp:useBean>
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
				<label for="courseName" style="color: #007bff;"><i
					class="fas fa-book"></i> Course Name: <%=bean.getCourseName()%></label>
			</div>
			<div class="form-group col-md-6">
				<label for="semester" style="color: #007bff;"><i
					class="fas fa-layer-group"></i> Semester: <%=bean.getSemester()%></label>
			</div>
		</div>
		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="subjectName" style="color: #007bff;"><i
					class="fas fa-chalkboard-teacher"></i> Subject Name: <%=bean.getStudentName()%></label>
			</div>
			<div class="form-group col-md-6">
				<label for="date" style="color: #007bff;"><i
					class="fas fa-calendar-alt"></i> Date: <%=DataUtility.getDateString(bean.getDate())%></label>
			</div>
		</div>
	</form>
</div>
<br>
<br>
<form action="<%=CASView.ATTENDANCE_CTL%>" method="post">
	<input type="hidden" name="id" value="<%=bean.getId()%>"> <input
		type="hidden" name="createdBy" value="<%=bean.getCreatedBy()%>">
	<input type="hidden" name="modifiedBy"
		value="<%=bean.getModifiedBy()%>"> <input type="hidden"
		name="createdDatetime"
		value="<%=DataUtility.getTimestamp(bean.getCreatedDatetime())%>">
	<input type="hidden" name="modifiedDatetime"
		value="<%=DataUtility.getTimestamp(bean.getModifiedDatetime())%>">
	<input type="hidden" name="subjectId" value="<%=bean.getSubjectId()%>">
	<input type="hidden" name="date"
		value="<%=DataUtility.getDateString(bean.getDate())%>">

	<div class="table-responsive">
		<table class="table table-bordered">
			<thead style="color: #007bff;">
				<tr>
					<th>#</th>
					<th><i class="fas fa-id-badge"></i> Roll No</th>
					<th><i class="fas fa-user"></i> Name</th>
					<th align="center"><i class="fas fa-times-circle"></i> Absent</th>
					<th align="center"><i class="fas fa-check-circle"></i> Present</th>
				</tr>
			</thead>
			<%
                int index = 1;
                StudentBean sbean = null;
                List list = ServletUtility.getList(request);
                Iterator<StudentBean> iterator = list.iterator();
                while (iterator.hasNext()) {
                    sbean = iterator.next();
            %>
			<tbody>
				<tr>
					<td><%=index%></td>
					<td><%=sbean.getRollNo()%></td>
					<td><%=sbean.getFirstName() + " " + sbean.getLastName()%></td>
					<td align="center"><input type="checkbox"
						name="status<%=index%>" value="0"></td>
					<td align="center"><input type="checkbox"
						name="status<%=index%>" value="1"></td>
				</tr>
			</tbody>
			<%index = index + 1;%>
			<% } %>
		</table>
		<table width="99%">
			<tr>
				<td><input type="submit" name="operation"
					class="btn btn-primary" value="<%=AttendanceCtl.OP_SAVE%>">
				</td>
			</tr>
		</table>
	</div>
</form>
<br>
<br>
<%@ include file="Footer.jsp"%>
