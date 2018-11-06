<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>转正申请管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/oa/hrmRegularApply/">转正申请列表</a></li>
		<shiro:hasPermission name="oa:hrmRegularApply:edit"><li><a href="${ctx}/oa/hrmRegularApply/form">转正申请添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="hrmRegularApply" action="${ctx}/oa/hrmRegularApply/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>员工表ID</th>
				<th>申请时间</th>
				<th>预计转正时间</th>
				<th>预计转正岗位</th>
				<shiro:hasPermission name="oa:hrmRegularApply:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="hrmRegularApply">
			<tr>
				<td><a href="${ctx}/oa/hrmRegularApply/form?id=${hrmRegularApply.id}">
					${hrmRegularApply.hrmUser.name}
				</a></td>
				<td>
					<fmt:formatDate value="${hrmRegularApply.applyTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					<fmt:formatDate value="${hrmRegularApply.estimateTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${hrmRegularApply.estimatePost}
				</td>
				<shiro:hasPermission name="oa:hrmRegularApply:edit"><td>
    				<a href="${ctx}/oa/hrmRegularApply/form?id=${hrmRegularApply.id}">修改</a>
					<a href="${ctx}/oa/hrmRegularApply/delete?id=${hrmRegularApply.id}" onclick="return confirmx('确认要删除该转正申请吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>