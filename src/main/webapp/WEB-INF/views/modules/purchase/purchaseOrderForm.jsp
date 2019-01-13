<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>采购订单管理</title>
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

            $("#empName").keyup(function () {
                var empName = $(this).val();
                var py = Mtils.utils.makePy(empName);
                $("#pinyin").val(py);
            })

            $("#birth").change(function () {
                alert("1");
                var birth = $(this).val();
                var age = Mtils.utils.calcAge(birth, new Date());
                $("#age").val(age);
            })
        });
    </script>
    <%@include file="/WEB-INF/views/modules/purchase/purchaseOrderJs.jsp" %>
</head>
<body>
<ul class="nav nav-tabs">
    <li><a href="${ctx}/purchase/purchaseOrder/">采购订单列表</a></li>
    <li class="active"><a href="${ctx}/purchase/purchaseOrder/form?id=${purchaseOrder.id}">采购订单<shiro:hasPermission
            name="purchase:purchaseOrder:edit">${not empty purchaseOrder.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission
            name="purchase:purchaseOrder:edit">查看</shiro:lacksPermission></a></li>
</ul>
<br/>
<form:form id="inputForm" modelAttribute="purchaseOrder" action="${ctx}/purchase/purchaseOrder/save" method="post"
           class="form-horizontal">
    <form:hidden path="id"/>
    <sys:message content="${message}"/>
    <ul class="nav nav-tabs" id="myTab">
        <li class="active"><a href="#baseInfo">订单基本信息</a></li>
        <li><a href="#goodsInfo">采购商品列表</a></li>
    </ul>

    <div class="tab-content">
        <div class="tab-pane active" id="baseInfo">
            <div class="control-group">
                <div class="div-a">
                    <label class="control-label">机构：</label>
                    <div class="controls">
                        <sys:treeselect id="office" name="office.id" value="${purchaseOrder.office.id}"
                                        labelName="office.name" labelValue="${purchaseOrder.office.name}"
                                        title="部门" url="/sys/office/treeData?type=2" cssClass="input-large "
                                        allowClear="true" notAllowSelectParent="true"/>
                    </div>
                </div>
                <div class="div-b">
                    <label class="control-label">单据编号：</label>
                    <div class="controls">
                        <form:input path="purchaseNumber" htmlEscape="false" maxlength="10" class="input-xlarge "/>
                    </div>
                </div>
            </div>
            <div class="control-group">
                <div class="div-a">
                    <label class="control-label">供应商：</label>
                    <div class="controls">
                        <form:select path="supplier" class="input-xlselect ">
                            <form:option value="" label=""/>
                            <form:options items="${purchaseOrder.suppliers}" itemLabel="name" itemValue="id"
                                          htmlEscape="false"/>
                        </form:select>
                    </div>
                </div>
                <div class="div-b">
                    <label class="control-label">采购员：</label>
                    <div class="controls">
                        <form:select path="hrmUser" class="input-xlselect ">
                            <form:option value="" label=""/>
                            <form:options items="${purchaseOrder.purchases}" itemLabel="empName" itemValue="id"
                                          htmlEscape="false"/>
                        </form:select>
                    </div>
                </div>
            </div>
            <div class="control-group">
                <div class="div-a">
                    <label class="control-label">订单日期：</label>
                    <div class="controls">
                        <input name="orderTime" type="text" readonly="readonly" maxlength="20"
                               class="input-xlarge Wdate "
                               value="<fmt:formatDate value="${purchaseOrder.orderTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                               onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
                    </div>
                </div>
                <div class="div-b">
                    <label class="control-label">摘要：</label>
                    <div class="controls">
                        <form:input path="summary" htmlEscape="false" maxlength="500" class="input-xlarge "/>
                    </div>
                </div>
            </div>
            <div class="control-group">
                <div class="div-a">
                    <label class="control-label">对方业务员：</label>
                    <div class="controls">
                        <form:input path="salespersonId" htmlEscape="false" maxlength="64" class="input-xlarge "/>
                    </div>
                </div>
                <div class="div-b">
                    <label class="control-label">入库仓库：</label>
                    <div class="controls">
                        <form:input path="storehouse" htmlEscape="false" maxlength="3" class="input-xlarge "/>
                    </div>
                </div>
            </div>
            <div class="control-group">
                <div class="div-a">
                    <label class="control-label">业务组：</label>
                    <div class="controls">
                        <form:input path="bizGroup" htmlEscape="false" maxlength="32" class="input-xlarge "/>
                    </div>
                </div>
                <div class="div-b">
                    <label class="control-label">备注信息：</label>
                    <div class="controls">
                        <form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255"
                                       class="input-xlarge "/>
                    </div>
                </div>
            </div>
        </div>
        <div class="tab-pane" id="goodsInfo">
            <table class="table table-striped table-bordered table-hover" width="100%">
                <thead>
                <tr>
                    <th>药品编码</th>
                    <th>品名</th>
                    <th>规格</th>
                    <th>剂型</th>
                    <th>生产企业</th>
                    <th>单位</th>
                    <th>内装数</th>
                    <th>采购价格</th>
                    <th>采购数量</th>
                    <th>含税金额</th>
                    <th>不含税金额</th>
                    <th>税额</th>
                    <th>税率</th>
                    <th>当前库存</th>
                    <th>已到货数</th>
                    <shiro:hasPermission name="purchase:purchaseOrder:edit">
                        <th>操作</th>
                    </shiro:hasPermission>
                </tr>
                </thead>
                <tbody id="goods_contentField">
                <c:forEach items="${purchaseOrder.goodsList}" var="item" varStatus="i">
                    <tr id="goods_tr_${i.index}">
                        <td>
                            <input type="hidden" name="itemGoodsId" value="${i.index}"/>
                            <input type="hidden" name="goodsList[${i.index }].goodsId" value="${item.goodsId}"/>
                            <input type="text" class="table-form-control" name="goodsList[${i.index }].goodsCode"
                                   value="${item.goodsCode }" valid='vtext'/>
                        </td>
                        <td>
                            <input type="text" class="table-form-control" name="goodsList[${i.index }].goodsName"
                                   value="${item.goodsName }" valid='vtext'/>
                        </td>
                        <td>
                            <input type="text" class="table-form-control" name="goodsList[${i.index }].goodsSpec"
                                   value="${item.goodsSpec }" valid='vtext'/>
                        </td>
                        <td>
                            <input type="text" class="table-form-control" name="goodsList[${i.index }].goodsType"
                                   value="${item.goodsType }" valid='vtext'/>
                        </td>
                        <td>
                            <input type="text" class="table-form-control" name="goodsList[${i.index }].manufacturer"
                                   value="${item.manufacturer }" valid='vtext'/>
                        </td>
                        <td>
                            <input type="text" class="table-form-control" name="goodsList[${i.index }].unit"
                                   value="${item.unit }" valid='vtext'/>
                        </td>
                        <td>
                            <input type="text" class="table-form-control" name="goodsList[${i.index }].content"
                                   value="${item.content }" valid='vtext'/>
                        </td>
                        <td>
                            <input type="text" class="table-form-control" name="goodsList[${i.index }].retailPrice"
                                   value="${item.purchasePrice }" valid='vtext'/>
                        </td>
                        <td>
                            <input type="text" class="table-form-control" name="goodsList[${i.index }].number"
                                   value="${item.number }" valid='vtext'/>
                        </td>
                        <td>
                            <input type="text" class="table-form-control" name="goodsList[${i.index }].tax"
                                   value="${item.tax }" valid='vtext'/>
                        </td>
                        <td>
                            <input type="text" class="table-form-control" name="goodsList[${i.index }].tax"
                                   value="${item.taxFree }" valid='vtext'/>
                        </td>
                        <td>
                            <input type="text" class="table-form-control" name="goodsList[${i.index }].tax"
                                   value="${item.taxAmount }" valid='vtext'/>
                        </td>
                        <td>
                            <input type="text" class="table-form-control" name="goodsList[${i.index }].tax"
                                   value="${item.taxRate }" valid='vtext'/>
                        </td>
                        <td>
                            <input type="text" class="table-form-control" name="goodsList[${i.index }].stock"
                                   value="${item.stock }" valid='vtext'/>
                        </td>
                        <td>
                            <input type="text" class="table-form-control" name="goodsList[${i.index }].arrivalNum"
                                   value="${item.arrivalNum }" valid='vtext'/>
                        </td>
                        <shiro:hasPermission name="purchase:purchaseOrder:edit">
                            <td>
                                <a href="javascript:void(0)" class="btnDel"
                                   onclick="oper.edu.del('${i.index}','${item.id }');">删除</a>
                            </td>
                        </shiro:hasPermission>
                    </tr>
                </c:forEach>
                </tbody>
                <tfoot>
                <tr>
                    <td colspan="10"><a href="javascript:" onclick="oper.goods.viewGoods();" class="btn">新增</a></td>
                </tr>
                </tfoot>
            </table>
        </div>
    </div>
    <div class="form-actions">
        <shiro:hasPermission name="purchase:purchaseOrder:edit"><input id="btnSubmit" class="btn btn-primary"
                                                                       type="submit"
                                                                       value="保 存"/>&nbsp;</shiro:hasPermission>
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </div>
</form:form>
</body>
</html>