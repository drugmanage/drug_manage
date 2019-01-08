<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>采购补差价单管理</title>
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
</head>
<body>
<ul class="nav nav-tabs">
    <li><a href="${ctx}/purchase/purchaseBackDiffPrice/">采购补差价单列表</a></li>
    <li class="active"><a
            href="${ctx}/purchase/purchaseBackDiffPrice/form?id=${purchaseBackDiffPrice.id}">采购补差价单<shiro:hasPermission
            name="purchase:purchaseBackDiffPrice:edit">${not empty purchaseBackDiffPrice.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission
            name="purchase:purchaseBackDiffPrice:edit">查看</shiro:lacksPermission></a></li>
</ul>
<br/>
<form:form id="inputForm" modelAttribute="purchaseBackDiffPrice" action="${ctx}/purchase/purchaseBackDiffPrice/save"
           method="post" class="form-horizontal">
    <form:hidden path="id"/>
    <sys:message content="${message}"/>
    <ul class="nav nav-tabs" id="myTab">
        <li class="active"><a href="#baseInfo">基本信息</a></li>
        <li><a href="#goodsInfo">商品列表</a></li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane active" id="baseInfo">
            <div class="control-group">
                <div class="div-a">
                    <label class="control-label">机构id：</label>
                    <div class="controls">
                        <sys:treeselect id="office" name="office.id" value="${purchaseBackDiffPrice.office.id}"
                                        labelName="office.name" labelValue="${purchaseBackDiffPrice.office.name}"
                                        title="部门" url="/sys/office/treeData?type=2" cssClass="input-large "
                                        allowClear="true" notAllowSelectParent="true"/>
                    </div>
                </div>
                <div class="div-b">
                    <label class="control-label">采购id：</label>
                    <div class="controls">
                        <form:input path="purchaseId" htmlEscape="false" maxlength="64" class="input-xlarge "/>
                    </div>
                </div>
            </div>
            <div class="control-group">
                <div class="div-a">
                    <label class="control-label">商品id：</label>
                    <div class="controls">
                        <form:input path="goodsId" htmlEscape="false" maxlength="64" class="input-xlarge "/>
                    </div>
                </div>
                <div class="div-b">
                    <label class="control-label">单位退补差价：</label>
                    <div class="controls">
                        <form:input path="backPriceUnit" htmlEscape="false" class="input-xlarge "/>
                    </div>
                </div>
            </div>
            <div class="control-group">
                <div class="div-a">
                    <label class="control-label">退补差价总不含税金额：</label>
                    <div class="controls">
                        <form:input path="backPriceTaxFree" htmlEscape="false" class="input-xlarge "/>
                    </div>
                </div>
                <div class="div-b">
                    <label class="control-label">退补差价总税额：</label>
                    <div class="controls">
                        <form:input path="backPriceTotalTax" htmlEscape="false" class="input-xlarge "/>
                    </div>
                </div>
            </div>
            <div class="control-group">
                <div class="div-a">
                    <label class="control-label">退补差价总含税金额：</label>
                    <div class="controls">
                        <form:input path="backPriceTaxAmount" htmlEscape="false" class="input-xlarge "/>
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
                    <th>单价</th>
                    <th>采购数量</th>
                    <th>金额</th>
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
                                   value="${item.retailPrice }" valid='vtext'/>
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
                    <td colspan="10"><a href="javascript:" onclick="oper.goods.add();" class="btn">新增</a></td>
                </tr>
                </tfoot>
            </table>
        </div>
    </div>
    <div class="form-actions">
        <shiro:hasPermission name="purchase:purchaseBackDiffPrice:edit"><input id="btnSubmit" class="btn btn-primary"
                                                                               type="submit"
                                                                               value="保 存"/>&nbsp;</shiro:hasPermission>
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </div>
</form:form>
</body>
</html>