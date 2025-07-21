
<%@page
	import="in.co.college.att.mgt.controller.SemesterAttendanceListCtl"%>
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
<div class="container"
	style="border: ridge; margin-top: 20px; margin-left: 50px">
	<div style="margin-top: 18px">
		<h2>Semester Attendance</h2>
	</div>

	<jsp:useBean id="bean" class="in.co.college.att.mgt.bean.AttendaceBean"
		scope="request"></jsp:useBean>
	<b><font color="red"><%=ServletUtility.getErrorMessage(request)%></font></b>
	<b><font color="green"><%=ServletUtility.getSuccessMessage(request)%></font></b>
	<form style="width: 60%; margin-top: 25px"
		action="<%=CASView.SEMESTER_ATTENDACE_LIST_CTL%>" method="post">

		<input type="hidden" name="id" value="<%=bean.getId()%>"> <input
			type="hidden" name="createdBy" value="<%=bean.getCreatedBy()%>">
		<input type="hidden" name="modifiedBy"
			value="<%=bean.getModifiedBy()%>"> <input type="hidden"
			name="createdDatetime"
			value="<%=DataUtility.getTimestamp(bean.getCreatedDatetime())%>">
		<input type="hidden" name="modifiedDatetime"
			value="<%=DataUtility.getTimestamp(bean.getModifiedDatetime())%>">
		<% List list=(List)request.getAttribute("courseList"); %>




		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="inputEmail4">Course Name:</label>
				<%=HTMLUtility.getList("courseId",String.valueOf(bean.getSubjectId()), list)%>
				<font color="red" style="font-size: 13px"><%=ServletUtility.getErrorMessage("courseId", request)%></font>
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
				<label for="inputPassword4"> Semester:</label>
				<%=HTMLUtility.getList("semester",String.valueOf(bean.getSemester()), map)%>
				<font color="red" style="font-size: 13px"><%=ServletUtility.getErrorMessage("semester", request)%></font>
			</div>
		</div>





		<input type="submit" name="operation" class="btn btn-primary"
			value="<%=SemesterAttendanceListCtl.OP_SUBMIT%>"> or <input
			type="submit" name="operation" class="btn btn-primary"
			value="<%=SemesterAttendanceListCtl.OP_RESET%>"> <br>
		<br>
	</form>
</div>
<br>
<br>
<div style="margin-top: 165px;">
	<%@ include file="Footer.jsp"%>
</div>