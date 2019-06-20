<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>采购退款开票单管理</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {

        });

        function page(n, s) {
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
    <shiro:hasPermission name="purchase:purchaseBackTicket:edit">
        <li><a href="${ctx}/purchase/purchaseBackTicket/form">采购退款开票单添加</a></li>
    </shiro:hasPermission>
</ul>
<form:form id="searchForm" modelAttribute="purchaseBackTicket" action="${ctx}/purchase/purchaseBackTicket/"
           method="post" class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
        <li><label>机构：</label>
            <sys:treeselect id="office" name="office.id" value="${purchaseBackTicket.office.id}" labelName="office.name"
                            labelValue="${purchaseBackTicket.office.name}"
                            title="部门" url="/sys/office/treeData?type=2" cssClass="input-small" allowClear="true"
                            notAllowSelectParent="true"/>
        </li>
        <li><label>采购订单：</label>
            <form:select path="purchaseOrder" class="input-xlselect ">
                <form:option value="" label=""/>
                <form:options items="${purchaseBackTicket.purchaseOrderList}" itemLabel="purchaseNumber" itemValue="id"
                              htmlEscape="false"/>
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
        <th>退回单单号</th>
        <th>采购订单</th>
        <th>机构</th>
        <th>总不含税金额</th>
        <th>总税额</th>
        <th>总含税金额</th>
        <th>创建人</th>
        <shiro:hasPermission name="purchase:purchaseBackTicket:edit">
            <th>操作</th>
        </shiro:hasPermission>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="purchaseBackTicket">
        <tr>
        	<td><a href="${ctx}/purchase/purchaseBackTicket/form?id=${purchaseBackTicket.id}">
					${purchaseBackTicket.backTicketNumber}
				</a></td>
            <td>
                    ${purchaseBackTicket.purchaseOrder.purchaseNumber}
            </td>
            <td>
                    ${purchaseBackTicket.office.name}
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
            <shiro:hasPermission name="purchase:purchaseBackTicket:edit">
                <td>
                    <a href="${ctx}/purchase/purchaseBackTicket/form?id=${purchaseBackTicket.id}">修改</a>
                    <a href="${ctx}/purchase/purchaseBackTicket/delete?id=${purchaseBackTicket.id}"
                       onclick="return confirmx('确认要删除该采购退款开票单吗？', this.href)">删除</a>
                </td>
            </shiro:hasPermission>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>