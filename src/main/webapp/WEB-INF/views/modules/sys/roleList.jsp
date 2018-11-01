<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>角色管理</title>
    <meta name="decorator" content="default"/>
    <script>
        function setFormData(){
            $("#roleName").val( $("#queryRoleName").val());
            $("#engName").val($("#queryEngName").val());
            $("#officeId").val($("#queryOfficeId").val());
            $("#officeName").val($("#queryOfficeName").val());
            $("#dataScope").val($("#queryDataScope").val());

        }

        /**
         * 文本框查询
         * @param event
         */
        $(function(){
            $("#queryRoleName").keyup(function(){
                if(event.keyCode ==13){
                    setFormData();
                    $("#searchForm").submit();
                }
            })

            $("#queryEngName").keyup(function(){
                if(event.keyCode ==13){
                    setFormData();
                    $("#searchForm").submit();
                }
            })
            $("#queryDataScope").change(function(){
                setFormData();
                $("#searchForm").submit();
            })
        })
        function querySearch(){
            setFormData();
            $("#searchForm").submit();
        }
    </script>
    <style type="text/css">

    </style>

</head>
<body>
<ul class="nav nav-tabs">
    <li class="active"><a href="${ctx}/sys/role/">角色列表</a></li>
    <shiro:hasPermission name="sys:role:edit">
        <li><a href="${ctx}/sys/role/form">角色添加</a></li>
    </shiro:hasPermission>
</ul>
<sys:message content="${message}"/>
<form id="searchForm" class="form-search " action="${ctx}/sys/role/list" method="post">
    <input type="hidden" id="roleName" name="query.roleName" value="${roleName}" >
    <input type="hidden" id="engName" name="query.engName" value="${engName}" >
    <input type="hidden" id="officeId" name="query.officeId" value="${officeId}" >
    <input type="hidden" id="officeName" name="query.officeName" value="${officeName}" >
    <input type="hidden" id="dataScope" name="query.dataScope" value="${dataScope}" >
</form>

<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <tr>
        <th>角色名称</th>
        <th>英文名称</th>
        <th>归属机构</th>
        <th>数据范围</th>
        <shiro:hasPermission name="sys:role:edit">
            <th>操作</th>
        </shiro:hasPermission>
    </tr>

    <tr >
        <td><input id="queryRoleName" class="input-medium"  placeholder="输入完成后请按回车键查询" value="${roleName}"></td>
        <td><input id="queryEngName" class="input-medium"  placeholder="输入完成后请按回车键查询" value="${engName}"></td>
        <td>
            <sys:treeselect id="queryOffice" name="queryOfficeId" value="${officeId}" labelName="queryOfficeName"
                            labelValue="${officeName}"
                            title="机构" url="/sys/office/treeData" cssClass="required" callBack="querySearch()"/>
        </td>
        <td>
            <select id="queryDataScope" class="input-medium select2-offscreen" tabindex="-1">
                <option value="" <c:if test="${empty dataScope} ">selected="selected"</c:if> >请选择</option>
                <c:forEach items="${fns:getDictList('sys_data_scope')}" var="dict">
                    <option value="${dict.value}" <c:if test="${not empty dataScope && dataScope eq dict.value}">selected="selected"</c:if>>${dict.label}</option>
                </c:forEach>
                <%--<option value="-1" <c:if test="${dataScope==null} || ${dataScope=='-1'} ">selected="selected"</c:if> >请选择</option>--%>
                <%--<option value="1" <c:if test="${dataScope!=null} || ${dataScope=='1'} ">selected="selected"</c:if>>所有数据</option>--%>
                <%--<option value="2" <c:if test="${dataScope!=null} || ${dataScope=='2'} ">selected="selected"</c:if>>所在公司及以下数据</option>--%>
                <%--<option value="3" <c:if test="${dataScope!=null} || ${dataScope=='3'} ">selected="selected"</c:if>>所在公司数据</option>--%>
                <%--<option value="4" <c:if test="${dataScope!=null} || ${dataScope=='4'} ">selected="selected"</c:if>>所在部门及以下数据</option>--%>
                <%--<option value="5" <c:if test="${dataScope!=null} || ${dataScope=='5'} ">selected="selected"</c:if>>所在部门数据</option>--%>
                <%--<option value="8" <c:if test="${dataScope!=null} || ${dataScope=='8'} ">selected="selected"</c:if>>仅本人数据</option>--%>
                <%--<option value="9" <c:if test="${dataScope!=null} || ${dataScope=='9'} ">selected="selected"</c:if>>按明细设置</option>--%>
            </select>
        </td>
        <td></td>
    </tr>

    <c:forEach items="${list}" var="role">
        <tr>
            <td><a href="form?id=${role.id}">${role.name}</a></td>
            <td><a href="form?id=${role.id}">${role.enname}</a></td>
            <td>${role.office.name}</td>
            <td>${fns:getDictLabel(role.dataScope, 'sys_data_scope', '无')}</td>
            <shiro:hasPermission name="sys:role:edit">
                <td>
                    <a href="${ctx}/sys/role/assign?id=${role.id}">分配</a>
                    <c:if test="${(role.sysData eq fns:getDictValue('是', 'yes_no', '1') && fns:getUser().admin)||!(role.sysData eq fns:getDictValue('是', 'yes_no', '1'))}">
                        <a href="${ctx}/sys/role/form?id=${role.id}">修改</a>
                    </c:if>
                    <a href="${ctx}/sys/role/delete?id=${role.id}"
                       onclick="return confirmx('确认要删除该角色吗？', this.href)">删除</a>
                </td>
            </shiro:hasPermission>
        </tr>
    </c:forEach>
</table>
</body>
</html>