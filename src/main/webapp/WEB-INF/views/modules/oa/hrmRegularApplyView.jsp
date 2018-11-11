<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>转正申请管理</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {
            //$("#name").focus();
            $("#inputForm").validate({
                submitHandler: function (form) {
                    loading('正在提交，请稍等...');
                    form.submit();
                },
                errorContainer: "#messageBox",
                errorPlacement: function (error, element) {
                    $("#messageBox").text("输入有误，请先更正。");
                    if (element.is(":checkbox") || element.is(":radio") || element.parent().is(".input-append")) {
                        error.appendTo(element.parent().parent());
                    } else {
                        error.insertAfter(element);
                    }
                }
            });
        });
    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li><a href="${ctx}/oa/hrmRegularApply/">转正申请列表</a></li>
    <li class="active"><a href="${ctx}/oa/hrmRegularApply/form?id=${hrmRegularApply.id}">转正申请<shiro:hasPermission
            name="oa:hrmRegularApply:edit">${not empty hrmRegularApply.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission
            name="oa:hrmRegularApply:edit">查看</shiro:lacksPermission></a></li>
</ul>
<br/>
<form:form id="inputForm" modelAttribute="hrmRegularApply" action="${ctx}/oa/hrmRegularApply/save" method="post"
           class="form-horizontal">
    <form:hidden path="id"/>
    <form:hidden path="act.taskId"/>
    <form:hidden path="act.taskName"/>
    <form:hidden path="act.taskDefKey"/>
    <form:hidden path="act.procInsId"/>
    <form:hidden path="act.procDefId"/>
    <form:hidden id="flag" path="act.flag"/>
    <sys:message content="${message}"/>
    <div class="control-group">
        <label class="control-label">员工表ID：</label>
        <div class="controls">
            <sys:treeselect id="hrmUser" name="hrmUser.id" value="${hrmRegularApply.hrmUser.id}" labelName=""
                            labelValue="${hrmRegularApply.hrmUser.name}"
                            title="用户" url="/sys/office/treeData?type=3" cssClass="" allowClear="true"
                            notAllowSelectParent="true"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">申请时间：</label>
        <div class="controls">
            <input name="applyTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
                   value="<fmt:formatDate value="${hrmRegularApply.applyTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">预计转正时间：</label>
        <div class="controls">
            <input name="estimateTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
                   value="<fmt:formatDate value="${hrmRegularApply.estimateTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">预计转正岗位：</label>
        <div class="controls">
            <form:input path="estimatePost" htmlEscape="false" maxlength="32" readonly="true" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">转正理由：</label>
        <div class="controls">
            <form:input path="content" htmlEscape="false" maxlength="64" readonly="true" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">人事部主管意见：</label>
        <div class="controls">
            <form:input path="hrManageView" htmlEscape="false" readonly="true" maxlength="500" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">人事部部长意见：</label>
        <div class="controls">
            <form:input path="hrMinisterView" htmlEscape="false" readonly="true" maxlength="500" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">总经理意见：</label>
        <div class="controls">
            <form:input path="ceoView" htmlEscape="false" readonly="true" maxlength="500" class="input-xlarge "/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">备注信息：</label>
        <div class="controls">
            <form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
        </div>
    </div>
    <div class="form-actions">
        <shiro:hasPermission name="oa:hrmRegularApply:edit">
            <c:if test="${hrmRegularApply.act.taskDefKey eq 'apply_end'}">
                <input id="btnSubmit" class="btn btn-primary" type="submit" value="转 正" onclick="$('#flag').val('1')"/>&nbsp;
            </c:if>
        </shiro:hasPermission>
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </div>
    <act:histoicFlow procInsId="${hrmRegularApply.act.procInsId}"/>
</form:form>
</body>
</html>