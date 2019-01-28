<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>销售退回开票单管理</title>
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
        function addSalesGoods() {
            // 获取销售订单的id
            var salesId = document.getElementById("salesOrderId").value;
            if (salesId != null && salesId != "") {
                let width = $("#mainFrame", top.window.document).width();
                let height = $("#mainFrame", top.window.document).height() - 80;
                top.$.jBox.open("iframe:${ctx}/sales/salesBackTicket/toSalesGoodsList?salesId=" + salesId, "销售订单商品筛选", width, height, {
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
                                            $("#" + "sales_" + "tr_" + maxId).after(html);
                                        }
                                    }
                                } else {
                                    let newMaxId = 0;
                                    let html = window.appendHtml(newMaxId, goods);
                                    $("#" + "sales_" + "contentField").html(html);
                                }
                            }
                        }
                    }, loaded: function (h) {
                        $(".jbox-content", top.document).css("overflow-y", "hidden");
                    }
                });
            } else {
                // 提示输入订单号
                alertx("请输入销售订单号！");
            }
        }

        // 拼接退回开票单商品列表
        function appendHtml(newMaxId, goods) {
            var trStr = '<tr id="sales_tr_' + newMaxId + '">'
                + '<td>'
                + '<input type="hidden" name="itemGoodsId" value="' + newMaxId + '"/>'
                + '<input type="hidden" name="salesBackTicketVoList[' + newMaxId + '].salesGoodsId" value="' + goods.id + '"/>'
                + '<input type="text" name="salesBackTicketVoList[' + newMaxId + '].goodsCode" value="' + goods.goodsCode + '" readonly="readonly"/>'
                + '</td>'
                + '<td>'
                + '<input type="text" name="salesBackTicketVoList[' + newMaxId + '].goodsName" value="' + goods.goodsName + '" readonly="readonly"/>'
                + '</td>'
                + '<td>'
                + '<input type="text" name="salesBackTicketVoList[' + newMaxId + '].goodsSpec" value="' + goods.goodsSpec + '" readonly="readonly"/>'
                + '</td>'
                + '<td>'
                + '<input type="text" name="salesBackTicketVoList[' + newMaxId + '].goodsType" value="' + goods.goodsType + '" readonly="readonly"/>'
                + '</td>'
                + '<td>'
                + '<input type="text" name="salesBackTicketVoList[' + newMaxId + '].manufacturer" value="' + goods.manufacturer + '" readonly="readonly"/>'
                + '</td>'
                + '<td>'
                + '<input type="text" name="salesBackTicketVoList[' + newMaxId + '].unit" value="' + goods.unit + '" readonly="readonly"/>'
                + '</td>'
                + '<td>'
                + '<input type="text" name="salesBackTicketVoList[' + newMaxId + '].content" value="' + goods.content + '" readonly="readonly"/>'
                + '</td>'
                + '<td>'
                + '<input type="text" name="salesBackTicketVoList[' + newMaxId + '].backPriceTaxFree" value="" readonly="readonly"/>'
                + '</td>'
                + '<td>'
                + '<input type="text" name="salesBackTicketVoList[' + newMaxId + '].backPriceTotalTax" value="" readonly="readonly"/>'
                + '</td>'
                + '<td>'
                + '<input type="text" name="salesBackTicketVoList[' + newMaxId + '].backPriceTaxAmount" value="" readonly="readonly"/>'
                + '</td>'
                + '<td>'
                + '<input type="text" name="salesBackTicketVoList[' + newMaxId + '].unitBackNumber" value="" />'
                + '</td>'
                + '<td>'
                + '<input type="text" name="salesBackTicketVoList[' + newMaxId + '].returnReason" value="" />'
                + '</td>'
                + '<shiro:hasPermission name="sales:salesBackTicket:edit"><td>'
                + '<a href="javascript:void(0)" class="btnDel" onclick="del(' + newMaxId + ');">删除</a>'
                + '</td></shiro:hasPermission>'
                + '</tr>';
            var html = trStr;
            return html;
        }

        // 删除
        function del(itemGoodsId, entityId) {
            if (entityId) {
                var url = "${ctx}/sales/salesGoods/delete";
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
    <li><a href="${ctx}/sales/salesBackTicket/">销售退回开票单列表</a></li>
    <li class="active"><a
            href="${ctx}/sales/salesBackTicket/form?id=${salesBackTicket.id}">销售退回开票单<shiro:hasPermission
            name="sales:salesBackTicket:edit">${not empty salesBackTicket.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission
            name="sales:salesBackTicket:edit">查看</shiro:lacksPermission></a></li>
</ul>
<br/>
<form:form id="inputForm" modelAttribute="salesBackTicket" action="${ctx}/sales/salesBackTicket/save"
           method="post" class="form-horizontal">
    <form:hidden path="id"/>
    <sys:message content="${message}"/>
    <div class="tab-content">
        <div class="tab-pane active" id="baseInfo">
            <div class="control-group">
            	<div class="div-a">
                    <label class="control-label">单据编号：</label>
                    <div class="controls">
                        <form:input path="backTicketNumber" htmlEscape="false" maxlength="16" class="input-xlarge "/>
                    </div>
                </div>
                <div class="div-b">
                    <label class="control-label">销售订单：</label>
                    <div class="controls">
                        <form:select path="salesOrder.id" id="salesOrderId" class="input-xlselect ">
                            <form:option value="" label=""/>
                            <form:options items="${salesBackTicket.salesOrderList}" itemLabel="orderNum"
                                          itemValue="id"
                                          htmlEscape="false"/>
                        </form:select>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="tab-pane" id="goodsInfo" style="overflow:auto;">
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
                <th>不含税金额</th>
                <th>税额</th>
                <th>含税金额</th>
                <th>退回数量</th>
                <th>退货原因</th>
                <shiro:hasPermission name="sales:salesBackTicket:edit">
                    <th>操作</th>
                </shiro:hasPermission>
            </tr>
            </thead>
            <tbody id="sales_contentField">
            <c:forEach items="${salesBackTicket.salesBackTicketVoList}" var="item" varStatus="i">
                <tr id="sales_tr_${i.index}">
                    <td>
                        <input type="hidden" name="itemGoodsId" value="${i.index}"/>
                        <input type="hidden" name="salesBackTicketVoList[${i.index }].salesGoodsId" value="${item.salesGoodsId}"/>
                        <input type="text" class="table-form-control" name="salesBackTicketVoList[${i.index }].goodsCode"
                               value="${item.goodsCode }" valid='vtext'/>
                    </td>
                    <td>
                        <input type="text" class="table-form-control" name="salesBackTicketVoList[${i.index }].goodsName"
                               value="${item.goodsName }" valid='vtext'/>
                    </td>
                    <td>
                        <input type="text" class="table-form-control" name="salesBackTicketVoList[${i.index }].goodsSpec"
                               value="${item.goodsSpec }" valid='vtext'/>
                    </td>
                    <td>
                        <input type="text" class="table-form-control" name="salesBackTicketVoList[${i.index }].goodsType"
                               value="${item.goodsType }" valid='vtext'/>
                    </td>
                    <td>
                        <input type="text" class="table-form-control" name="salesBackTicketVoList[${i.index }].manufacturer"
                               value="${item.manufacturer }" valid='vtext'/>
                    </td>
                    <td>
                        <input type="text" class="table-form-control" name="salesBackTicketVoList[${i.index }].unit"
                               value="${item.unit }" valid='vtext'/>
                    </td>
                    <td>
                        <input type="text" class="table-form-control" name="salesBackTicketVoList[${i.index }].content"
                               value="${item.content }" valid='vtext'/>
                    </td>
                    <td>
                        <input type="text" class="table-form-control" name="salesBackTicketVoList[${i.index }].backPriceTaxFree"
                               value="${item.backPriceTaxFree }" valid='vtext'/>
                    </td>
                    <td>
                        <input type="text" class="table-form-control" name="salesBackTicketVoList[${i.index }].backPriceTotalTax"
                               value="${item.backPriceTotalTax }" valid='vtext'/>
                    </td>
                    <td>
                        <input type="text" class="table-form-control" name="salesBackTicketVoList[${i.index }].backPriceTaxAmount"
                               value="${item.backPriceTaxAmount }" valid='vtext'/>
                    </td>
                    <td>
                        <input type="text" class="table-form-control" name="salesBackTicketVoList[${i.index }].unitBackNumber"
                               value="${item.unitBackNumber }" valid='vtext'/>
                    </td>
                    <td>
                        <input type="text" class="table-form-control" name="salesBackTicketVoList[${i.index }].returnReason"
                               value="${item.returnReason }" valid='vtext'/>
                    </td>
                    <shiro:hasPermission name="sales:salesBackTicket:edit">
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
            	<shiro:hasPermission name="sales:salesBackTicket:edit">
               		<td colspan="8"><a href="javascript:" onclick="addSalesGoods();" class="btn">新增</a></td>
             	</shiro:hasPermission>
            </tr>
            </tfoot>
        </table>
    </div>
    <div class="form-actions">
        <shiro:hasPermission name="sales:salesBackTicket:edit"><input id="btnSubmit" class="btn btn-primary"
                                                                            type="submit"
                                                                            value="保 存"/>&nbsp;</shiro:hasPermission>
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </div>
</form:form>
</body>
</html>