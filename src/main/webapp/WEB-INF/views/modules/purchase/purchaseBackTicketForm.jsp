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
            // 获取采购订单的id
            var purchaseId = document.getElementById("purchaseOrder").value;
            if (purchaseId != null && purchaseId != "") {
                let width = $("#mainFrame", top.window.document).width();
                let height = $("#mainFrame", top.window.document).height() - 80;
                top.$.jBox.open("iframe:${ctx}/purchase/purchaseBackTicket/toPurchaseGoodsList?purchaseId=" + purchaseId, "采购订单商品筛选", width, height, {
                    buttons: {"确定": "ok", "关闭": true}, submit: function (v, h, f) {
                        if (v == "ok") {
                            let goods = h.find("iframe")[0].contentWindow.goodsData;
                            if (goods != null) {
                                if ($("input[name='itemGoodsId']") && $("input[name='itemGoodsId']").length != 0) {
                                    let itemGoodsId = [];
                                    $("input[name='itemGoodsId']").each(function () {
                                        itemGoodsId.push(parseInt($(this).val()));
                                    });
                                    if (itemGoodsId.length != 0) {
                                        let maxId = Math.max.apply(null, itemGoodsId);
                                        if (maxId != undefined) {
                                            let newMaxId = maxId + 1;
                                            let html = window.appendHtml(newMaxId, goods);
                                            $("#" + "goods_" + "tr_" + maxId).after(html);
                                        }
                                    }
                                } else {
                                    let newMaxId = 0;
                                    let html = window.appendHtml(newMaxId, goods);
                                    $("#" + "goods_" + "contentField").html(html);
                                }
                            }
                        }
                    }, loaded: function (h) {
                        $(".jbox-content", top.document).css("overflow-y", "hidden");
                    }
                });
            } else {
                // 提示输入订单号
                alertx("请输入采购订单号！");
            }
        }

        // 拼接退回开票单商品列表
        function appendHtml(newMaxId, goods) {
            var trStr = '<tr id="goods_tr_' + newMaxId + '">'
                + '<td>'
                + '<input type="hidden" name="itemGoodsId" value="' + newMaxId + '"/>'
                + '<input type="hidden" name="purchaseBackTicketVoList[' + newMaxId + '].purchaseGoodsId" value="' + goods.id + '"/>'
                + '<input type="text" name="purchaseBackTicketVoList[' + newMaxId + '].goodsCode" value="' + goods.goodsCode + '" readonly="readonly"/>'
                + '</td>'
                + '<td>'
                + '<input type="text" name="purchaseBackTicketVoList[' + newMaxId + '].goodsName" value="' + goods.goodsName + '" readonly="readonly"/>'
                + '</td>'
                + '<td>'
                + '<input type="text" name="purchaseBackTicketVoList[' + newMaxId + '].goodsSpec" value="' + goods.goodsSpec + '" readonly="readonly"/>'
                + '</td>'
                + '<td>'
                + '<input type="text" name="purchaseBackTicketVoList[' + newMaxId + '].goodsType" value="' + goods.goodsType + '" readonly="readonly"/>'
                + '</td>'
                + '<td>'
                + '<input type="text" name="purchaseBackTicketVoList[' + newMaxId + '].manufacturer" value="' + goods.manufacturer + '" readonly="readonly"/>'
                + '</td>'
                + '<td>'
                + '<input type="text" name="purchaseBackTicketVoList[' + newMaxId + '].unit" value="' + goods.unit + '" readonly="readonly"/>'
                + '</td>'
                + '<td>'
                + '<input type="text" name="purchaseBackTicketVoList[' + newMaxId + '].content" value="' + goods.content + '" readonly="readonly"/>'
                + '</td>'
                + '<td>'
                + '<input type="text" name="purchaseBackTicketVoList[' + newMaxId + '].stock" value="' + goods.stock + '" readonly="readonly"/>'
                + '</td>'
                + '<td>'
                + '<input type="text" name="purchaseBackTicketVoList[' + newMaxId + '].backPriceTaxFree" value="" readonly="readonly"/>'
                + '</td>'
                + '<td>'
                + '<input type="text" name="purchaseBackTicketVoList[' + newMaxId + '].backPriceTotalTax" value="" readonly="readonly"/>'
                + '</td>'
                + '<td>'
                + '<input type="text" name="purchaseBackTicketVoList[' + newMaxId + '].backPriceTaxAmount" value="" readonly="readonly"/>'
                + '</td>'
                + '<td>'
                + '<input type="text" name="purchaseBackTicketVoList[' + newMaxId + '].unitBackNumber" value="" />'
                + '</td>'
                + '<td>'
                + '<input type="text" name="purchaseBackTicketVoList[' + newMaxId + '].returnReason" value="" />'
                + '</td>'
                + '<td>'
                + '<a href="javascript:void(0)" class="btnDel" onclick="del(' + newMaxId + ');">删除</a>'
                + '</td>'
                + '</tr>';
            var html = trStr;
            return html;
        }

        // 删除
        function del(itemGoodsId, entityId) {
            if (entityId) {
                var url = "${ctx}/purchase/purchaseGoods/delete";
                tips = "确定删除订单商品信息？";
                top.$.jBox.confirm(tips, "清除确认", function (v) {
                    if (v == "ok") {
                        $.ajax({
                            url: url,
                            data: {id: entityId},
                            type: 'post',
                            dataType: 'json',
                            async: false,
                            success: function (data) {
                                if (data.code == 200) {
                                    alertx(data.msg);
                                    $("#" + oper.goods.socpName + "tr_" + itemGoodsId).remove();
                                }
                            }
                        })
                    }
                });
            } else {
                $("#" + this.socpName + "tr_" + itemGoodsId).remove();
            }
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
                        <form:select path="purchaseOrder" class="input-xlselect ">
                            <form:option value="" label=""/>
                            <form:options items="${purchaseBackTicket.purchaseOrderList}" itemLabel="purchaseNumber"
                                          itemValue="id"
                                          htmlEscape="false"/>
                        </form:select>
                    </div>
                </div>
            </div>
            <div class="control-group">
                <div class="div-a">
                    <label class="control-label">单据编号：</label>
                    <div class="controls">
                        <form:input path="backTicketNumber" htmlEscape="false" maxlength="16" class="input-xlarge "/>
                    </div>
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
                <th>当前库存</th>
                <th>不含税金额</th>
                <th>税额</th>
                <th>含税金额</th>
                <th>退回数量</th>
                <th>退货原因</th>
                <shiro:hasPermission name="purchase:purchaseOrder:edit">
                    <th>操作</th>
                </shiro:hasPermission>
            </tr>
            </thead>
            <tbody id="goods_contentField">
            <c:forEach items="${purchaseBackTicket.purchaseBackTicketVoList}" var="item" varStatus="i">
                <tr id="goods_tr_${i.index}">
                    <td>
                        <input type="hidden" name="itemGoodsId" value="${i.index}"/>
                        <input type="hidden" name="purchaseBackTicketVoList[${i.index }].purchaseGoodsId" value="${item.purchaseGoodsId}"/>
                        <input type="text" class="table-form-control" name="purchaseBackTicketVoList[${i.index }].goodsCode"
                               value="${item.goodsCode }" valid='vtext'/>
                    </td>
                    <td>
                        <input type="text" class="table-form-control" name="purchaseBackTicketVoList[${i.index }].goodsName"
                               value="${item.goodsName }" valid='vtext'/>
                    </td>
                    <td>
                        <input type="text" class="table-form-control" name="purchaseBackTicketVoList[${i.index }].goodsSpec"
                               value="${item.goodsSpec }" valid='vtext'/>
                    </td>
                    <td>
                        <input type="text" class="table-form-control" name="purchaseBackTicketVoList[${i.index }].goodsType"
                               value="${item.goodsType }" valid='vtext'/>
                    </td>
                    <td>
                        <input type="text" class="table-form-control" name="purchaseBackTicketVoList[${i.index }].manufacturer"
                               value="${item.manufacturer }" valid='vtext'/>
                    </td>
                    <td>
                        <input type="text" class="table-form-control" name="purchaseBackTicketVoList[${i.index }].unit"
                               value="${item.unit }" valid='vtext'/>
                    </td>
                    <td>
                        <input type="text" class="table-form-control" name="purchaseBackTicketVoList[${i.index }].content"
                               value="${item.content }" valid='vtext'/>
                    </td>
                    <td>
                        <input type="text" class="table-form-control" name="purchaseBackTicketVoList[${i.index }].stock"
                               value="${item.stock }" valid='vtext'/>
                    </td>
                    <td>
                        <input type="text" class="table-form-control" name="purchaseBackTicketVoList[${i.index }].backPriceTaxFree"
                               value="${item.backPriceTaxFree }" valid='vtext'/>
                    </td>
                    <td>
                        <input type="text" class="table-form-control" name="purchaseBackTicketVoList[${i.index }].backPriceTotalTax"
                               value="${item.backPriceTotalTax }" valid='vtext'/>
                    </td>
                    <td>
                        <input type="text" class="table-form-control" name="purchaseBackTicketVoList[${i.index }].backPriceTaxAmount"
                               value="${item.backPriceTaxAmount }" valid='vtext'/>
                    </td>
                    <td>
                        <input type="text" class="table-form-control" name="purchaseBackTicketVoList[${i.index }].unitBackNumber"
                               value="${item.unitBackNumber }" valid='vtext'/>
                    </td>
                    <td>
                        <input type="text" class="table-form-control" name="purchaseBackTicketVoList[${i.index }].returnReason"
                               value="${item.returnReason }" valid='vtext'/>
                    </td>
                    <shiro:hasPermission name="purchase:purchaseOrder:edit">
                        <td>
                            <a href="javascript:void(0)" class="btnDel"
                               onclick="del('${i.index}','${item.id }');">删除</a>
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
    <div class="form-actions">
        <shiro:hasPermission name="purchase:purchaseBackTicket:edit"><input id="btnSubmit" class="btn btn-primary"
                                                                            type="submit"
                                                                            value="保 存"/>&nbsp;</shiro:hasPermission>
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </div>
</form:form>
</body>
</html>