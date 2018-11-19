<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>客户收货地址管理</title>
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
		<li class="active"><a href="${ctx}/customer/customerAddress/">客户收货地址列表</a></li>
		<shiro:hasPermission name="customer:customerAddress:edit"><li><a href="${ctx}/customer/customerAddress/form">客户收货地址添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="customerAddress" action="${ctx}/customer/customerAddress/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>客户表ID：</label>
				<form:input path="customerId" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>收货人：</label>
				<form:input path="receivingName" htmlEscape="false" maxlength="32" class="input-medium"/>
			</li>
			<li><label>区域id：</label>
				<sys:treeselect id="area" name="area.id" value="${customerAddress.area.id}" labelName="area.name" labelValue="${customerAddress.area.name}"
					title="区域" url="/sys/area/treeData" cssClass="input-small" allowClear="true" notAllowSelectParent="true"/>
			</li>
			<li><label>收货地址:街道门牌号：</label>
				<form:input path="receivingAddress" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>联系人电话：</label>
				<form:input path="contactPhone" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<shiro:hasPermission name="customer:customerAddress:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="customerAddress">
			<tr>
				<shiro:hasPermission name="customer:customerAddress:edit"><td>
    				<a href="${ctx}/customer/customerAddress/form?id=${customerAddress.id}">修改</a>
					<a href="${ctx}/customer/customerAddress/delete?id=${customerAddress.id}" onclick="return confirmx('确认要删除该客户收货地址吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>