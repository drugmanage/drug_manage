<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>销售开票单管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
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
		<li class="active"><a href="${ctx}/sales/salesOrder/">销售开票单列表</a></li>
		<shiro:hasPermission name="sales:salesOrder:edit"><li><a href="${ctx}/sales/salesOrder/form">销售开票单添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="salesOrder" action="${ctx}/sales/salesOrder/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>单据编号：</label>
				<form:input path="documentNum" htmlEscape="false" maxlength="32" class="input-medium"/>
			</li>
			<li><label>单据状态：</label>
				<form:input path="status" htmlEscape="false" maxlength="2" class="input-medium"/>
			</li>
			<li><label>订单号：</label>
				<form:input path="orderNum" htmlEscape="false" maxlength="32" class="input-medium"/>
			</li>
			<li><label>制单日期：</label>
				<input name="orderTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${salesOrder.orderTime}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
			</li>
			<li><label>出货仓库：</label>
				<form:input path="repoId" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>客户名称：</label>
				<form:input path="customerName" htmlEscape="false" maxlength="32" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<div class="tab-content">
		<table id="contentTable" class="table table-striped table-bordered table-condensed">
			<thead>
				<tr>
					<th>单据编号</th>
					<th>单据状态</th>
					<th>订单号</th>
					<th>制单日期</th>
					<th>出货仓库</th>
					<th>客户名称</th>
					<th>发票类型</th>
					<th>货运类型</th>
					<th>结算对象</th>
					<th>区域经理</th>
					<th>业务员</th>
					<th>单据属性</th>
					<th>是否单位账客户</th>
					<th>客户属性</th>
					<th>创建者</th>
					<th>创建时间</th>
					<th>备注信息</th>
					<shiro:hasPermission name="sales:salesOrder:edit"><th>操作</th></shiro:hasPermission>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${page.list}" var="salesOrder">
				<tr>
					<td><a href="${ctx}/sales/salesOrder/form?id=${salesOrder.id}">
						${salesOrder.documentNum}
					</a></td>
					<td>
						${salesOrder.status}
					</td>
					<td>
						${salesOrder.orderNum}
					</td>
					<td>
						<fmt:formatDate value="${salesOrder.orderTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
					</td>
					<td>
						${salesOrder.repoId}
					</td>
					<td>
						${salesOrder.customerName}
					</td>
					<td>
						${fns:getDictLabel(salesOrder.invoiceType, 'invoice_type', '')}
					</td>
					<td>
						${fns:getDictLabel(salesOrder.freightType, 'freight_type', '')}
					</td>
					<td>
						${salesOrder.settlementObjectId}
					</td>
					<td>
						${salesOrder.manageId}
					</td>
					<td>
						${salesOrder.salemanId}
					</td>
					<td>
						${fns:getDictLabel(salesOrder.documentAttr, 'document_attr', '')}
					</td>
					<td>
						${fns:getDictLabel(salesOrder.unitFlag, 'unit_flag', '')}
					</td>
					<td>
						${fns:getDictLabel(salesOrder.customerAttr, 'customer_attr', '')}
					</td>
					<td>
						${salesOrder.createBy.id}
					</td>
					<td>
						<fmt:formatDate value="${salesOrder.createDate}" pattern="yyyy-MM-dd"/>
					</td>
					<td>
						${salesOrder.remarks}
					</td>
					<shiro:hasPermission name="sales:salesOrder:edit"><td>
	    				<a href="${ctx}/sales/salesOrder/form?id=${salesOrder.id}">修改</a>
						<a href="${ctx}/sales/salesOrder/delete?id=${salesOrder.id}" onclick="return confirmx('确认要删除该销售开票单吗？', this.href)">删除</a>
					</td></shiro:hasPermission>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="pagination">${page}</div>
</body>
</html>