<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>收货单管理</title>
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
		<li class="active"><a href="${ctx}/repo/receipt/">收货单列表</a></li>
		<shiro:hasPermission name="repo:receipt:edit"><li><a href="${ctx}/repo/receipt/form">收货单添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="receipt" action="${ctx}/repo/receipt/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>采购信息：</label>
				<form:input path="purchaseId" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>供应商：</label>
				<form:input path="supplierId" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>采购员：</label>
				<form:input path="buyerId" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>订单日期：</label>
				<input name="orderDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${receipt.orderDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>对方业务员：</label>
				<form:input path="otherSalemanId" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>入库仓库：</label>
				<form:input path="repoId" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>业务组：</label>
				<form:input path="bizGroup" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>采购信息</th>
				<th>供应商</th>
				<th>采购员</th>
				<th>订单日期</th>
				<th>对方业务员</th>
				<th>入库仓库</th>
				<th>业务组</th>
				<th>创建者</th>
				<th>创建时间</th>
				<th>更新者</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="repo:receipt:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="receipt">
			<tr>
				<td><a href="${ctx}/repo/receipt/form?id=${receipt.id}">
					${receipt.purchaseId}
				</a></td>
				<td>
					${receipt.supplierId}
				</td>
				<td>
					${receipt.buyerId}
				</td>
				<td>
					<fmt:formatDate value="${receipt.orderDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${receipt.otherSalemanId}
				</td>
				<td>
					${receipt.repoId}
				</td>
				<td>
					${receipt.bizGroup}
				</td>
				<td>
					${receipt.createBy.id}
				</td>
				<td>
					<fmt:formatDate value="${receipt.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${receipt.updateBy.id}
				</td>
				<td>
					<fmt:formatDate value="${receipt.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${receipt.remarks}
				</td>
				<shiro:hasPermission name="repo:receipt:edit"><td>
    				<a href="${ctx}/repo/receipt/form?id=${receipt.id}">修改</a>
					<a href="${ctx}/repo/receipt/delete?id=${receipt.id}" onclick="return confirmx('确认要删除该收货单吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>