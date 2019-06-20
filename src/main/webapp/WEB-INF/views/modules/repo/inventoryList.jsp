<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>盘点表管理</title>
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
		<li class="active"><a href="${ctx}/repo/inventory/">盘点表列表</a></li>
		<shiro:hasPermission name="repo:inventory:edit"><li><a href="${ctx}/repo/inventory/form">盘点表添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="inventory" action="${ctx}/repo/inventory/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>单据编号：</label>
				<form:input path="docNumber" htmlEscape="false" maxlength="32" class="input-medium"/>
			</li>
			<li><label>单据状态：</label>
				<form:input path="status" htmlEscape="false" maxlength="1" class="input-medium"/>
			</li>
			<li><label>盘点仓库：</label>
				<form:input path="repoId" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>盘点人姓名：</label>
				<form:input path="inventoryName" htmlEscape="false" maxlength="32" class="input-medium"/>
			</li>
			<li><label>盘点时间：</label>
				<input name="inventoryTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${inventory.inventoryTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
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
				<th>盘点仓库</th>
				<th>盘点人姓名</th>
				<th>盘点时间</th>
				<th>创建者</th>
				<th>创建时间</th>
				<th>更新者</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="repo:inventory:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="inventory">
			<tr>
				<td><a href="${ctx}/repo/inventory/form?id=${inventory.id}">
					${inventory.docNumber}
				</a></td>
				<td>
					${inventory.status}
				</td>
				<td>
					${inventory.repoId}
				</td>
				<td>
					${inventory.inventoryName}
				</td>
				<td>
					<fmt:formatDate value="${inventory.inventoryTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${inventory.createBy.id}
				</td>
				<td>
					<fmt:formatDate value="${inventory.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${inventory.updateBy.id}
				</td>
				<td>
					<fmt:formatDate value="${inventory.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${inventory.remarks}
				</td>
				<shiro:hasPermission name="repo:inventory:edit"><td>
    				<a href="${ctx}/repo/inventory/form?id=${inventory.id}">修改</a>
					<a href="${ctx}/repo/inventory/delete?id=${inventory.id}" onclick="return confirmx('确认要删除该盘点表吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>