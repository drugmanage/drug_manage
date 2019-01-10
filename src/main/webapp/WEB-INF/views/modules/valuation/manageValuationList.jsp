<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>区域经理定价管理</title>
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
		<li class="active"><a href="${ctx}/valuation/manageValuation/">区域经理定价列表</a></li>
		<shiro:hasPermission name="valuation:manageValuation:edit"><li><a href="${ctx}/valuation/manageValuation/form">区域经理定价添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="manageValuation" action="${ctx}/valuation/manageValuation/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>区域经理id</th>
				<th>定价表id</th>
				<th>加价价格</th>
				<th>创建者</th>
				<th>创建时间</th>
				<th>更新者</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="valuation:manageValuation:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="manageValuation">
			<tr>
				<td><a href="${ctx}/valuation/manageValuation/form?id=${manageValuation.id}">
					${manageValuation.manageId}
				</a></td>
				<td>
					${manageValuation.valuationId}
				</td>
				<td>
					${manageValuation.markupPrice}
				</td>
				<td>
					${manageValuation.createBy.id}
				</td>
				<td>
					<fmt:formatDate value="${manageValuation.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${manageValuation.updateBy.id}
				</td>
				<td>
					<fmt:formatDate value="${manageValuation.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${manageValuation.remarks}
				</td>
				<shiro:hasPermission name="valuation:manageValuation:edit"><td>
    				<a href="${ctx}/valuation/manageValuation/form?id=${manageValuation.id}">修改</a>
					<a href="${ctx}/valuation/manageValuation/delete?id=${manageValuation.id}" onclick="return confirmx('确认要删除该区域经理定价吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>