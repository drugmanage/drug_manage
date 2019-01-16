<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>业务员定价管理</title>
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
		<li class="active"><a href="${ctx}/valuation/saleValuation/">业务员定价列表</a></li>
		<shiro:hasPermission name="valuation:saleValuation:edit"><li><a href="${ctx}/valuation/saleValuation/form">业务员定价添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="saleValuation" action="${ctx}/valuation/saleValuation/" method="post" class="breadcrumb form-search">
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
				<th>业务员id</th>
				<th>商品id</th>
				<th>一类价格</th>
				<th>二类价格</th>
				<th>三类价格</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="valuation:saleValuation:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="saleValuation">
			<tr>
				<td><a href="${ctx}/valuation/saleValuation/form?id=${saleValuation.id}">
					${saleValuation.saleId}
				</a></td>
				<td>
					${saleValuation.goodsId}
				</td>
				<td>
					${saleValuation.onePrice}
				</td>
				<td>
					${saleValuation.twoPrice}
				</td>
				<td>
					${saleValuation.threePrice}
				</td>
				<td>
					<fmt:formatDate value="${saleValuation.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${saleValuation.remarks}
				</td>
				<shiro:hasPermission name="valuation:saleValuation:edit"><td>
    				<a href="${ctx}/valuation/saleValuation/form?id=${saleValuation.id}">修改</a>
					<a href="${ctx}/valuation/saleValuation/delete?id=${saleValuation.id}" onclick="return confirmx('确认要删除该业务员定价吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>