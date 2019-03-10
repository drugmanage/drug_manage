<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>库存查询管理</title>
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
		<li class="active"><a href="${ctx}/repo/stock/">库存查询列表</a></li>
		<shiro:hasPermission name="repo:stock:edit"><li><a href="${ctx}/repo/stock/form">库存查询添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="stock" action="${ctx}/repo/stock/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>仓库：</label>
				<form:input path="repoId" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>商品：</label>
				<form:input path="goodsId" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>采购员：</label>
				<form:input path="salemanId" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>入库时间：</label>
				<input name="goodsFirstRepoTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${stock.goodsFirstRepoTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
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
				<th>仓库</th>
				<th>商品</th>
				<th>商品数量</th>
				<th>采购员</th>
				<th>入库时间</th>
				<th>整件件数</th>
				<th>不含税金额</th>
				<th>占用数量</th>
				<th>散件件数</th>
				<th>含税金额</th>
				<th>税额</th>
				<th>创建者</th>
				<th>创建时间</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="repo:stock:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="stock">
			<tr>
				<td><a href="${ctx}/repo/stock/form?id=${stock.id}">
					${stock.repoId}
				</a></td>
				<td>
					${stock.goodsId}
				</td>
				<td>
					${stock.stockNum}
				</td>
				<td>
					${stock.salemanId}
				</td>
				<td>
					<fmt:formatDate value="${stock.goodsFirstRepoTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${stock.wholeNumber}
				</td>
				<td>
					${stock.taxFree}
				</td>
				<td>
					${stock.occupyNum}
				</td>
				<td>
					${stock.piecesNumber}
				</td>
				<td>
					${stock.tax}
				</td>
				<td>
					${stock.taxAmount}
				</td>
				<td>
					${stock.createBy.id}
				</td>
				<td>
					<fmt:formatDate value="${stock.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					<fmt:formatDate value="${stock.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${stock.remarks}
				</td>
				<shiro:hasPermission name="repo:stock:edit"><td>
    				<a href="${ctx}/repo/stock/form?id=${stock.id}">修改</a>
					<a href="${ctx}/repo/stock/delete?id=${stock.id}" onclick="return confirmx('确认要删除该库存查询吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>