<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>销售退回开票单管理</title>
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
		<li class="active"><a href="${ctx}/sales/salesBackTicket/">销售退回开票单列表</a></li>
		<shiro:hasPermission name="sales:salesBackTicket:edit"><li><a href="${ctx}/sales/salesBackTicket/form">销售退回开票单添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="salesBackTicket" action="${ctx}/sales/salesBackTicket/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>销售单：</label>
				<form:input path="salesOrder.orderNum" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>创建时间：</label>
				<input name="createDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${salesBackTicket.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
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
				<th>退回单单号</th>
				<th>销售单单号</th>
				<th>总不含税金额</th>
				<th>总税额</th>
				<th>总含税金额</th>
				<th>创建者</th>
				<th>创建时间</th>
				<shiro:hasPermission name="sales:salesBackTicket:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="salesBackTicket">
			<tr>
				<td><a href="${ctx}/sales/salesBackTicket/form?id=${salesBackTicket.id}">
					${salesBackTicket.backTicketNumber}
				</a></td>
				<td>
					${salesBackTicket.salesOrder.orderNum}
				</td>
				<td>
					${salesBackTicket.backPriceTaxFree}
				</td>
				<td>
					${salesBackTicket.backPriceTotalTax}
				</td>
				<td>
					${salesBackTicket.backPriceTaxAmount}
				</td>
				<td>
					${salesBackTicket.createBy.id}
				</td>
				<td>
					<fmt:formatDate value="${salesBackTicket.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<shiro:hasPermission name="sales:salesBackTicket:edit"><td>
    				<a href="${ctx}/sales/salesBackTicket/form?id=${salesBackTicket.id}">修改</a>
					<a href="${ctx}/sales/salesBackTicket/delete?id=${salesBackTicket.id}" onclick="return confirmx('确认要删除该销售退回开票单吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>