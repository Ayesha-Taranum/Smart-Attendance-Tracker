<%@page import="in.co.college.att.mgt.util.DataUtility"%>
<%@page import="in.co.college.att.mgt.bean.StudentBean"%>
<%@page import="in.co.college.att.mgt.controller.StudentListCtl"%>
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
	<h2 style="color: #007bff;">
		<i class="fas fa-user-graduate" style="color: #007bff;"></i> Student
		List
	</h2>
</div>

<div
	style="margin-top: 27px; margin-left: 50px; margin-bottom: 20px; margin-right: 50px;">
	<form class="form-inline" action="<%=CASView.STUDENT_LIST_CTL%>"
		method="post">
		<div class="form-group"
			style="display: flex; align-items: center; gap: 20px; width: 100%;">
			<div style="flex: 1;">
				<label for="firstName"><i class="fas fa-user"
					style="color: #007bff;"></i> First Name:</label> <input type="text"
					class="form-control" placeholder="Enter First Name"
					name="firstName"
					value="<%=ServletUtility.getParameter("firstName", request)%>">
			</div>
			<div style="flex: 1;">
				<label for="lastName"><i class="fas fa-user"
					style="color: #007bff;"></i> Last Name:</label> <input type="text"
					class="form-control" placeholder="Enter Last Name" name="lastName"
					value="<%=ServletUtility.getParameter("lastName", request)%>">
			</div>
			<div style="flex: 1;">
				<label for="email"><i class="fas fa-envelope"
					style="color: #007bff;"></i> Email:</label> <input type="text"
					class="form-control" placeholder="Enter Email" name="email"
					value="<%=ServletUtility.getParameter("email", request)%>">
			</div>
			<div style="display: flex; gap: 10px; padding-top: 20px;">
				<button type="submit" name="operation"
					class="btn btn-primary rounded"
					value="<%=StudentListCtl.OP_SEARCH%>"
					style="background-color: #007bff; border-color: #007bff; color: #fff; border: 1px solid transparent; border-radius: 0.375rem; padding: 0.5rem 1rem; font-size: 1rem; font-weight: 400; line-height: 1.5; cursor: pointer; transition: background-color 0.3s ease, border-color 0.3s ease, transform 0.3s ease;"
					onmouseover="this.style.backgroundColor='#0056b3'; this.style.borderColor='#0056b3'; this.style.transform='scale(1.05)';"
					onmouseout="this.style.backgroundColor='#007bff'; this.style.borderColor='#007bff'; this.style.transform='scale(1)';">
					<i class="fas fa-search"></i> Search
				</button>
				<button type="submit" name="operation"
					class="btn btn-secondary rounded"
					value="<%=StudentListCtl.OP_RESET%>"
					style="background-color: #6c757d; border-color: #6c757d; color: #fff; border: 1px solid transparent; border-radius: 0.375rem; padding: 0.5rem 1rem; font-size: 1rem; font-weight: 400; line-height: 1.5; cursor: pointer; transition: background-color 0.3s ease, border-color 0.3s ease, transform 0.3s ease;"
					onmouseover="this.style.backgroundColor='#5a6268'; this.style.borderColor='#545b62'; this.style.transform='scale(1.05)';"
					onmouseout="this.style.backgroundColor='#6c757d'; this.style.borderColor='#6c757d'; this.style.transform='scale(1)';">
					<i class="fas fa-redo"></i> Reset
				</button>
			</div>
		</div>
	</form>
</div>

<b><font color="red"><%=ServletUtility.getErrorMessage(request)%></font></b>
<b><font color="green"><%=ServletUtility.getSuccessMessage(request)%></font></b>

