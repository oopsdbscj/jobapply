<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>搜索首页</title>
</head>
<body>
	<fieldset>
		<legend>职位搜索</legend>
		<s:form action="jasearch_search">
			<s:select name="qo.city" label="工作城市" list="cities" listKey="id"
				listValue="name" headerKey="-1" headerValue="--请选择--" />
			<s:select name="qo.trade" label="所属行业" list="rades" listKey="id"
				listValue="name" headerKey="-1" headerValue="--请选择--" />
			<s:select name="qo.company" label="公司类型" list="companyTypes"
				listKey="id" listValue="name" headerKey="-1" headerValue="--请选择--" />
			<s:select name="qo.salaryLevel" label="薪酬范围" list="salaryLevels"
				listKey="id" listValue="name" headerKey="-1" headerValue="--请选择--" />
			<s:textfield name="qo.keyWords" value="%{qo.keyWords}" label="关键字" />
			<s:submit align="left" value="搜索" />
		</s:form>
	</fieldset>
	<hr />
	<table border="1" width="1300" style="border-color: red"
		cellspacing="0">
		<tr>
			<th>职位名称</th>
			<th>所在城市</th>
			<th>公司名称</th>
			<th>所在行业</th>
			<th>薪资范围</th>
		</tr>
		<s:iterator value="#results">
			<tr>
				<%-- 				<td><s:property value="title" /></td> --%>
				<%-- 				<td>${title}</td> --%>
				<!-- 				上一行还可替代为下面一行的写法 -->
				<td><s:property value="title" escapeHtml="false" /></td>
				<td><s:property value="city" /></td>
				<td><s:property value="company" /></td>
				<td><s:property value="trade" /></td>
				<td><s:property value="salaryScope" /></td>
			</tr>
		</s:iterator>
	</table>
</body>
</html>