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

<div style="margin-top: 18px; margin-left: 20px;">
	<h2>
		<i class="fas fa-user-tie"></i> Assign Faculty List
	</h2>
</div>

<div
	style="margin-top: 27px; margin-left: 50px; margin-bottom: 20px; margin-right: 50px">
	<form class="form-inline" action="<%=CASView.ASSIGN_FACULTY_LIST_CTL%>"
		method="post">
		<div class="form-group"
			style="display: flex; align-items: center; gap: 20px; width: 100%;">
			<div style="flex: 1;">
				<label for="subjectName"><i class="fas fa-book"></i> Subject
					Name:</label> <input type="text" class="form-control"
					placeholder="Enter Name" name="name"
					value="<%=ServletUtility.getParameter("name", request)%>">
			</div>
			<div style="flex: 1;">
				<label for="facultyName"><i class="fas fa-user"></i> Faculty
					Name:</label> <input type="text" class="form-control"
					placeholder="Enter Faculty Name" name="uName"
					value="<%=ServletUtility.getParameter("uName", request)%>">
			</div>
			<div style="display: flex; gap: 10px;">
				<button type="submit" name="operation"
					class="btn btn-primary rounded"
					value="<%=AssignFacultyListCtl.OP_SEARCH%>">
					<i class="fas fa-search"></i> Search
				</button>
				<button type="submit" name="operation"
					class="btn btn-secondary rounded"
					value="<%=AssignFacultyListCtl.OP_RESET%>">
					<i class="fas fa-redo"></i> Reset
				</button>
			</div>
		</div>
	</form>
</div>

<b><font color="red"><%=ServletUtility.getErrorMessage(request)%></font></b>
<b><font color="green"><%=ServletUtility.getSuccessMessage(request)%></font></b>

<form action="<%=CASView.ASSIGN_FACULTY_LIST_CTL%>" method="post">
	<div class="table-responsive">
		<table class="table table-bordered table-striped table-hover">
			<thead class="thead-dark">
				<tr>
					<th><input type="checkbox" id="selectall"
						class="form-check-input"> Select All</th>
					<th>#</th>
					<th><i class="fas fa-user"></i> Faculty Name</th>
					<th><i class="fas fa-graduation-cap"></i> Course Name</th>
					<th><i class="fas fa-book"></i> Subject Name</th>
					<th><i class="fas fa-layer-group"></i> Semester</th>
					<th><i class="fas fa-calendar-alt"></i> Total Class</th>
					<th><i class="fas fa-cogs"></i> Action</th>
				</tr>
			</thead>

			<tbody>
				<% 
          int pageNo = ServletUtility.getPageNo(request);
          int pageSize = ServletUtility.getPageSize(request);
          int index = ((pageNo - 1) * pageSize) + 1;
          int size = ServletUtility.getSize(request);
          AssignFacultyBean bean = null;
          List list = ServletUtility.getList(request);
          Iterator<AssignFacultyBean> iterator = list.iterator();
          while (iterator.hasNext()) {
            bean = iterator.next();
        %>
				<tr>
					<td><input type="checkbox" class="form-check-input case"
						name="ids" value="<%=bean.getId()%>"></td>
					<td><%=index++%></td>
					<td><%=bean.getUserName()%></td>
					<td><%=bean.getCourseName()%></td>
					<td><%=bean.getSubjectName()%></td>
					<td><%=bean.getSemester()%></td>
					<td><%=bean.getTotalClass()%></td>
					<td align="center"><a class="btn btn-sm btn-primary rounded"
						href="assignFaculty?id=<%=bean.getId()%>"> <i
							class="fas fa-edit"></i> Edit
					</a></td>
				</tr>
				<% } %>
			</tbody>
		</table>

		<div class="d-flex justify-content-around align-items-center"
			style="margin-left: 30px; margin-right: 30px;">
			<button type="submit" name="operation"
				class="btn btn-outline-primary rounded"
				value="<%=AssignFacultyListCtl.OP_PREVIOUS%>"
				<%=(pageNo == 1) ? "disabled" : ""%>>
				<i class="fas fa-chevron-left"></i> Previous
			</button>
			<div>
				<button type="submit" name="operation"
					class="btn btn-outline-success mx-2 rounded"
					value="<%=AssignFacultyListCtl.OP_NEW%>">
					<i class="fas fa-plus"></i> New
				</button>
				<button type="submit" name="operation"
					class="btn btn-outline-danger mx-2 rounded"
					value="<%=AssignFacultyListCtl.OP_DELETE%>"
					<%=(list.size() == 0) ? "disabled" : ""%>>
					<i class="fas fa-trash"></i> Delete
				</button>
			</div>
			<button type="submit" name="operation"
				class="btn btn-outline-primary rounded"
				value="<%=AssignFacultyListCtl.OP_NEXT%>"
				<%=((list.size() < pageSize) || size == pageNo*pageSize) ? "disabled" : ""%>>
				Next <i class="fas fa-chevron-right"></i>
			</button>
		</div>
		<input type="hidden" name="pageNo" value="<%=pageNo%>"> <input
			type="hidden" name="pageSize" value="<%=pageSize%>">
	</div>
</form>

<div style="margin-top: 10px">
	<%@ include file="Footer.jsp"%>
</div>
