<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<script type="application/javascript">
    var oper = {
        address: {
            socpName: "address_",
            //工作经历页面
            add: function () {
                if ($("input[name='itemAddressId']") && $("input[name='itemAddressId']").length != 0) {
                    var itemAddressId = [];
                    $("input[name='itemAddressId']").each(function () {
                        itemAddressId.push(parseInt($(this).val()));
                    });
                    if (itemAddressId.length != 0) {
                        var maxId = Math.max.apply(null, itemAddressId);
                        if (maxId != undefined) {
                            var newMaxId = maxId + 1;
                            var html = this.appendHtml(newMaxId);
                            $("#" + this.socpName + "tr_" + maxId).after(html);
                        }
                    }
                } else {
                    var newMaxId = 0;
                    var html = this.appendHtml(newMaxId);
                    $("#" + oper.address.socpName + "contentField").html(html);
                }
            },
            del: function (itemAddressId, entityId) {
                if (entityId) {
                    var url = "${ctx}/customer/customerAddress/delete";
                    tips = "确定删除收货地址信息吗？";
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
                                        $("#" + this.socpName + "tr_" + itemAddressId).remove();
                                    }
                                }
                            })
                        }
                    });
                } else {
                    $("#" + this.socpName + "tr_" + itemAddressId).remove();
                }
            },
            appendHtml: function (newMaxId) {
                var frontUploadId = "front" + newMaxId;
                var backUploadId = "back" + newMaxId;
                var trStr = '<tr id="' + this.socpName + 'tr_' + newMaxId + '">'
                    + '<td>'
                    + '<input type="hidden" name="itemAddressId" value="' + newMaxId + '"/>'
                    + '<input type="hidden" name="customerAddressList[' + newMaxId + '].id" value=""/>'
                    + '<input type="text" class="table-form-control" name="customerAddressList[' + newMaxId + '].receivingName" value="" valid="vtext"/>'
                    + '</td>'

                    + '<td>'
                    + '<input id="area' + newMaxId + 'Id" name="customerAddressList[' + newMaxId + '].area.id" class="required" type="hidden" value="">'
                    + '<input id="area' + newMaxId + 'Name" name="customerAddressList[' + newMaxId + '].area.name" readonly="readonly" type="text" value="" data-msg-required="" class="required" style="">'
                    + '<a id="area' + newMaxId + 'Button" href="javascript:" class="btn  " style="">&nbsp;<i class="icon-search"></i>&nbsp;</a>&nbsp;&nbsp;'
                    + '<script type="text/javascript">\r\n'
                    + '$("#area' + newMaxId + 'Button, #area' + newMaxId + 'Name").click(function(){ \r\n'
                    + 'if ($("#area' + newMaxId + 'Button").hasClass("disabled")){ return true; }\r\n'
                    + 'top.$.jBox.open("iframe:/a/tag/treeselect?url="+encodeURIComponent("/sys/area/treeData")+"&module=&checked=&extId=&isAll=", "选择区域", 300, 420, {'
                    + ' ajaxData:{selectIds: $("#area' + newMaxId + 'Id").val()},buttons:{"确定":"ok", "关闭":true}, submit:function(v, h, f){ \r\n'
                    + 'if (v=="ok"){\r\n'
                    + 'var tree = h.find("iframe")[0].contentWindow.tree;\r\n'
                    + 'var ids = [], names = [], nodes = [];\r\n'
                    + 'if ("" == "true"){\r\n'
                    + 'nodes = tree.getCheckedNodes(true);\r\n'
                    + '}else{\r\n'
                    + 'nodes = tree.getSelectedNodes();\r\n'
                    + '}\r\n'
                    + 'for(var i=0; i<nodes.length; i++) {//\r\n'
                    + 'ids.push(nodes[i].id);\r\n'
                    + 'names.push(nodes[i].name);//\r\n'
                    + 'break; // 如果为非复选框选择，则返回第一个选择  \r\n'
                    + '}\r\n'
                    + '$("#area' + newMaxId + 'Id").val(ids.join(",").replace(/u_/ig,""));\r\n'
                    + '$("#area' + newMaxId + 'Name").val(names.join(","));\r\n'
                    + '}\r\n'
                    + 'else if (v=="clear"){\r\n'
                    + '$("#area' + newMaxId + 'Id").val("");\r\n'
                    + '$("#area' + newMaxId + 'Name").val("");\r\n'
                    + '}\r\n'
                    + 'if(typeof areaTreeselectCallBack == \'function\'){\r\n'
                    + 'areaTreeselectCallBack(v, h, f);\r\n'
                    + '}\r\n'
                    + '}, loaded:function(h){\r\n'
                    + '$(".jbox-content", top.document).css("overflow-y","hidden");\r\n'
                    + '}\r\n'
                    + '});\r\n'
                    + '});\r\n'
                    + '<\/script>'
                    + '</td>'

                    + '<td>'
                    + '<input type="text" class="table-form-control" name="customerAddressList[' + newMaxId + '].receivingAddress" value="" valid="vtext"/>'
                    + '</td>'

                    + '<td>'
                    + '<input type="text" class="table-form-control" name="customerAddressList[' + newMaxId + '].contactPhone" value="" valid="vnum"/>'
                    + '</td>'
                    + '<td>'
                    + '<a href="javascript:void(0)" class="btnDel" onclick="oper.address.del(' + newMaxId + ');">删除</a>'
                    + '</td>'
                    + '</tr>';
                var html = trStr;
                return html;
            }
        },
        bank: {
            socpName: "bank_",
            add: function () {
                if ($("input[name='itemBankId']") && $("input[name='itemBankId']").length != 0) {
                    var itemBankId = [];
                    $("input[name='itemBankId']").each(function () {
                        itemBankId.push(parseInt($(this).val()));
                    });
                    if (itemBankId.length != 0) {
                        var maxId = Math.max.apply(null, itemBankId);
                        if (maxId != undefined) {
                            var newMaxId = maxId + 1;
                            var html = this.appendHtml(newMaxId);
                            $("#" + oper.bank.socpName + "tr_" + maxId).after(html);
                        }
                    }
                } else {
                    var newMaxId = 0;
                    var html = this.appendHtml(newMaxId);
                    $("#" + this.socpName + "contentField").html(html);
                }
            },
            del: function (itemBankId, entityId) {
                if (entityId) {
                    var url = "${ctx}/customer/customerBank/delete";
                    tips = "确定删除银行信息？";
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
                                        $("#" + this.socpName + "tr_" + itemBankId).remove();
                                    }
                                }
                            })
                        }
                    });
                } else {
                    $("#" + this.socpName + "tr_" + itemBankId).remove();
                }
            },
            appendHtml: function (newMaxId) {
                var frontUploadId = "front" + newMaxId;
                var backUploadId = "back" + newMaxId;
                var trStr = '<tr id="' + this.socpName + 'tr_' + newMaxId + '">'
                    + '<td>'
                    + '<input type="hidden" name="itemBankId" value="' + newMaxId + '"/>'
                    + '<input type="hidden" name="customerBanksList[' + newMaxId + '].id" value=""/>'
                    + '<select class="table-form-control" name="customerBanksList[' + newMaxId + '].bank">'
                    + '<c:forEach items="${fns:getDictList('bank')}" var="dict" varStatus="idx">'
                    + '<option value="${dict.value}"  >${dict.label}</option>'
                    + '</c:forEach>'
                    + '</select>'
                    + '</td>'
                    + '<td>'
                    + '<input type="text" class="table-form-control" name="customerBanksList[' + newMaxId + '].bankNumber" value="" valid="vtext"/>'
                    + '</td>'
                    + '<td>'
                    + '<input type="text" class="table-form-control" name="customerBanksList[' + newMaxId + '].openAccountName" value="" valid="text"/>'
                    + '</td>'
                    + '<td>'
                    + '<input type="text" class="table-form-control" name="customerBanksList[' + newMaxId + '].remarks" value="" valid="text"/>'
                    + '</td>'
                    + '<td>'
                    + '<a href="javascript:void(0)" class="btnDel" onclick="oper.bank.del(' + newMaxId + ');">删除</a>'
                    + '</td>'
                    + '</tr>';
                var html = trStr;
                return html;
            }
        },
        invoice: {
            socpName: "invoice_",
            add: function () {
                if ($("input[name='itemBankId']") && $("input[name='itemBankId']").length != 0) {
                    var itemBankId = [];
                    $("input[name='itemBankId']").each(function () {
                        itemBankId.push(parseInt($(this).val()));
                    });
                    if (itemBankId.length != 0) {
                        var maxId = Math.max.apply(null, itemBankId);
                        if (maxId != undefined) {
                            var newMaxId = maxId + 1;
                            var html = this.appendHtml(newMaxId);
                            $("#" + oper.bank.socpName + "tr_" + maxId).after(html);
                        }
                    }
                } else {
                    var newMaxId = 0;
                    var html = this.appendHtml(newMaxId);
                    $("#" + this.socpName + "contentField").html(html);
                }
            },
            del: function (itemBankId, entityId) {
                if (entityId) {
                    var url = "${ctx}/customer/customerBank/delete";
                    tips = "确定删除银行信息？";
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
                                        $("#" + this.socpName + "tr_" + itemBankId).remove();
                                    }
                                }
                            })
                        }
                    });
                } else {
                    $("#" + this.socpName + "tr_" + itemBankId).remove();
                }
            },
            appendHtml: function (newMaxId) {
                var frontUploadId = "front" + newMaxId;
                var backUploadId = "back" + newMaxId;
                var trStr = '<tr id="' + this.socpName + 'tr_' + newMaxId + '">'
                    + '<td>'
                    + '<input type="hidden" name="itemBankId" value="' + newMaxId + '"/>'
                    + '<input type="hidden" name="customerBanksList[' + newMaxId + '].id" value=""/>'
                    + '<select class="table-form-control" name="customerBanksList[' + newMaxId + '].bank">'
                    + '<c:forEach items="${fns:getDictList('bank')}" var="dict" varStatus="idx">'
                    + '<option value="${dict.value}"  >${dict.label}</option>'
                    + '</c:forEach>'
                    + '</select>'
                    + '</td>'
                    + '<td>'
                    + '<input type="text" class="table-form-control" name="customerBanksList[' + newMaxId + '].bankNumber" value="" valid="vtext"/>'
                    + '</td>'
                    + '<td>'
                    + '<input type="text" class="table-form-control" name="customerBanksList[' + newMaxId + '].openAccountName" value="" valid="text"/>'
                    + '</td>'
                    + '<td>'
                    + '<input type="text" class="table-form-control" name="customerBanksList[' + newMaxId + '].remarks" value="" valid="text"/>'
                    + '</td>'
                    + '<td>'
                    + '<a href="javascript:void(0)" class="btnDel" onclick="oper.bank.del(' + newMaxId + ');">删除</a>'
                    + '</td>'
                    + '</tr>';
                var html = trStr;
                return html;
            }
        },
        document: {
            socpName: "document_",
            add: function () {
                if ($("input[name='itemBankId']") && $("input[name='itemBankId']").length != 0) {
                    var itemBankId = [];
                    $("input[name='itemBankId']").each(function () {
                        itemBankId.push(parseInt($(this).val()));
                    });
                    if (itemBankId.length != 0) {
                        var maxId = Math.max.apply(null, itemBankId);
                        if (maxId != undefined) {
                            var newMaxId = maxId + 1;
                            var html = this.appendHtml(newMaxId);
                            $("#" + oper.bank.socpName + "tr_" + maxId).after(html);
                        }
                    }
                } else {
                    var newMaxId = 0;
                    var html = this.appendHtml(newMaxId);
                    $("#" + this.socpName + "contentField").html(html);
                }
            },
            del: function (itemBankId, entityId) {
                if (entityId) {
                    var url = "${ctx}/customer/customerBank/delete";
                    tips = "确定删除银行信息？";
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
                                        $("#" + this.socpName + "tr_" + itemBankId).remove();
                                    }
                                }
                            })
                        }
                    });
                } else {
                    $("#" + this.socpName + "tr_" + itemBankId).remove();
                }
            },
            appendHtml: function (newMaxId) {
                var frontUploadId = "front" + newMaxId;
                var backUploadId = "back" + newMaxId;
                var trStr = '<tr id="' + this.socpName + 'tr_' + newMaxId + '">'
                    + '<td>'
                    + '<input type="hidden" name="itemBankId" value="' + newMaxId + '"/>'
                    + '<input type="hidden" name="customerBanksList[' + newMaxId + '].id" value=""/>'
                    + '<select class="table-form-control" name="customerBanksList[' + newMaxId + '].bank">'
                    + '<c:forEach items="${fns:getDictList('bank')}" var="dict" varStatus="idx">'
                    + '<option value="${dict.value}"  >${dict.label}</option>'
                    + '</c:forEach>'
                    + '</select>'
                    + '</td>'
                    + '<td>'
                    + '<input type="text" class="table-form-control" name="customerBanksList[' + newMaxId + '].bankNumber" value="" valid="vtext"/>'
                    + '</td>'
                    + '<td>'
                    + '<input type="text" class="table-form-control" name="customerBanksList[' + newMaxId + '].openAccountName" value="" valid="text"/>'
                    + '</td>'
                    + '<td>'
                    + '<input type="text" class="table-form-control" name="customerBanksList[' + newMaxId + '].remarks" value="" valid="text"/>'
                    + '</td>'
                    + '<td>'
                    + '<a href="javascript:void(0)" class="btnDel" onclick="oper.bank.del(' + newMaxId + ');">删除</a>'
                    + '</td>'
                    + '</tr>';
                var html = trStr;
                return html;
            }
        },
        consigner: {
            socpName: "consigner_",
            add: function () {
                if ($("input[name='itemBankId']") && $("input[name='itemBankId']").length != 0) {
                    var itemBankId = [];
                    $("input[name='itemBankId']").each(function () {
                        itemBankId.push(parseInt($(this).val()));
                    });
                    if (itemBankId.length != 0) {
                        var maxId = Math.max.apply(null, itemBankId);
                        if (maxId != undefined) {
                            var newMaxId = maxId + 1;
                            var html = this.appendHtml(newMaxId);
                            $("#" + oper.bank.socpName + "tr_" + maxId).after(html);
                        }
                    }
                } else {
                    var newMaxId = 0;
                    var html = this.appendHtml(newMaxId);
                    $("#" + this.socpName + "contentField").html(html);
                }
            },
            del: function (itemBankId, entityId) {
                if (entityId) {
                    var url = "${ctx}/customer/customerBank/delete";
                    tips = "确定删除银行信息？";
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
                                        $("#" + this.socpName + "tr_" + itemBankId).remove();
                                    }
                                }
                            })
                        }
                    });
                } else {
                    $("#" + this.socpName + "tr_" + itemBankId).remove();
                }
            },
            appendHtml: function (newMaxId) {
                var frontUploadId = "front" + newMaxId;
                var backUploadId = "back" + newMaxId;
                var trStr = '<tr id="' + this.socpName + 'tr_' + newMaxId + '">'
                    + '<td>'
                    + '<input type="hidden" name="itemBankId" value="' + newMaxId + '"/>'
                    + '<input type="hidden" name="customerBanksList[' + newMaxId + '].id" value=""/>'
                    + '<select class="table-form-control" name="customerBanksList[' + newMaxId + '].bank">'
                    + '<c:forEach items="${fns:getDictList('bank')}" var="dict" varStatus="idx">'
                    + '<option value="${dict.value}"  >${dict.label}</option>'
                    + '</c:forEach>'
                    + '</select>'
                    + '</td>'
                    + '<td>'
                    + '<input type="text" class="table-form-control" name="customerBanksList[' + newMaxId + '].bankNumber" value="" valid="vtext"/>'
                    + '</td>'
                    + '<td>'
                    + '<input type="text" class="table-form-control" name="customerBanksList[' + newMaxId + '].openAccountName" value="" valid="text"/>'
                    + '</td>'
                    + '<td>'
                    + '<input type="text" class="table-form-control" name="customerBanksList[' + newMaxId + '].remarks" value="" valid="text"/>'
                    + '</td>'
                    + '<td>'
                    + '<a href="javascript:void(0)" class="btnDel" onclick="oper.bank.del(' + newMaxId + ');">删除</a>'
                    + '</td>'
                    + '</tr>';
                var html = trStr;
                return html;
            }
        },

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
