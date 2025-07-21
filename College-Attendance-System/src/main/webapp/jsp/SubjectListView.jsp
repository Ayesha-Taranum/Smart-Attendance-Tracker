<%@page import="in.co.college.att.mgt.bean.SubjectBean"%>
<%@page import="in.co.college.att.mgt.controller.SubjectListCtl1"%>
<%@page import="in.co.college.att.mgt.model.CourseModel"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="in.co.college.att.mgt.bean.CourseBean"%>
<%@page import="in.co.college.att.mgt.controller.CourseListCtl"%>
<%@page import="in.co.college.att.mgt.util.ServletUtility"%>
<%@ include file="Header.jsp"%>
<div style="margin-top: 18px;margin-left: 20px;">
	<h2 style="color: #007bff;">
		<i class="fas fa-list"></i> Subject List
	</h2>
</div>

<div style="margin-top: 27px; margin-left: 50px; margin-bottom: 20px; margin-right: 50px;">
	<form class="form-inline" action="<%=CASView.SUBJECT_LIST_CTL%>"
		method="post">
		<div class="form-group" style="display: flex; align-items: center; gap: 20px; width: 100%;">
			<div style="flex: 1;">
			<label for="name" style="color: #007bff;"> <i
				class="fas fa-book"></i> Name:
			</label> &nbsp;&nbsp;&nbsp; <input type="text" class="form-control"
				placeholder="Enter Name" name="name"
				value="<%=ServletUtility.getParameter("name", request)%>">
			</div>
			
		<div style="flex: 1;">
			<label for="cName" style="color: #007bff;"> <i
				class="fas fa-graduation-cap"></i> Course Name:
			</label> &nbsp;&nbsp;&nbsp; <input type="text" class="form-control"
				placeholder="Enter Course Name" name="cName"
				value="<%=ServletUtility.getParameter("cName", request)%>">
		</div>
		<div style="flex: 1;">
			<label for="sCode" style="color: #007bff;"> <i
				class="fas fa-code"></i> Subject Code:
			</label> &nbsp;&nbsp;&nbsp; <input type="text" class="form-control"
				placeholder="Enter Subject Code" name="sCode"
				value="<%=ServletUtility.getParameter("sCode", request)%>">
		</div>
		<div style="display: flex; gap: 10px; padding-top: 20px;">
		<input type="submit" name="operation"
			class="btn btn-primary" value="<%=SubjectListCtl1.OP_SEARCH%>">
		&emsp; <input type="submit" name="operation" class="btn btn-primary"
			value="<%=SubjectListCtl1.OP_RESET%>">
		</div>
		</div>
	</form>
</div>

<b><font color="red"><%=ServletUtility.getErrorMessage(request)%></font></b>
<b><font color="green"><%=ServletUtility.getSuccessMessage(request)%></font></b>

<form action="<%=CASView.SUBJECT_LIST_CTL%>" method="post">
	<div class="table-responsive">
		<table class="table table-bordered">
			<thead>
				<tr>
					<th><input type="checkbox" id="selectall"> Select All</th>
					<th>#</th>
					<th>Course Name</th>
					<th>Name</th>
					<th>Semester</th>
					<th>Subject Code</th>
					<th>Description</th>
					<th>Action</th>
				</tr>
			</thead>

			<%
                int pageNo = ServletUtility.getPageNo(request);
                int pageSize = ServletUtility.getPageSize(request);
                int index = ((pageNo - 1) * pageSize) + 1;
                int size = ServletUtility.getSize(request);
                SubjectBean bean = null;
                List list = ServletUtility.getList(request);
                Iterator<SubjectBean> iterator = list.iterator();
                while (iterator.hasNext()) {
                    bean = iterator.next();
            %>
			<tbody>
				<tr>
					<td><input type="checkbox" class="case" name="ids"
						value="<%=bean.getId()%>"></td>
					<td><%=index++%></td>
					<td><%=bean.getCourseName()%></td>
					<td><%=bean.getName()%></td>
					<td><%=bean.getSemester()%></td>
					<td><%=bean.getSubjectCode()%></td>
					<td><%=bean.getDescription()%></td>
					<td align="center"><a class="btn btn-primary"
						href="subject?id=<%=bean.getId()%>"> <i class="fas fa-edit"></i>
							Edit
					</a></td>
				</tr>
			</tbody>
			<%
                }
            %>
		</table>

		<table width="99%">
			<tr>
				<td><input type="submit" name="operation"
					class="btn btn-primary" value="<%=SubjectListCtl1.OP_PREVIOUS%>"
					<%= (pageNo == 1) ? "disabled" : "" %>></td>

				<td><input type="submit" name="operation"
					class="btn btn-success" value="<%=SubjectListCtl1.OP_NEW%>">
				</td>

				<td><input type="submit" name="operation"
					class="btn btn-danger" value="<%=SubjectListCtl1.OP_DELETE%>"
					<%= (list.size() == 0) ? "disabled" : "" %>></td>

				<%
                    CourseModel model = new CourseModel();
                %>

				<td align="right"><input type="submit" name="operation"
					class="btn btn-primary" value="<%=CourseListCtl.OP_NEXT%>"
					<%= ((list.size() < pageSize) || size == pageNo * pageSize) ? "disabled" : "" %>>
				</td>
			</tr>
		</table>

		<input type="hidden" name="pageNo" value="<%=pageNo%>"> <input
			type="hidden" name="pageSize" value="<%=pageSize%>">
	</div>
</form>

<div style="margin-top: 10px">
	<%@ include file="Footer.jsp"%>
</div>
