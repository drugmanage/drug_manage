<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>移库单管理</title>
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
		<li class="active"><a href="${ctx}/repo/repoTransfer/">移库单列表</a></li>
		<shiro:hasPermission name="repo:repoTransfer:edit"><li><a href="${ctx}/repo/repoTransfer/form">移库单添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="repoTransfer" action="${ctx}/repo/repoTransfer/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>移库日期：</label>
				<input name="transferDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${repoTransfer.transferDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>移库单号：</label>
				<form:input path="transferNumber" htmlEscape="false" maxlength="32" class="input-medium"/>
			</li>
			<li><label>出库库房：</label>
				<form:input path="outRepoId" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>入库库房：</label>
				<form:input path="inRepoId" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>移库日期</th>
				<th>移库单号</th>
				<th>出库库房</th>
				<th>入库库房</th>
				<th>移库员</th>
				<th>创建者</th>
				<th>创建时间</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="repo:repoTransfer:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="repoTransfer">
			<tr>
				<td><a href="${ctx}/repo/repoTransfer/form?id=${repoTransfer.id}">
					<fmt:formatDate value="${repoTransfer.transferDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</a></td>
				<td>
					${repoTransfer.transferNumber}
				</td>
				<td>
					${repoTransfer.outRepoId}
				</td>
				<td>
					${repoTransfer.inRepoId}
				</td>
				<td>
					${repoTransfer.transferUserId}
				</td>
				<td>
					${repoTransfer.createBy.id}
				</td>
				<td>
					<fmt:formatDate value="${repoTransfer.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					<fmt:formatDate value="${repoTransfer.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${repoTransfer.remarks}
				</td>
				<shiro:hasPermission name="repo:repoTransfer:edit"><td>
    				<a href="${ctx}/repo/repoTransfer/form?id=${repoTransfer.id}">修改</a>
					<a href="${ctx}/repo/repoTransfer/delete?id=${repoTransfer.id}" onclick="return confirmx('确认要删除该移库单吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>