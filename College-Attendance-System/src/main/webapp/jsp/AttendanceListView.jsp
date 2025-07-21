<%@page import="in.co.college.att.mgt.util.DataUtility"%>
<%@page import="in.co.college.att.mgt.bean.AttendaceBean"%>
<%@page import="in.co.college.att.mgt.controller.AttendanceListCtl"%>
<%@page import="in.co.college.att.mgt.bean.AssignFacultyBean"%>
<%@page import="in.co.college.att.mgt.controller.AssignFacultyListCtl"%>
<%@page import="in.co.college.att.mgt.bean.SubjectBean"%>
<%@page import="in.co.college.att.mgt.controller.SubjectListCtl1"%>
<%@page import="in.co.college.att.mgt.model.CourseModel"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="in.co.college.att.mgt.bean.CourseBean"%>
<%@page import="in.co.college.att.mgt.controller.CourseListCtl"%>
<%@page import="in.co.college.att.mgt.util.ServletUtility"%>
<%@ include file="Header.jsp"%>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

<div style="margin-top: 18px">
	<h2 style="color: #007bff;">Attendance List</h2>
</div>

<div style="height: 62px; margin-top: 27px; margin-left: 10px">
	<form class="form-inline" action="<%=CASView.ATTENDANCE_LIST_CTL%>"
		method="post" style="display: flex; align-items: center;">
		<div class="form-group" style="margin-right: 15px;">
			<label for="subjectName" style="color: #007bff;"><i
				class="fas fa-book"></i> Subject Name:</label> <input type="text"
				id="subjectName" class="form-control" placeholder="Enter Name"
				name="name"
				value="<%=ServletUtility.getParameter("name", request)%>"
				style="margin-left: 10px;">
		</div>

		<div class="form-group" style="margin-right: 15px;">
			<label for="studentName" style="color: #007bff;"><i
				class="fas fa-user"></i> Student Name:</label> <input type="text"
				id="studentName" class="form-control"
				placeholder="Enter Student Name" name="cName"
				value="<%=ServletUtility.getParameter("cName", request)%>"
				style="margin-left: 10px;">
		</div>

		<div class="form-group">
			<input type="submit" name="operation" class="btn btn-primary"
				value="<%=AttendanceListCtl.OP_SEARCH%>" style="margin-right: 10px;">
			<input type="submit" name="operation" class="btn btn-secondary"
				value="<%=AttendanceListCtl.OP_RESET%>">
		</div>
	</form>
</div>

<b><font color="red"><%=ServletUtility.getErrorMessage(request)%></font></b>
<b><font color="green"><%=ServletUtility.getSuccessMessage(request)%></font></b>

<form action="<%=CASView.ATTENDANCE_LIST_CTL%>" method="post">
	<div class="table-responsive">
		<table class="table table-bordered">
			<thead style="color: #007bff;">
				<tr>
					<th>#</th>
					<th><i class="fas fa-book"></i> Subject Name</th>
					<th><i class="fas fa-user"></i> Student Name</th>
					<th><i class="fas fa-layer-group"></i> Semester</th>
					<th><i class="fas fa-calendar-alt"></i> Date</th>
					<th><i class="fas fa-check-circle"></i> Status</th>
				</tr>
			</thead>

			<%
        int pageNo = ServletUtility.getPageNo(request);
        int pageSize = ServletUtility.getPageSize(request);
        int index = ((pageNo - 1) * pageSize) + 1;
        int size = ServletUtility.getSize(request);
        AttendaceBean bean = null;
        List list = ServletUtility.getList(request);
        Iterator<AttendaceBean> iterator = list.iterator();
        while (iterator.hasNext()) {
          bean = iterator.next();
      %>
			<tbody>
				<tr>
					<td><%=index++%></td>
					<td><%=bean.getSubjectName()%></td>
					<td><%=bean.getStudentName()%></td>
					<td><%=bean.getSemester()%></td>
					<td><%=DataUtility.getDateString(bean.getDate())%></td>
					<% if(bean.getStatus() == 1) { %>
					<td style="color: green;"><i class="fas fa-check"></i> Present</td>
					<% } else { %>
					<td style="color: red;"><i class="fas fa-times"></i> Absent</td>
					<% } %>
				</tr>
			</tbody>
			<% } %>
		</table>
		<table width="99%">
			<tr>
				<td><input type="submit" name="operation"
					class="btn btn-primary" value="<%=AttendanceListCtl.OP_PREVIOUS%>"
					<%= (pageNo == 1) ? "disabled" : "" %>></td>
				<td align="right"><input type="submit" name="operation"
					class="btn btn-primary" value="<%=AttendanceListCtl.OP_NEXT%>"
					<%= ((list.size() < pageSize) || size == pageNo * pageSize) ? "disabled" : "" %>></td>
			</tr>
		</table>
		<input type="hidden" name="pageNo" value="<%=pageNo%>"> <input
			type="hidden" name="pageSize" value="<%=pageSize%>">
	</div>
</form>

<div style="margin-top: 10px">
	<%@ include file="Footer.jsp"%>
</div>
