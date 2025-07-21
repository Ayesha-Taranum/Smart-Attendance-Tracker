<%@page import="in.co.college.att.mgt.model.CourseModel"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="in.co.college.att.mgt.bean.CourseBean"%>
<%@page import="in.co.college.att.mgt.controller.CourseListCtl"%>
<%@page import="in.co.college.att.mgt.util.ServletUtility"%>
<%@ include file="Header.jsp"%>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

<div style="margin-top: 18px; margin-left: 20px;">
	<h2 style="color: #007bff;">
		<i class="fas fa-book"></i> Course List
	</h2>
</div>
<div
	style="margin-top: 27px; margin-left: 50px; margin-bottom: 20px; margin-right: 50px;">
	<form class="form-inline" action="<%=CASView.COURSE_LIST_CTL%>"
		method="post" style="display: flex; align-items: center; gap: 20px;">
		<div class="form-group" style="flex: 1;">
			<label for="name" style="color: #007bff;"><i
				class="fas fa-tag"></i> Name:</label> <input type="text"
				class="form-control" placeholder="Enter Name" name="name"
				value="<%=ServletUtility.getParameter("name", request)%>">
		</div>
		<div style="display: flex; gap: 10px;">
			<button type="submit" name="operation"
				class="btn btn-primary rounded" value="<%=CourseListCtl.OP_SEARCH%>"
				style="padding: 10px 20px;">
				<i class="fas fa-search"></i> Search
			</button>
			<button type="submit" name="operation"
				class="btn btn-primary rounded" value="<%=CourseListCtl.OP_RESET%>"
				style="padding: 10px 20px;">
				<i class="fas fa-undo"></i> Reset
			</button>
		</div>
	</form>
</div>

<b><font color="red"><%=ServletUtility.getErrorMessage(request)%></font></b>
<b><font color="green"><%=ServletUtility.getSuccessMessage(request)%></font></b>

<form action="<%=CASView.COURSE_LIST_CTL%>" method="post">
	<div class="table-responsive">
		<table class="table table-bordered table-striped table-hover">
			<thead class="thead-dark">
				<tr>
					<th><input type="checkbox" id="selectall"
						class="form-check-input"> <i class="fas fa-check-square"></i>
						Select All</th>
					<th style="color: #007bff;"><i class="fas fa-hashtag"></i> #</th>
					<th style="color: #007bff;"><i class="fas fa-book"></i> Name</th>
					<th style="color: #007bff;"><i class="fas fa-align-left"></i>
						Description</th>
					<th style="color: #007bff;"><i class="fas fa-tools"></i>
						Action</th>
				</tr>
			</thead>
			<tbody>
				<%
                int pageNo = ServletUtility.getPageNo(request);
                int pageSize = ServletUtility.getPageSize(request);
                int index = ((pageNo - 1) * pageSize) + 1;

                CourseBean bean = null;
                List list = ServletUtility.getList(request);
                Iterator<CourseBean> iterator = list.iterator();
                while (iterator.hasNext()) {
                    bean = iterator.next();
                %>
				<tr>
					<td><input type="checkbox" class="form-check-input case"
						name="ids" value="<%=bean.getId()%>"></td>
					<td style="color: #007bff;"><%=index++%></td>
					<td style="color: #007bff;"><%=bean.getName()%></td>
					<td style="color: #007bff;"><%=bean.getDescription()%></td>
					<td align="center"><a class="btn btn-sm btn-primary rounded"
						href="course?id=<%=bean.getId()%>"> <i class="fas fa-edit"></i>
							Edit
					</a></td>
				</tr>
				<% } %>
			</tbody>
		</table>

		<div class="d-flex justify-content-around align-items-center"
			style="margin-left: 30px; margin-right: 30px;">
			<button type="submit" name="operation"
				class="btn btn-outline-primary rounded"
				value="<%=CourseListCtl.OP_PREVIOUS%>"
				<%=(pageNo == 1) ? "disabled" : ""%>>
				<i class="fas fa-arrow-left"></i> Previous
			</button>
			<div>
				<button type="submit" name="operation"
					class="btn btn-outline-success mx-2 rounded"
					value="<%=CourseListCtl.OP_NEW%>">
					<i class="fas fa-plus"></i> New
				</button>
				<button type="submit" name="operation"
					class="btn btn-outline-danger mx-2 rounded"
					value="<%=CourseListCtl.OP_DELETE%>"
					<%=(list.size() == 0) ? "disabled" : ""%>>
					<i class="fas fa-trash"></i> Delete
				</button>
			</div>
			<button type="submit" name="operation"
				class="btn btn-outline-primary rounded"
				value="<%=CourseListCtl.OP_NEXT%>"
				<%=((list.size() < pageSize) || new CourseModel().nextPK() - 1 == bean.getId()) ? "disabled" : ""%>>
				Next <i class="fas fa-arrow-right"></i>
			</button>
		</div>

		<input type="hidden" name="pageNo" value="<%=pageNo%>"> <input
			type="hidden" name="pageSize" value="<%=pageSize%>">
	</div>
</form>

<div style="margin-top: 10px;">
	<%@ include file="Footer.jsp"%>
</div>
