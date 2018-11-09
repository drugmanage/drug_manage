<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>供应商信息管理</title>
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
		<li class="active"><a href="${ctx}/supplier/supplier/">供应商信息列表</a></li>
		<shiro:hasPermission name="supplier:supplier:edit"><li><a href="${ctx}/supplier/supplier/form">供应商信息添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="supplier" action="${ctx}/supplier/supplier/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>姓名：</label>
				<form:input path="name" htmlEscape="false" maxlength="32" class="input-medium"/>
			</li>
			<li><label>助记码：</label>
				<form:input path="pinyin" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>供应商档案号：</label>
				<form:input path="supplierNumber" htmlEscape="false" maxlength="32" class="input-medium"/>
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
				<th>助记码</th>
				<th>供应商档案号</th>
				<th>法人代表</th>
				<th>企业地址</th>
				<th>企业负责人</th>
				<th>开户银行</th>
				<th>银行账号</th>
				<th>供应商类别</th>
				<th>电话</th>
				<th>传真</th>
				<th>是否停用</th>
				<th>是否设置为结算对象</th>
				<shiro:hasPermission name="supplier:supplier:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="supplier">
			<tr>
				<td><a href="${ctx}/supplier/supplier/form?id=${supplier.id}">
					${supplier.name}
				</a></td>
				<td>
					${supplier.pinyin}
				</td>
				<td>
					${supplier.supplierNumber}
				</td>
				<td>
					${supplier.legalRepresentative}
				</td>
				<td>
					${supplier.enterpriseAddress}
				</td>
				<td>
					${supplier.enterpriseManage}
				</td>
				<td>
					${supplier.bank}
				</td>
				<td>
					${supplier.bankNumber}
				</td>
				<td>
					${fns:getDictLabel(supplier.supplierType, 'supplier_type', '')}
				</td>
				<td>
					${supplier.phone}
				</td>
				<td>
					${supplier.fax}
				</td>
				<td>
					${fns:getDictLabel(supplier.stopFlag, 'stop_flag', '')}
				</td>
				<td>
					${fns:getDictLabel(supplier.settlementFlag, 'settlement_flag', '')}
				</td>
				<shiro:hasPermission name="supplier:supplier:edit"><td>
    				<a href="${ctx}/supplier/supplier/form?id=${supplier.id}">修改</a>
					<a href="${ctx}/supplier/supplier/delete?id=${supplier.id}" onclick="return confirmx('确认要删除该供应商信息吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>