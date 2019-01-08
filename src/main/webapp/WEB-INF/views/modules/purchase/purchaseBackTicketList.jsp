<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>采购退款开票单管理</title>
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
		<li class="active"><a href="${ctx}/purchase/purchaseBackTicket/">采购退款开票单列表</a></li>
		<shiro:hasPermission name="purchase:purchaseBackTicket:edit"><li><a href="${ctx}/purchase/purchaseBackTicket/form">采购退款开票单添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="purchaseBackTicket" action="${ctx}/purchase/purchaseBackTicket/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>机构id：</label>
				<sys:treeselect id="office" name="office.id" value="${purchaseBackTicket.office.id}" labelName="office.name" labelValue="${purchaseBackTicket.office.name}"
					title="部门" url="/sys/office/treeData?type=2" cssClass="input-small" allowClear="true" notAllowSelectParent="true"/>
			</li>
			<li><label>采购id：</label>
				<form:input path="purchaseId" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>商品id：</label>
				<form:input path="goodsId" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>退货原因：</label>
				<form:input path="returnReason" htmlEscape="false" maxlength="2" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>机构id</th>
				<th>采购id</th>
				<th>商品id</th>
				<th>单位退货数量</th>
				<th>采购退回总不含税金额</th>
				<th>采购退回总税额</th>
				<th>采购退回总含税金额</th>
				<th>退货原因</th>
				<th>备注信息</th>
				<shiro:hasPermission name="purchase:purchaseBackTicket:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="purchaseBackTicket">
			<tr>
				<td><a href="${ctx}/purchase/purchaseBackTicket/form?id=${purchaseBackTicket.id}">
					${purchaseBackTicket.office.name}
				</a></td>
				<td>
					${purchaseBackTicket.purchaseId}
				</td>
				<td>
					${purchaseBackTicket.goodsId}
				</td>
				<td>
					${purchaseBackTicket.unitBackNumber}
				</td>
				<td>
					${purchaseBackTicket.backPriceTaxFree}
				</td>
				<td>
					${purchaseBackTicket.backPriceTotalTax}
				</td>
				<td>
					${purchaseBackTicket.backPriceTaxAmount}
				</td>
				<td>
					${purchaseBackTicket.returnReason}
				</td>
				<td>
					${purchaseBackTicket.remarks}
				</td>
				<shiro:hasPermission name="purchase:purchaseBackTicket:edit"><td>
    				<a href="${ctx}/purchase/purchaseBackTicket/form?id=${purchaseBackTicket.id}">修改</a>
					<a href="${ctx}/purchase/purchaseBackTicket/delete?id=${purchaseBackTicket.id}" onclick="return confirmx('确认要删除该采购退款开票单吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>