<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>客户资料管理</title>
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
            //Tab页签
            $('#myTab a:first').tab('show');
            $('#myTab a').click(function (e) {
                e.preventDefault();
                $(this).tab('show');
            });
        });
    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li><a href="${ctx}/customer/customer/">客户资料列表</a></li>
    <li class="active"><a href="${ctx}/customer/customer/form?id=${customer.id}">客户资料<shiro:hasPermission
            name="customer:customer:edit">${not empty customer.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission
            name="customer:customer:edit">查看</shiro:lacksPermission></a></li>
</ul>
<br/>
<form:form id="inputForm" modelAttribute="customer" action="${ctx}/customer/customer/save" method="post"
           class="form-horizontal">
    <form:hidden path="id"/>
    <sys:message content="${message}"/>
    <ul class="nav nav-tabs" id="myTab">
        <li class="active"><a href="#baseInfo">基本信息</a></li>
        <li><a href="#addressInfo">收货地址</a></li>
        <li><a href="#bankInfo">银行卡信息</a></li>
        <li><a href="#invoiceInfo">开票信息</a></li>
        <li><a href="#consignerInfo">委托人</a></li>
        <li><a href="#documentInfo">证件模板</a></li>
    </ul>
    
    <div class="tab-content">
        <div class="tab-pane active" id="baseInfo">

            <div class="control-group">
                <div class="div-a">
                    <label class="control-label">所属机构：</label>
                    <div class="controls">
                        <input type="hidden" name="office.id"
                               value="<c:if test="${ not empty supplier.office && supplier.office.id!=''}" >${supplier.office.id}</c:if><c:if test="${empty supplier.office || supplier.office.id=='' }">${fns:getUser().getOffice().getId()}</c:if>">
                        <input type="text" name="office.name" class="input-xlarge" readonly="readonly"
                               value="<c:if test="${ not empty supplier.office && supplier.office.name!=''}" >${supplier.office.name}</c:if><c:if test="${empty supplier.office || supplier.office.name=='' }">${fns:getUser().getOffice().getName()}</c:if>">
                    </div>
                </div>
                <div class="div-b">
                    <label class="control-label">客户档案号：</label>
                    <div class="controls">
                        <form:input path="customerNumber" readonly="true" htmlEscape="false" maxlength="32"
                                    class="input-xlarge "/>
                    </div>
                </div>
            </div>
            <div class="control-group">
                <div class="div-a">
                    <label class="control-label">姓名：</label>
                    <div class="controls">
                        <form:input path="name" htmlEscape="false" maxlength="32" class="input-xlarge required"/>
                        <span class="help-inline"><font color="red">*</font> </span>
                    </div>
                </div>
                <div class="div-b">
                    <label class="control-label">助记码：</label>
                    <div class="controls">
                        <form:input path="pinyin" htmlEscape="false" maxlength="64" class="input-xlarge "/>
                    </div>
                </div>
            </div>
            <div class="control-group">
                <div class="div-a">
                    <label class="control-label">法人代表：</label>
                    <div class="controls">
                        <form:input path="legalRepresentative" htmlEscape="false" maxlength="32" class="input-xlarge "/>
                    </div>
                </div>
                <div class="div-b">
                    <label class="control-label">企业地址：</label>
                    <div class="controls">
                        <form:input path="enterpriseAddress" htmlEscape="false" maxlength="255" class="input-xlarge "/>
                    </div>
                </div>
            </div>
            <div class="control-group">
                <div class="div-a">
                    <label class="control-label">企业负责人：</label>
                    <div class="controls">
                        <form:input path="enterpriseManage" htmlEscape="false" maxlength="32" class="input-xlarge "/>
                    </div>
                </div>
                <div class="div-b">
                    <label class="control-label">社会统一信用代码：</label>
                    <div class="controls">
                        <form:input path="creditCode" htmlEscape="false" maxlength="32" class="input-xlarge "/>
                    </div>
                </div>
            </div>
            <div class="control-group">
                <div class="div-a">
                    <label class="control-label">客户类别：</label>
                    <div class="controls">
                        <form:select path="customerType" class="input-xlselect ">
                            <form:option value="" label=""/>
                            <form:options items="${fns:getDictList('client_type')}" itemLabel="label"
                                          itemValue="value"
                                          htmlEscape="false"/>
                        </form:select>
                    </div>
                </div>
                <div class="div-b">
                    <label class="control-label">传真：</label>
                    <div class="controls">
                        <form:input path="fax" htmlEscape="false" maxlength="20" class="input-xlarge "/>
                    </div>
                </div>
            </div>
            <div class="control-group">
                <div class="div-a">
                    <label class="control-label">邮编：</label>
                    <div class="controls">
                        <form:input path="zipcode" htmlEscape="false" maxlength="10" class="input-xlarge "/>
                    </div>
                </div>
                <div class="div-b">
                    <label class="control-label">纳税类别：</label>
                    <div class="controls">
                        <form:select path="taxableCategory" class="input-xlselect ">
                            <form:option value="" label=""/>
                            <form:options items="${fns:getDictList('taxable_category')}" itemLabel="label"
                                          itemValue="value"
                                          htmlEscape="false"/>
                        </form:select>
                    </div>
                </div>
            </div>
            <div class="control-group">
                <div class="div-a">
                    <label class="control-label">送货上门：</label>
                    <div class="controls">
                        <form:input path="provideHome" htmlEscape="false" maxlength="64" class="input-xlarge "/>
                    </div>
                </div>
                <div class="div-b">
                    <label class="control-label">经营范围：</label>
                    <div class="controls">
                        <form:select path="bizScope" class="input-xlselect ">
                            <form:option value="" label=""/>
                            <form:options items="${fns:getDictList('biz_scope')}" itemLabel="label" itemValue="value"
                                          htmlEscape="false"/>
                        </form:select>
                    </div>
                </div>
            </div>
            <div class="control-group">
                <div class="div-a">
                    <label class="control-label">是否停用：</label>
                    <div class="controls">
                        <form:radiobuttons path="stopFlag" items="${fns:getDictList('stop_flag')}" itemLabel="label"
                                           itemValue="value" htmlEscape="false" class=""/>
                    </div>
                </div>
                <div class="div-b">
                    <label class="control-label">停用原因：</label>
                    <div class="controls">
                        <form:input path="stopReason" htmlEscape="false" maxlength="255" class="input-xlarge "/>
                    </div>
                </div>
            </div>
            <div class="control-group">
                <div class="div-a">
                    <label class="control-label">停用人：</label>
                    <div class="controls">
                        <sys:treeselect id="stopUser" name="stopUser.id" value="${customer.stopUser.id}" labelName=""
                                        labelValue="${customer.stopUser.name}"
                                        title="用户" url="/sys/office/treeData?type=3" cssClass="input-large "
                                        allowClear="true"
                                        notAllowSelectParent="true"/>
                    </div>
                </div>
                <div class="div-b">
                    <label class="control-label">停用时间：</label>
                    <div class="controls">
                        <input name="stopTime" type="text" readonly="readonly" maxlength="20"
                               class="input-xlarge Wdate "
                               value="<fmt:formatDate value="${customer.stopTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                               onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
                    </div>
                </div>
            </div>
            <div class="control-group">
                <div class="div-a">
                    <label class="control-label">配送路线：</label>
                    <div class="controls">
                        <form:input path="distributionRoute" htmlEscape="false" maxlength="255" class="input-xlarge "/>
                    </div>
                </div>
                <div class="div-b">
                    <label class="control-label">线路内部序号：</label>
                    <div class="controls">
                        <form:input path="internalSerialNumber" htmlEscape="false" maxlength="255"
                                    class="input-xlarge "/>
                    </div>
                </div>
            </div>
            <div class="control-group">
            <div class="div-a">
                <label class="control-label">是否为单位账客户：</label>
                <div class="controls">
                    <form:radiobuttons path="unitFlag" items="${fns:getDictList('unit_flag')}" itemLabel="label"
                                       itemValue="value" htmlEscape="false" class=""/>
                </div>
            </div>
            <div class="div-b">
                <label class="control-label">是否为结算对象：</label>
                <div class="controls">
                    <form:radiobuttons path="settlementFlag" items="${fns:getDictList('settlement_flag')}"
                                       itemLabel="label"
                                       itemValue="value" htmlEscape="false" class=""/>
                </div>
            </div>
        </div>
            <div class="control-group">
                <div class="div-a">
                    <label class="control-label">备注信息：</label>
                    <div class="controls">
                        <form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255"
                                       class="input-xlarge "/>
                    </div>
                </div>
            </div>
            <div id="addressTableDiv" style="display:none;">
                <%@include file="customerJs.jsp" %>
            </div>
        </div>

        <div class="tab-pane" id="addressInfo">
            <%@include file="/WEB-INF/views/modules/customer/customerAddressForm.jsp" %>
        </div>

        <div class="tab-pane" id="bankInfo">
            <%@include file="/WEB-INF/views/modules/customer/customerBankForm.jsp" %>
        </div>
        <div class="tab-pane" id="invoiceInfo">
            <%@include file="/WEB-INF/views/modules/customer/customerInvoiceInfoForm.jsp" %>
        </div>

        <div class="tab-pane" id="consignerInfo">
            <%@include file="/WEB-INF/views/modules/customer/customerConsignerForm.jsp" %>
        </div>

        <div class="tab-pane" id="documentInfo">
            <%@include file="/WEB-INF/views/modules/customer/customerDocumentTemplateForm.jsp" %>
        </div>

    </div>

    <div class="form-actions">
        <shiro:hasPermission name="customer:customer:edit"><input id="btnSubmit" class="btn btn-primary" type="submit"
                                                                  value="保 存"/>&nbsp;</shiro:hasPermission>
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </div>
</form:form>
</body>
</html>