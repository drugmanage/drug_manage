<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>采购补差价单管理</title>
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
		<li class="active"><a href="${ctx}/purchase/purchaseBackDiffPrice/">采购补差价单列表</a></li>
		<shiro:hasPermission name="purchase:purchaseBackDiffPrice:edit"><li><a href="${ctx}/purchase/purchaseBackDiffPrice/form">采购补差价单添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="purchaseBackDiffPrice" action="${ctx}/purchase/purchaseBackDiffPrice/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>机构id：</label>
				<sys:treeselect id="office" name="office.id" value="${purchaseBackDiffPrice.office.id}" labelName="office.name" labelValue="${purchaseBackDiffPrice.office.name}"
					title="部门" url="/sys/office/treeData?type=2" cssClass="input-small" allowClear="true" notAllowSelectParent="true"/>
			</li>
			<li><label>采购id：</label>
				<form:input path="purchaseId" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>商品id：</label>
				<form:input path="goodsId" htmlEscape="false" maxlength="64" class="input-medium"/>
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
				<th>单位退补差价</th>
				<th>退补差价总不含税金额</th>
				<th>退补差价总税额</th>
				<th>退补差价总含税金额</th>
				<th>备注信息</th>
				<shiro:hasPermission name="purchase:purchaseBackDiffPrice:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="purchaseBackDiffPrice">
			<tr>
				<td><a href="${ctx}/purchase/purchaseBackDiffPrice/form?id=${purchaseBackDiffPrice.id}">
					${purchaseBackDiffPrice.office.name}
				</a></td>
				<td>
					${purchaseBackDiffPrice.purchaseId}
				</td>
				<td>
					${purchaseBackDiffPrice.goodsId}
				</td>
				<td>
					${purchaseBackDiffPrice.backPriceUnit}
				</td>
				<td>
					${purchaseBackDiffPrice.backPriceTaxFree}
				</td>
				<td>
					${purchaseBackDiffPrice.backPriceTotalTax}
				</td>
				<td>
					${purchaseBackDiffPrice.backPriceTaxAmount}
				</td>
				<td>
					${purchaseBackDiffPrice.remarks}
				</td>
				<shiro:hasPermission name="purchase:purchaseBackDiffPrice:edit"><td>
    				<a href="${ctx}/purchase/purchaseBackDiffPrice/form?id=${purchaseBackDiffPrice.id}">修改</a>
					<a href="${ctx}/purchase/purchaseBackDiffPrice/delete?id=${purchaseBackDiffPrice.id}" onclick="return confirmx('确认要删除该采购补差价单吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>