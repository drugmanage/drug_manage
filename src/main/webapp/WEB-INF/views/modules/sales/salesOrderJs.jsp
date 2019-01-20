<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<script type="application/javascript">
	var oper = {
        sales: {
            socpName: "sales_",
            viewGoods: function () {
                let width = $("#mainFrame", top.window.document).width();
                let height = $("#mainFrame", top.window.document).height() - 80;
                top.$.jBox.open("iframe:${ctx}/sales/salesGoods/getGoodsList", "商品筛选", width, height, {
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
                                            $("#" + this.socpName + "tr_" + maxId).after(html);
                                        }
                                    }
                                } else {
                                    let newMaxId = 0;
                                    let html = window.appendHtml(newMaxId, goods);
                                    $("#" + oper.sales.socpName + "contentField").html(html);
                                }
                            }
                        }
                    }, loaded: function (h) {
                        $(".jbox-content", top.document).css("overflow-y", "hidden");
                    }
                });

            },
            del: function (itemGoodsId,entityId) {
                if(entityId){
                    var url = "${ctx}/sales/salesGoods/delete";
                    tips="确定删除商品信息？";
                    top.$.jBox.confirm(tips, "清除确认", function(v){
                        if(v=="ok") {
                            $.ajax({
                                url: url,
                                data: {id: entityId},
                                type: 'post',
                                dataType: 'json',
                                async: false,
                                success: function (data) {
                                    if (data.code == 200) {
                                        alertx(data.msg);
                                        $("#" + oper.sales.socpName + "tr_" + itemGoodsId).remove();
                                    }
                                }
                            })
                        }
                    });
                }else{
                    $("#" + this.socpName + "tr_" + itemGoodsId).remove();
                }
            }
        }
    };
</script>