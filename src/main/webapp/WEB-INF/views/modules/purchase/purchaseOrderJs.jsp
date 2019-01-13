<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<script type="application/javascript">
    var oper = {
        goods: {
            socpName: "goods_",
            viewGoods: function () {
                var width = $("#mainFrame", top.window.document).width();
                var height = $("#mainFrame", top.window.document).height() - 80;

                top.$.jBox.open("iframe:${ctx}/purchase/purchaseGoods/getGoodsList", "商品筛选", width, height, {
                    buttons: {"确定": "ok", "关闭": true}, submit: function (v, h, f) {
                        if (v == "ok") {
                            // var goods = null;
                            var goods = h.find("iframe")[0].contentWindow.goods;
                            // for (var i = 0; i < chks.length; i++) {
                            //     if (chks[i].checked == true) {
                            //         goods = chks[i].value;
                            //     }
                            // }
                            console.log(goods)
                            // var html = this.appendHtml(newMaxId);
                            // $("#" + this.socpName + "tr_" + maxId).after(html);
                        }
                        else if (v == "clear") {
                        }
                    }, loaded: function (h) {
                        $(".jbox-content", top.document).css("overflow-y", "hidden");
                    }
                });
            },
            add: function showSaveDiv(deviceId) {
                if ($("input[name='itemGoodsId']") && $("input[name='itemGoodsId']").length != 0) {
                    var itemGoodsId = [];
                    $("input[name='itemGoodsId']").each(function () {
                        itemGoodsId.push(parseInt($(this).val()));
                    });
                    if (itemGoodsId.length != 0) {
                        var maxId = Math.max.apply(null, itemGoodsId);
                        if (maxId != undefined) {
                            var newMaxId = maxId + 1;
                            var html = this.appendHtml(newMaxId);
                            $("#" + this.socpName + "tr_" + maxId).after(html);
                        }
                    }
                } else {
                    var newMaxId = 0;
                    var html = this.appendHtml(newMaxId);
                    $("#" + oper.edu.socpName + "contentField").html(html);
                }

            },
            del: function (itemGoodsId, entityId) {
                if (entityId) {
                    var url = "${ctx}/purchase/purchaseGoods/delete";
                    tips = "确定删除商品信息？";
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
            },
            appendHtml: function (newMaxId) {
                var trStr = '<tr id="' + this.socpName + 'tr_' + newMaxId + '">'
                    + '<td>'
                    + '<input type="hidden" name="itemGoodsId" value="' + newMaxId + '"/>'
                    + '<input type="hidden" name="goodsList[' + newMaxId + '].goodsId" value=""/>'
                    + '<input type="text" class="table-form-control" name="goodsList[' + newMaxId + '].goodsCode"'
                    + 'value="" valid="vtext"/>'
                    + '</td>'
                    + '<td>'
                    + '<input type="text" class="table-form-control" name="goodsList[' + newMaxId + '].goodsName"'
                    + 'value="" valid="vtext"/>'
                    + '</td>'
                    + '<td>'
                    + '<input type="text" class="table-form-control" name="goodsList[' + newMaxId + '].goodsSpec"'
                    + 'value="" valid="vtext"/>'
                    + '</td>'
                    + '<td>'
                    + '<input type="text" class="table-form-control" name="goodsList[' + newMaxId + '].goodsType"'
                    + 'value="" valid="vtext"/>'
                    + '</td>'
                    + '<td>'
                    + '<input type="text" class="table-form-control" name="goodsList[' + newMaxId + '].manufacturer"'
                    + 'value="" valid="vtext"/>'
                    + '</td>'
                    + '<td>'
                    + '<input type="text" class="table-form-control" name="goodsList[' + newMaxId + '].unit"'
                    + 'value="" valid="vtext"/>'
                    + '</td>'
                    + '<td>'
                    + '<input type="text" class="table-form-control" name="goodsList[' + newMaxId + '].content"'
                    + 'value="" valid="vtext"/>'
                    + '</td>'
                    + '<td>'
                    + '<input type="text" class="table-form-control" name="goodsList[' + newMaxId + '].retailPrice"'
                    + 'value="" valid="vtext"/>'
                    + '</td>'
                    + '<td>'
                    + '<input type="text" class="table-form-control" name="goodsList[' + newMaxId + '].number"'
                    + 'value="" valid="vtext"/>'
                    + '</td>'
                    + '<td>'
                    + '<input type="text" class="table-form-control" name="goodsList[' + newMaxId + '].tax"'
                    + 'value="" valid="vtext"/>'
                    + '</td>'
                    + '<td>'
                    + '<input type="text" class="table-form-control" name="goodsList[' + newMaxId + '].stock"'
                    + 'value="" valid="vtext"/>'
                    + '</td>'
                    + '<td>'
                    + '<input type="text" class="table-form-control" name="goodsList[' + newMaxId + '].arrivalNum"'
                    + 'value="" valid="vtext"/>'
                    + '</td>'
                    + '<td>'
                    + '<a href="javascript:void(0)" class="btnDel" onclick="oper.goods.del(' + newMaxId + ');">删除</a>'
                    + '</td>'
                    + '</tr>';
                var html = trStr;
                return html;
            }
        }
    };

    $(function () {
        $("input[name='companyType']").click(function () {
            var com = $(this).val();
            if (com == "2") {
                $("#addressTableDiv").show();
            } else {
                $("#addressTableDiv").hide();
                $("#address_contentField").html("");
            }
        })

        var comType = $("input[name='companyType']").val();
        if (comType == "2") {
            $("#addressTableDiv").show();
        } else {
            $("#addressTableDiv").hide();
            $("#address_contentField").html("");
        }
    })

</script>
