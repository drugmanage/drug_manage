<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>采购退回开票单管理</title>
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

        // 添加退回单商品
        function addPurchaseGoods() {
            let width = $("#mainFrame", top.window.document).width();
            let height = $("#mainFrame", top.window.document).height() - 80;
            top.$.jBox.open("iframe:${ctx}/purchase/purchaseBackTicket/toPurchaseGoodsList", "采购订单商品筛选", width, height, {
                buttons: {"确定": "ok", "关闭": true}, submit: function (v, h, f) {
                    if (v == "ok") {
                    }
                }, loaded: function (h) {
                    $(".jbox-content", top.document).css("overflow-y", "hidden");
                }
            });
        }

    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li><a href="${ctx}/purchase/purchaseBackTicket/">采购退回开票单列表</a></li>
    <li class="active"><a
            href="${ctx}/purchase/purchaseBackTicket/form?id=${purchaseBackTicket.id}">采购退回开票单<shiro:hasPermission
            name="purchase:purchaseBackTicket:edit">${not empty purchaseBackTicket.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission
            name="purchase:purchaseBackTicket:edit">查看</shiro:lacksPermission></a></li>
</ul>
<br/>
<form:form id="inputForm" modelAttribute="purchaseBackTicket" action="${ctx}/purchase/purchaseBackTicket/save"
           method="post" class="form-horizontal">
    <form:hidden path="id"/>
    <sys:message content="${message}"/>
    <div class="tab-content">
        <div class="tab-pane active" id="baseInfo">
            <div class="control-group">
                <div class="div-a">
                    <label class="control-label">机构：</label>
                    <div class="controls">
                        <sys:treeselect id="office" name="office.id" value="${purchaseBackTicket.office.id}"
                                        labelName="office.name"
                                        labelValue="${purchaseBackTicket.office.name}"
                                        title="部门" url="/sys/office/treeData?type=2" cssClass="input-large "
                                        allowClear="true"
                                        notAllowSelectParent="true"/>
                    </div>
                </div>
                <div class="div-b">
                    <label class="control-label">采购订单：</label>
                    <div class="controls">
                        <form:input path="purchaseId" htmlEscape="false" maxlength="64" class="input-xlarge "/>
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
                        <td colspan="10"><a href="javascript:" onclick="addPurchaseGoods();" class="btn">新增</a></td>
                    </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </div>
    <div class="form-actions">
        <shiro:hasPermission name="purchase:purchaseBackTicket:edit"><input id="btnSubmit" class="btn btn-primary"
                                                                            type="submit"
                                                                            value="保 存"/>&nbsp;</shiro:hasPermission>
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </div>
</form:form>
</body>
</html>