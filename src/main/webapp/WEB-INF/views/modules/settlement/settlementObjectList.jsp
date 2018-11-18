<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>结算对象信息管理</title>
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
		<li class="active"><a href="${ctx}/settlement/settlementObject/">结算对象信息列表</a></li>
		<shiro:hasPermission name="settlement:settlementObject:edit"><li><a href="${ctx}/settlement/settlementObject/form">结算对象信息添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="settlementObject" action="${ctx}/settlement/settlementObject/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>结算对象：</label>
				<form:input path="outerId" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>结算对象类型：</label>
				<form:select path="settlementType" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('settlement_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>是否本方标识：</label>
				<form:radiobuttons path="partyFlag" items="${fns:getDictList('party_flag')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>结算对象</th>
				<th>结算对象类型</th>
				<th>底价点</th>
				<th>搬运费</th>
				<th>清单费</th>
				<th>运费</th>
				<th>上货费</th>
				<th>下货费</th>
				<th>本方网营品种结算价格类别</th>
				<th>他人网营品种结算价格类别</th>
				<th>是否本方标识</th>
				<shiro:hasPermission name="settlement:settlementObject:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="settlementObject">
			<tr>
				<td><a href="${ctx}/settlement/settlementObject/form?id=${settlementObject.id}">
					${settlementObject.outerId}
				</a></td>
				<td>
					${fns:getDictLabel(settlementObject.settlementType, 'settlement_type', '')}
				</td>
				<td>
					${settlementObject.bottomPricePoint}
				</td>
				<td>
					${settlementObject.handlingCost}
				</td>
				<td>
					${settlementObject.bills}
				</td>
				<td>
					${settlementObject.freight}
				</td>
				<td>
					${settlementObject.exhibitCost}
				</td>
				<td>
					${settlementObject.deliveryFee}
				</td>
				<td>
					${settlementObject.partyPriceType}
				</td>
				<td>
					${settlementObject.otherPriceType}
				</td>
				<td>
					${fns:getDictLabel(settlementObject.partyFlag, 'party_flag', '')}
				</td>
				<shiro:hasPermission name="settlement:settlementObject:edit"><td>
    				<a href="${ctx}/settlement/settlementObject/form?id=${settlementObject.id}">修改</a>
					<a href="${ctx}/settlement/settlementObject/delete?id=${settlementObject.id}" onclick="return confirmx('确认要删除该结算对象信息吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>