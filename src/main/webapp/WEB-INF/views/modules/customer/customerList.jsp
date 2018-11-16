<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>客户资料管理</title>
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
		<li class="active"><a href="${ctx}/customer/customer/">客户资料列表</a></li>
		<shiro:hasPermission name="customer:customer:edit"><li><a href="${ctx}/customer/customer/form">客户资料添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="customer" action="${ctx}/customer/customer/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>姓名：</label>
				<form:input path="name" htmlEscape="false" maxlength="32" class="input-medium"/>
			</li>
			<li><label>机构id：</label>
				<sys:treeselect id="office" name="office.id" value="${customer.office.id}" labelName="office.name" labelValue="${customer.office.name}"
					title="部门" url="/sys/office/treeData?type=2" cssClass="input-small" allowClear="true" notAllowSelectParent="true"/>
			</li>
			<li><label>助记码：</label>
				<form:input path="pinyin" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>客户档案号：</label>
				<form:input path="customerNumber" htmlEscape="false" maxlength="32" class="input-medium"/>
			</li>
			<li><label>法人代表：</label>
				<form:input path="legalRepresentative" htmlEscape="false" maxlength="32" class="input-medium"/>
			</li>
			<li><label>客户类别：</label>
				<form:select path="customerType" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('customer_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>姓名</th>
				<th>所属机构</th>
				<th>助记码</th>
				<th>客户档案号</th>
				<th>法人代表</th>
				<th>企业地址</th>
				<th>客户类别</th>
				<th>纳税类别</th>
				<th>经营范围</th>
				<th>是否停用</th>
				<th>是否为单位账客户</th>
				<th>是否为结算对象</th>
				<th>备注信息</th>
				<shiro:hasPermission name="customer:customer:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="customer">
			<tr>
				<td><a href="${ctx}/customer/customer/form?id=${customer.id}">
					${customer.name}
				</a></td>
				<td>
					${customer.office.name}
				</td>
				<td>
					${customer.pinyin}
				</td>
				<td>
					${customer.customerNumber}
				</td>
				<td>
					${customer.legalRepresentative}
				</td>
				<td>
					${customer.enterpriseAddress}
				</td>
				<td>
					${fns:getDictLabel(customer.customerType, 'customer_type', '')}
				</td>
				<td>
					${fns:getDictLabel(customer.taxableCategory, 'taxable_category', '')}
				</td>
				<td>
					${fns:getDictLabel(customer.bizScope, 'biz_scope', '')}
				</td>
				<td>
					${fns:getDictLabel(customer.stopFlag, 'stop_flag', '')}
				</td>
				<td>
					${fns:getDictLabel(customer.unitFlag, 'unit_flag', '')}
				</td>
				<td>
					${fns:getDictLabel(customer.settlementFlag, 'settlement_flag', '')}
				</td>
				<td>
					${customer.remarks}
				</td>
				<shiro:hasPermission name="customer:customer:edit"><td>
    				<a href="${ctx}/customer/customer/form?id=${customer.id}">修改</a>
					<a href="${ctx}/customer/customer/delete?id=${customer.id}" onclick="return confirmx('确认要删除该客户资料吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>