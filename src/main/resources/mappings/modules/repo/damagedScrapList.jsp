<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>破损/报废单管理</title>
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
		<li class="active"><a href="${ctx}/repo/damagedScrap/">破损/报废单列表</a></li>
		<shiro:hasPermission name="repo:damagedScrap:edit"><li><a href="${ctx}/repo/damagedScrap/form">破损/报废单添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="damagedScrap" action="${ctx}/repo/damagedScrap/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>单据编号：</label>
				<form:input path="docNumber" htmlEscape="false" maxlength="32" class="input-medium"/>
			</li>
			<li><label>单据状态：</label>
				<form:input path="status" htmlEscape="false" maxlength="1" class="input-medium"/>
			</li>
			<li><label>仓库：</label>
				<form:input path="repoId" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>单据编号</th>
				<th>单据状态</th>
				<th>仓库</th>
				<th>破损/报废原因</th>
				<th>创建者</th>
				<th>创建时间</th>
				<th>更新者</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="repo:damagedScrap:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="damagedScrap">
			<tr>
				<td><a href="${ctx}/repo/damagedScrap/form?id=${damagedScrap.id}">
					${damagedScrap.docNumber}
				</a></td>
				<td>
					${damagedScrap.status}
				</td>
				<td>
					${damagedScrap.repoId}
				</td>
				<td>
					${damagedScrap.reason}
				</td>
				<td>
					${damagedScrap.createBy.id}
				</td>
				<td>
					<fmt:formatDate value="${damagedScrap.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${damagedScrap.updateBy.id}
				</td>
				<td>
					<fmt:formatDate value="${damagedScrap.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${damagedScrap.remarks}
				</td>
				<shiro:hasPermission name="repo:damagedScrap:edit"><td>
    				<a href="${ctx}/repo/damagedScrap/form?id=${damagedScrap.id}">修改</a>
					<a href="${ctx}/repo/damagedScrap/delete?id=${damagedScrap.id}" onclick="return confirmx('确认要删除该破损/报废单吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>