<form action="<%=CASView.STUDENT_LIST_CTL%>" method="post">
	<div class="table-responsive">
		<table class="table table-bordered table-striped table-hover">
			<thead class="thead-dark">
				<tr>
					<th><input type="checkbox" id="selectall"
						class="form-check-input" style="visibility: visible;"> <i
						class="fas fa-check-circle" style="color: #007bff;"></i> Select
						All</th>
					<th># <i class="fas fa-hashtag" style="color: #007bff;"></i></th>
					<th>Course Name <i class="fas fa-book" style="color: #007bff;"></i></th>
					<th>Semester <i class="fas fa-calendar-alt"
						style="color: #007bff;"></i></th>
					<th>Roll No <i class="fas fa-id-card" style="color: #007bff;"></i></th>
					<th>Name <i class="fas fa-user" style="color: #007bff;"></i></th>
					<th>Email <i class="fas fa-envelope" style="color: #007bff;"></i></th>
					<th>Date Of Birth <i class="fas fa-calendar-day"
						style="color: #007bff;"></i></th>
					<th>Gender <i class="fas fa-venus-mars"
						style="color: #007bff;"></i></th>
					<th>Mobile <i class="fas fa-mobile-alt"
						style="color: #007bff;"></i></th>
					<th>Father EmailId <i class="fas fa-envelope-open-text"
						style="color: #007bff;"></i></th>
					<th>Father MobileNo <i class="fas fa-mobile-alt"
						style="color: #007bff;"></i></th>
					<th>Action <i class="fas fa-cogs" style="color: #007bff;"></i></th>
				</tr>
			</thead>

			<tbody>
				<% 
          int pageNo = ServletUtility.getPageNo(request);
          int pageSize = ServletUtility.getPageSize(request);
          int index = ((pageNo - 1) * pageSize) + 1;
          int size = ServletUtility.getSize(request);
          StudentBean bean = null;
          List<StudentBean> list = ServletUtility.getList(request);
          Iterator<StudentBean> iterator = list.iterator();
          while (iterator.hasNext()) {
            bean = iterator.next();
        %>
				<tr>
					<td><input type="checkbox" class="form-check-input case"
						name="ids" value="<%=bean.getId()%>"></td>
					<td><%=index++%></td>
					<td><%=bean.getCourseName()%></td>
					<td><%=bean.getSemester()%></td>
					<td><%=bean.getRollNo()%></td>
					<td><%=bean.getFirstName()+" "+bean.getLastName()%></td>
					<td><%=bean.getEmailId()%></td>
					<td><%=DataUtility.getDateString(bean.getDob())%></td>
					<td><%=bean.getGender()%></td>
					<td><%=bean.getMobileNo()%></td>
					<td><%=bean.getFatherEmailId()%></td>
					<td><%=bean.getFatherMobileNo()%></td>
					<td align="center"><a class="btn btn-sm btn-primary rounded"
						href="student?id=<%=bean.getId()%>"
						style="background-color: #007bff; border-color: #007bff; color: #fff; border: 1px solid transparent; border-radius: 0.375rem; padding: 0.25rem 0.5rem; font-size: 0.875rem; font-weight: 400; line-height: 1.5; cursor: pointer; transition: background-color 0.3s ease, border-color 0.3s ease, transform 0.3s ease;"
						onmouseover="this.style.backgroundColor='#0056b3'; this.style.borderColor='#0056b3'; this.style.transform='scale(1.05)';"
						onmouseout="this.style.backgroundColor='#007bff'; this.style.borderColor='#007bff'; this.style.transform='scale(1)';">
							<i class="fas fa-edit" style="color: #fff;"></i> Edit
					</a></td>
				</tr>
				<% } %>
			</tbody>
		</table>

		<div class="d-flex justify-content-between align-items-center"
			style="margin-left: 30px; margin-right: 30px;">
			<button type="submit" name="operation"
				class="btn btn-outline-primary rounded"
				value="<%=StudentListCtl.OP_PREVIOUS%>"
				<%=(pageNo == 1) ? "disabled" : ""%>
				style="border-color: #007bff; color: #007bff; transition: color 0.3s ease, border-color 0.3s ease, background-color 0.3s ease;"
				onmouseover="this.style.borderColor='#0056b3'; this.style.color='#0056b3';"
				onmouseout="this.style.borderColor='#007bff'; this.style.color='#007bff';">
				<i class="fas fa-chevron-left" style="color: #007bff;"></i> Previous
			</button>

			<button type="submit" name="operation"
				class="btn btn-outline-success rounded"
				value="<%=StudentListCtl.OP_NEW%>"
				style="border-color: #28a745; color: #28a745; transition: color 0.3s ease, border-color 0.3s ease, background-color 0.3s ease;"
				onmouseover="this.style.borderColor='#218838'; this.style.color='#ffffff'; this.querySelector('i').style.color='#ffffff';"
				onmouseout="this.style.borderColor='#28a745'; this.style.color='#28a745'; this.querySelector('i').style.color='#28a745';">
				<i class="fas fa-plus" style="color: #28a745;"></i> New
			</button>

			<button type="submit" name="operation"
				class="btn btn-outline-danger rounded"
				value="<%=StudentListCtl.OP_DELETE%>"
				<%=(list.size() == 0) ? "disabled" : ""%>
				style="border-color: #dc3545; color: #dc3545; transition: color 0.3s ease, border-color 0.3s ease, background-color 0.3s ease;"
				onmouseover="this.style.borderColor='#c82333'; this.style.color='#ffffff'; this.querySelector('i').style.color='#ffffff';"
				onmouseout="this.style.borderColor='#dc3545'; this.style.color='#dc3545'; this.querySelector('i').style.color='#dc3545';">
				<i class="fas fa-trash" style="color: #dc3545;"></i> Delete
			</button>

			<button type="submit" name="operation"
				class="btn btn-outline-primary rounded"
				value="<%=StudentListCtl.OP_NEXT%>"
				<%=(list.size() < pageSize || size == pageNo * pageSize) ? "disabled" : ""%>
				style="border-color: #007bff; color: #007bff; transition: color 0.3s ease, border-color 0.3s ease, background-color 0.3s ease;"
				onmouseover="this.style.borderColor='#0056b3'; this.style.color='#0056b3';"
				onmouseout="this.style.borderColor='#007bff'; this.style.color='#007bff';">
				<i class="fas fa-chevron-right" style="color: #007bff;"></i> Next
			</button>
		</div>

		<input type="hidden" name="pageNo" value="<%=pageNo%>"> <input
			type="hidden" name="pageSize" value="<%=pageSize%>">
	</div>
</form>


<div style="margin-top: 10px;">
	<%@ include file="Footer.jsp"%>
</div>
