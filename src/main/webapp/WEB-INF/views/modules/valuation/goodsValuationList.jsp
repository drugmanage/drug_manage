<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>商品定价管理</title>
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
		<li class="active"><a href="${ctx}/valuation/goodsValuation/">商品定价列表</a></li>
		<shiro:hasPermission name="valuation:goodsValuation:edit"><li><a href="${ctx}/valuation/goodsValuation/form">商品定价添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="goodsValuation" action="${ctx}/valuation/goodsValuation/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
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
				<th>商品id</th>
				<th>第三方查看价格标识</th>
				<th>除第三方外客户标识</th>
				<th>一类价格</th>
				<th>二类价格</th>
				<th>三类价格</th>
				<th>四类价格</th>
				<th>五类价格</th>
				<th>公营价</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="valuation:goodsValuation:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="goodsValuation">
			<tr>
				<td><a href="${ctx}/valuation/goodsValuation/form?id=${goodsValuation.id}">
					${goodsValuation.goodsId}
				</a></td>
				<td>
					${goodsValuation.thirdQueryPriceFlag}
				</td>
				<td>
					${goodsValuation.notThirdQueryPriceFlag}
				</td>
				<td>
					${goodsValuation.onePrice}
				</td>
				<td>
					${goodsValuation.twoPrice}
				</td>
				<td>
					${goodsValuation.threePrice}
				</td>
				<td>
					${goodsValuation.fourPrice}
				</td>
				<td>
					${goodsValuation.fivePrice}
				</td>
				<td>
					${goodsValuation.publicPrice}
				</td>
				<td>
					<fmt:formatDate value="${goodsValuation.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${goodsValuation.remarks}
				</td>
				<shiro:hasPermission name="valuation:goodsValuation:edit"><td>
    				<a href="${ctx}/valuation/goodsValuation/form?id=${goodsValuation.id}">修改</a>
					<a href="${ctx}/valuation/goodsValuation/delete?id=${goodsValuation.id}" onclick="return confirmx('确认要删除该商品定价吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>