<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>商品资料管理</title>
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


            $("#goodsName").keyup(function () {
                var empName = $(this).val();
                var py = Mtils.utils.makePy(empName, true);
                $("#logogram").val(py);
            });

            $("#commonNameOne").keyup(function () {
                var empName = $(this).val();
                var py = Mtils.utils.makePy(empName, true);
                $("#commonLogogramOne").val(py);
            });
            $("#commonNameTwo").keyup(function () {
                var empName = $(this).val();
                var py = Mtils.utils.makePy(empName, true);
                $("#commonLogogramTwo").val(py);
            });
        });
    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li><a href="${ctx}/goods/goods/">商品资料列表</a></li>
    <li class="active"><a href="${ctx}/goods/goods/form?id=${goods.id}">商品资料<shiro:hasPermission
            name="goods:goods:edit">${not empty goods.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission
            name="goods:goods:edit">查看</shiro:lacksPermission></a></li>
</ul>
<br/>
<form:form id="inputForm" modelAttribute="goods" action="${ctx}/goods/goods/save" method="post" class="form-horizontal">
    <form:hidden path="id"/>
    <sys:message content="${message}"/>
    <ul class="nav nav-tabs" id="myTab">
        <li class="active"><a href="#baseInfo">基本信息</a></li>
        <li><a href="#goodsImage">商品图片</a></li>
        <li><a href="#goodsCodeImage">商品编码</a></li>
        <li><a href="#goodsRegulatoryImage">商品电子监管码</a></li>
    </ul>

    <div class="tab-content">
        <div class="tab-pane active" id="baseInfo">
            <div class="control-group">
                <div class="div-a">
                    <label class="control-label">商品所属机构：</label>
                    <div class="controls">
                        <sys:treeselect id="office" name="office.id" value="${goods.office.id}" labelName="office.name"
                                        labelValue="${goods.office.name}"
                                        title="部门" url="/sys/office/treeData?type=2" cssClass="input-large "
                                        allowClear="true" notAllowSelectParent="true"/>
                    </div>
                </div>
                <div class="div-b">
                    <label class="control-label">商品分类：</label>
                    <div class="controls">
                        <form:select path="goodsCategory" class="input-xlselect ">
                            <form:option value="" label=""/>
                            <form:options items="${fns:getDictList('goods_category')}" itemLabel="label"
                                          itemValue="value" htmlEscape="false"/>
                        </form:select>
                    </div>
                </div>
            </div>
            <div class="control-group">
                <div class="div-a">
                    <label class="control-label">档案号：</label>
                    <div class="controls">
                        <form:input path="fileNumber" htmlEscape="false" maxlength="20" class="input-xlarge "/>
                    </div>
                </div>
                <div class="div-b">
                    <label class="control-label">商品编码：</label>
                    <div class="controls">
                        <form:input path="goodsCode" htmlEscape="false" maxlength="32" class="input-xlarge "/>
                    </div>
                </div>
            </div>
            <div class="control-group">
                <div class="div-a">
                    <label class="control-label">商品名：</label>
                    <div class="controls">
                        <form:input path="goodsName" htmlEscape="false" maxlength="64" class="input-xlarge "/>
                    </div>
                </div>
                <div class="div-b">
                    <label class="control-label">拼音简码：</label>
                    <div class="controls">
                        <form:input path="logogram" htmlEscape="false" maxlength="128" class="input-xlarge "/>
                    </div>
                </div>
            </div>
            <div class="control-group">
                <div class="div-a">
                    <label class="control-label">商品剂型：</label>
                    <div class="controls">
                        <form:select path="goodsType" class="input-xlselect ">
                            <form:option value="" label=""/>
                            <form:options items="${fns:getDictList('goods_type')}" itemLabel="label" itemValue="value"
                                          htmlEscape="false"/>
                        </form:select>
                    </div>
                </div>
                <div class="div-b">
                    <label class="control-label">商品税控编码：</label>
                    <div class="controls">
                        <form:input path="taxControlCode" htmlEscape="false" maxlength="64" class="input-xlarge "/>
                    </div>
                </div>
            </div>
            <div class="control-group">
                <div class="div-a">
                    <label class="control-label">俗名一：</label>
                    <div class="controls">
                        <form:input path="commonNameOne" htmlEscape="false" maxlength="64" class="input-xlarge "/>
                    </div>
                </div>
                <div class="div-b">
                    <label class="control-label">俗名一拼音简码：</label>
                    <div class="controls">
                        <form:input path="commonLogogramOne" htmlEscape="false" maxlength="32" class="input-xlarge "/>
                    </div>
                </div>
            </div>
            <div class="control-group">
                <div class="div-a">
                    <label class="control-label">俗名二：</label>
                    <div class="controls">
                        <form:input path="commonNameTwo" htmlEscape="false" maxlength="64" class="input-xlarge "/>
                    </div>
                </div>
                <div class="div-b">
                    <label class="control-label">俗名二拼音简码：</label>
                    <div class="controls">
                        <form:input path="commonLogogramTwo" htmlEscape="false" maxlength="32" class="input-xlarge "/>
                    </div>
                </div>
            </div>
            <div class="control-group">
                <div class="div-a">
                    <label class="control-label">基本包装单位：</label>
                    <div class="controls">
                        <form:select path="unit" class="input-xlselect ">
                            <form:option value="" label=""/>
                            <form:options items="${fns:getDictList('unit')}" itemLabel="label" itemValue="value"
                                          htmlEscape="false"/>
                        </form:select>
                    </div>
                </div>
                <div class="div-b">
                    <label class="control-label">装量：</label>
                    <div class="controls">
                        <form:textarea path="content" htmlEscape="false" rows="4" maxlength="10" class="input-xlarge "/>
                    </div>
                </div>
            </div>
            <div class="control-group">
                <div class="div-a">
                    <label class="control-label">规格：</label>
                    <div class="controls">
                        <form:input path="goodsSpec" htmlEscape="false" maxlength="128" class="input-xlarge "/>
                    </div>
                </div>
                <div class="div-b">
                    <label class="control-label">商品描述：</label>
                    <div class="controls">
                        <form:input path="goodsDesc" htmlEscape="false" maxlength="500" class="input-xlarge "/>
                    </div>
                </div>
            </div>
            <div class="control-group">
                <div class="div-a">
                    <label class="control-label">进项税率：</label>
                    <div class="controls">
                        <form:input path="entryTaxRate" htmlEscape="false" class="input-xlarge "/>
                    </div>
                </div>
                <div class="div-b">
                    <label class="control-label">销项税率：</label>
                    <div class="controls">
                        <form:input path="salesRate" htmlEscape="false" class="input-xlarge "/>
                    </div>
                </div>
            </div>
            <div class="control-group">
                <div class="div-a">
                    <label class="control-label">批准文号：</label>
                    <div class="controls">
                        <form:input path="approvalNumber" htmlEscape="false" maxlength="128" class="input-xlarge "/>
                    </div>
                </div>
                <div class="div-b">
                    <label class="control-label">批文批准日期：</label>
                    <div class="controls">
                        <input name="approvalNumberDate" type="text" readonly="readonly" maxlength="20"
                               class="input-xlarge Wdate "
                               value="<fmt:formatDate value="${goods.approvalNumberDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                               onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
                    </div>
                </div>
            </div>
            <div class="control-group">
                <div class="div-a">
                    <label class="control-label">批文有效期：</label>
                    <div class="controls">
                        <form:input path="approvalValidity" htmlEscape="false" maxlength="11" class="input-xlarge "/>
                    </div>
                </div>
                <div class="div-b">
                    <label class="control-label">生产厂家：</label>
                    <div class="controls">
                        <form:input path="manufacturer" htmlEscape="false" maxlength="128" class="input-xlarge "/>
                    </div>
                </div>
            </div>
            <div class="control-group">
                <div class="div-a">
                    <label class="control-label">存储条件：</label>
                    <div class="controls">
                        <form:select path="storageConditions" class="input-xlselect ">
                            <form:option value="" label=""/>
                            <form:options items="${fns:getDictList('storage_conditions')}" itemLabel="label"
                                          itemValue="value" htmlEscape="false"/>
                        </form:select>
                    </div>
                </div>
                <div class="div-b">
                    <label class="control-label">批件号：</label>
                    <div class="controls">
                        <form:input path="certificateNo" htmlEscape="false" maxlength="128" class="input-xlarge "/>
                    </div>
                </div>
            </div>
            <div class="control-group">
                <div class="div-a">
                    <label class="control-label">养护周期：</label>
                    <div class="controls">
                        <form:input path="maintenanceCycle" htmlEscape="false" maxlength="20" class="input-xlarge "/>
                    </div>
                </div>
                <div class="div-b">
                    <label class="control-label">养护类别：</label>
                    <div class="controls">
                        <form:select path="maintenanceType" class="input-xlselect ">
                            <form:option value="" label=""/>
                            <form:options items="${fns:getDictList('maintenance_type')}" itemLabel="label"
                                          itemValue="value" htmlEscape="false"/>
                        </form:select>
                    </div>
                </div>
            </div>
            <div class="control-group">
                <div class="div-a">
                    <label class="control-label">质量标准：</label>
                    <div class="controls">
                        <form:input path="qualityStandard" htmlEscape="false" maxlength="128" class="input-xlarge "/>
                    </div>
                </div>
                <div class="div-b">
                    <label class="control-label">核心属性：</label>
                    <div class="controls">
                        <form:select path="coreType" class="input-xlselect ">
                            <form:option value="" label=""/>
                            <form:options items="${fns:getDictList('core_type')}" itemLabel="label" itemValue="value"
                                          htmlEscape="false"/>
                        </form:select>
                    </div>
                </div>
            </div>
            <div class="control-group">
                <div class="div-a">
                    <label class="control-label">零售属性：</label>
                    <div class="controls">
                        <form:input path="retailType" htmlEscape="false" maxlength="2" class="input-xlarge "/>
                    </div>
                </div>
                <div class="div-b">
                    <label class="control-label">零售属性数量：</label>
                    <div class="controls">
                        <form:input path="retailNum" htmlEscape="false" maxlength="11" class="input-xlarge "/>
                    </div>
                </div>
            </div>
            <div class="control-group">
                <div class="div-a">
                    <label class="control-label">有效期：</label>
                    <div class="controls">
                        <form:input path="validity" htmlEscape="false" maxlength="11" class="input-xlarge "/>
                    </div>
                </div>
                <div class="div-b">
                    <label class="control-label">有效期单位：</label>
                    <div class="controls">
                        <form:select path="validUnit" class="input-xlselect ">
                            <form:option value="" label=""/>
                            <form:options items="${fns:getDictList('valid_unit')}" itemLabel="label" itemValue="value"
                                          htmlEscape="false"/>
                        </form:select>
                    </div>
                </div>
            </div>
            <div class="control-group">
                <div class="div-a">
                    <label class="control-label">默认仓库id：</label>
                    <div class="controls">
                        <form:input path="defaultRepoId" htmlEscape="false" maxlength="64" class="input-xlarge "/>
                    </div>
                </div>
                <div class="div-b">
                    <label class="control-label">默认货位id：</label>
                    <div class="controls">
                        <form:input path="defaultPositionId" htmlEscape="false" maxlength="64" class="input-xlarge "/>
                    </div>
                </div>
            </div>
            <div class="control-group">
                <div class="div-a">
                    <label class="control-label">零售价：</label>
                    <div class="controls">
                        <form:input path="retailPrice" htmlEscape="false" class="input-xlarge "/>
                    </div>
                </div>
                <div class="div-b">
                    <label class="control-label">含税零售价：</label>
                    <div class="controls">
                        <form:input path="taxRetailPrice" htmlEscape="false" class="input-xlarge "/>
                    </div>
                </div>
            </div>
            <div class="control-group">
                <div class="div-a">
                    <label class="control-label">商品条形码编码：</label>
                    <div class="controls">
                        <form:input path="barCode" htmlEscape="false" maxlength="64" class="input-xlarge "/>
                    </div>
                </div>
                <div class="div-b">
                    <label class="control-label">商品电子监管码：</label>
                    <div class="controls">
                        <form:input path="supervisionCode" htmlEscape="false" maxlength="128" class="input-xlarge "/>
                    </div>
                </div>
            </div>
            <div class="control-group">
                <div class="div-a">
                    <label class="control-label">是否停止采购：</label>
                    <div class="controls">
                        <form:radiobuttons path="purchaseFlag" items="${fns:getDictList('yes_no')}" itemLabel="label"
                                           itemValue="value" htmlEscape="false" class=""/>
                    </div>
                </div>
                <div class="div-b">
                    <label class="control-label">是否停止销售：</label>
                    <div class="controls">
                        <form:radiobuttons path="saleFlag" items="${fns:getDictList('yes_no')}" itemLabel="label"
                                           itemValue="value" htmlEscape="false" class=""/>
                    </div>
                </div>
            </div>
        </div>
        <div class="tab-pane " id="goodsImage">
            <div class="control-group">
                <label class="control-label">商品图片</label>
                <div class="controls">
                    <form:hidden id="nameGoodsImage" path="pathGoodsImage" htmlEscape="false" maxlength="255" class="input-xlarge"/>
                    <sys:ckfinder input="nameGoodsImage" type="images" uploadPath="/goods/baseImg" selectMultiple="true"/>
                </div>
            </div>
        </div>
        <div class="tab-pane " id="goodsCodeImage">
            <div class="control-group">
                <label class="control-label">商品编码图片</label>
                <div class="controls">
                    <form:hidden id="nameGoodsCodeImage" path="pathGoodsCodeImage" htmlEscape="false" maxlength="255" class="input-xlarge"/>
                    <sys:ckfinder input="nameGoodsCodeImage" type="images" uploadPath="/goods/codeImg" selectMultiple="true"/>
                </div>
            </div>
        </div>
        <div class="tab-pane " id="goodsRegulatoryImage">
            <div class="control-group">
                <label class="control-label">商品电子监管码图片</label>
                <div class="controls">
                    <form:hidden id="nameGoodsRegulatoryImage" path="pathGoodsRegulatoryImage" htmlEscape="false" maxlength="255" class="input-xlarge"/>
                    <sys:ckfinder input="nameGoodsRegulatoryImage" type="images" uploadPath="/goods/regulatoryImg" selectMultiple="true"/>
                </div>
            </div>
        </div>
    </div>

    <div class="form-actions">
        <shiro:hasPermission name="goods:goods:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </div>
</form:form>
</body>
</html>