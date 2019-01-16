<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>采购订单管理</title>
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
    <li class="active"><a href="${ctx}/purchase/purchaseOrder/">采购订单列表</a></li>
    <shiro:hasPermission name="purchase:purchaseOrder:edit">
        <li><a href="${ctx}/purchase/purchaseOrder/form">采购订单添加</a></li>
    </shiro:hasPermission>
</ul>
<form:form id="searchForm" modelAttribute="purchaseOrder" action="${ctx}/purchase/purchaseOrder/" method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
        <li><label>机构：</label>
            <sys:treeselect id="office" name="office.id" value="${purchaseOrder.office.id}" labelName="office.name"
                            labelValue="${purchaseOrder.office.name}"
                            title="部门" url="/sys/office/treeData?type=2" cssClass="input-small" allowClear="true"
                            notAllowSelectParent="true"/>
        </li>
        <li><label>单据编号：</label>
            <form:input path="purchaseNumber" htmlEscape="false" maxlength="10" class="input-medium"/>
        </li>
        <li><label>供应商：</label>
            <form:select path="supplier" class="input-xlselect ">
                <form:option value="" label=""/>
                <form:options items="${purchaseOrder.suppliers}" itemLabel="name" itemValue="id" htmlEscape="false"/>
            </form:select>
        </li>
        <li><label>采购员：</label>
            <form:select path="hrmUser" class="input-xlselect ">
                <form:option value="" label=""/>
                <form:options items="${purchaseOrder.purchases}" itemLabel="empName" itemValue="id" htmlEscape="false"/>
            </form:select>
        </li>
        <li><label>订单日期：</label>
            <input name="orderTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
                   value="<fmt:formatDate value="${purchaseOrder.orderTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
        </li>
        <li><label>入库仓库：</label>
            <form:input path="storehouse" htmlEscape="false" maxlength="3" class="input-medium"/>
        </li>
        <li><label>业务组：</label>
            <form:input path="bizGroup" htmlEscape="false" maxlength="32" class="input-medium"/>
        </li>
        <li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
        <li class="clearfix"></li>
    </ul>
</form:form>
<sys:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>单据编号</th>
        <th>机构</th>
        <th>供应商</th>
        <th>采购员</th>
        <th>订单日期</th>
        <th>摘要</th>
        <th>对方业务员</th>
        <th>入库仓库</th>
        <th>业务组</th>
        <th>更新时间</th>
        <th>备注信息</th>
        <shiro:hasPermission name="purchase:purchaseOrder:edit">
            <th>操作</th>
        </shiro:hasPermission>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="purchaseOrder">
        <tr>
            <td><a href="${ctx}/purchase/purchaseOrder/form?id=${purchaseOrder.id}">
                    ${purchaseOrder.purchaseNumber}
            </a></td>
            <td>
                    ${purchaseOrder.office.name}
            </td>
            <td>
                    ${purchaseOrder.supplier.name}
            </td>
            <td>
                    ${purchaseOrder.hrmUser.empName}
            </td>
            <td>
                <fmt:formatDate value="${purchaseOrder.orderTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
            <td>
                    ${purchaseOrder.summary}
            </td>
            <td>
                    ${purchaseOrder.salespersonId}
            </td>
            <td>
                    ${purchaseOrder.storehouse}
            </td>
            <td>
                    ${purchaseOrder.bizGroup}
            </td>
            <td>
                <fmt:formatDate value="${purchaseOrder.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </td>
            <td>
                    ${purchaseOrder.remarks}
            </td>
            <shiro:hasPermission name="purchase:purchaseOrder:edit">
                <td>
                    <a href="${ctx}/purchase/purchaseOrder/form?id=${purchaseOrder.id}">修改</a>
                    <a href="${ctx}/purchase/purchaseOrder/delete?id=${purchaseOrder.id}"
                       onclick="return confirmx('确认要删除该采购订单吗？', this.href)">删除</a>
                </td>
            </shiro:hasPermission>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>