<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<script type="application/javascript">
    var oper = {
        goods: {
            socpName: "goods_",
            viewGoods: function () {
                let width = $("#mainFrame", top.window.document).width();
                let height = $("#mainFrame", top.window.document).height() - 80;
                var html = "";
                top.$.jBox.open("iframe:${ctx}/purchase/purchaseGoods/getGoodsList", "商品筛选", width, height, {
                    buttons: {"确定": "ok", "关闭": true}, submit: function (v, h, f) {
                        if (v == "ok") {
                            var iframeName = h.children(0).attr("name");
                            var iframeHtml = window.frames[iframeName];               //获取子窗口的句柄
                            iframeHtml.getChecked();

                            let goodsArr = h.find("iframe")[0].contentWindow.goodsArr;
                            if (goodsArr.length != 0) {
                                for (let i = 0; i < goodsArr.length; i++) {
                                    const goods = goodsArr[i];
                                    console.log(goods)
                                    html = window.appendHtml(1, goods);
                                    $("#" + oper.goods.socpName + "contentField").html(html);
                                }
                            }
                        }
                    }, loaded: function (h) {
                        $(".jbox-content", top.document).css("overflow-y", "hidden");
                    }
                });

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
            }
        }
    };

</script>
