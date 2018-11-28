<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<script type="application/javascript">
    var oper = {
        address: {
            socpName: "address_",
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
                    + '<input type="text" class="table-form-control" name="customerAddressList[' + newMaxId + '].remarks" value="" valid="vnum"/>'
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
                if ($("input[name='itemInvoiceInfoId']") && $("input[name='itemInvoiceInfoId']").length != 0) {
                    var itemInvoiceInfoId = [];
                    $("input[name='itemInvoiceInfoId']").each(function () {
                        itemInvoiceInfoId.push(parseInt($(this).val()));
                    });
                    if (itemInvoiceInfoId.length != 0) {
                        var maxId = Math.max.apply(null, itemInvoiceInfoId);
                        if (maxId != undefined) {
                            var newMaxId = maxId + 1;
                            var html = this.appendHtml(newMaxId);
                            $("#" + oper.invoice.socpName + "tr_" + maxId).after(html);
                        }
                    }
                } else {
                    var newMaxId = 0;
                    var html = this.appendHtml(newMaxId);
                    $("#" + this.socpName + "contentField").html(html);
                }
            },
            del: function (itemInvoiceInfoId, entityId) {
                if (entityId) {
                    var url = "${ctx}/customer/customerInvoiceInfo/delete";
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
                                        $("#" + this.socpName + "tr_" + itemInvoiceInfoId).remove();
                                    }
                                }
                            })
                        }
                    });
                } else {
                    $("#" + this.socpName + "tr_" + itemInvoiceInfoId).remove();
                }
            },
            appendHtml: function (newMaxId) {
                var trStr = '<tr id="' + this.socpName + 'tr_' + newMaxId + '">'
                    + '<td>'
                    + '<input type="hidden" name="itemInvoiceInfoId" value="' + newMaxId + '"/>'
                    + '<input type="hidden" name="customerInvoiceInfoList[' + newMaxId + '].id" value=""/>'
                    + '<input type="text" class="table-form-control" name="customerInvoiceInfoList[' + newMaxId + '].accountName" value="" valid="vtext"/>'
                    + '</td>'

                    + '<td>'
                    + '<select class="table-form-control" name="customerInvoiceInfoList[' + newMaxId + '].bankDeposit">'
                    + '<c:forEach items="${fns:getDictList('bank')}" var="dict" varStatus="idx">'
                    + '<option value="${dict.value}"  >${dict.label}</option>'
                    + '</c:forEach>'
                    + '</select>'
                    + '</td>'

                    + '<td>'
                    + '<input id="area' + newMaxId + 'Id" name="customerInvoiceInfoList[' + newMaxId + '].area.id" class="required" type="hidden" value="">'
                    + '<input id="area' + newMaxId + 'Name" name="customerInvoiceInfoList[' + newMaxId + '].area.name" readonly="readonly" type="text" value="" data-msg-required="" class="required" style="">'
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
                    + '<input type="text" class="table-form-control" name="customerInvoiceInfoList[' + newMaxId + '].detailAddress" value="" valid="vtext"/>'
                    + '</td>'

                    + '<td>'
                    + '<input type="text" class="table-form-contro l" name="customerInvoiceInfoList[' + newMaxId + '].phone" value="" valid="vtext"/>'
                    + '</td>'

                    + '<td>'
                    + '<input type="text" class="table-form-control" name="customerInvoiceInfoList[' + newMaxId + '].accountNumber" value="" valid="vtext"/>'
                    + '</td>'

                    + '<td>'
                    + '<input type="text" class="table-form-control" name="customerInvoiceInfoList[' + newMaxId + '].dutyParagraph" value="" valid="vtext"/>'
                    + '</td>'

                    + '<td>'
                    + '<input id="nameImage' + newMaxId + '" name="customerInvoiceInfoList[' + newMaxId + '].invoicePath" type="hidden" >'
                    + '<ol id="nameImage' + newMaxId + 'Preview"><li style="list-style:none;padding-top:5px;">无</li></ol>'
                    + '<a href="javascript:" onclick="nameImage' + newMaxId + 'FinderOpen();" class="btn" id="limitAdd">添加</a>&nbsp;<a href="javascript:" onclick="nameImage' + newMaxId + 'DelAll();" class="btn">清除</a>'
                    + '<script type="text/javascript">'
                    + 'function nameImage' + newMaxId + 'FinderOpen(){\r\n'
                    + 'var date = new Date(), year = date.getFullYear(), month = (date.getMonth()+1)>9?date.getMonth()+1:"0"+(date.getMonth()+1);\r\n'
                    + 'var url = "${ctxStatic}/ckfinder/ckfinder.html?type=images&start=images:/photo/customer/invoice/"+year+"/"+month+'
                    + '"/&action=js&func=nameImage' + newMaxId + 'SelectAction&thumbFunc=nameImage' + newMaxId + 'ThumbSelectAction&cb=nameImage' + newMaxId + 'Callback&dts=0&sm=1";\r\n'
                    + 'windowOpen(url,"文件管理",1000,700);\r\n'
                    + '}\r\n'
                    + 'function nameImage' + newMaxId + 'SelectAction(fileUrl, data, allFiles){\r\n'
                    + 'var url="", files=ckfinderAPI.getSelectedFiles();\r\n'
                    + 'for(var i=0; i<files.length; i++){\r\n'
                    + 'url += files[i].getUrl();\r\n'
                    + 'if (i<files.length-1) url+="|";\r\n'
                    + '}\r\n'
                    + '$("#nameImage' + newMaxId + '").val($("#nameImage' + newMaxId + '").val()+($("#nameImage' + newMaxId + '").val(url)==""?url:"|"+url));\r\n'
                    + 'nameImage' + newMaxId + 'Preview();\r\n'
                    + '}\r\n'
                    + 'function nameImage' + newMaxId + 'ThumbSelectAction(fileUrl, data, allFiles){\r\n'
                    + 'var url="", files=ckfinderAPI.getSelectedFiles();\r\n'
                    + 'for(var i=0; i<files.length; i++){\r\n'
                    + 'url += files[i].getThumbnailUrl();\r\n'
                    + 'if (i<files.length-1) url+="|";\r\n'
                    + '}\r\n'
                    + '$("#nameImage' + newMaxId + '").val($("#nameImage' + newMaxId + '").val()+($("#nameImage' + newMaxId + '").val(url)==""?url:"|"+url));\r\n'
                    + 'nameImage' + newMaxId + 'Preview();\r\n'
                    + '}\r\n'
                    + 'function nameImage' + newMaxId + 'Callback(api){\r\n'
                    + 'ckfinderAPI = api;\r\n'
                    + '}\r\n'
                    + 'function nameImage' + newMaxId + 'Del(obj){\r\n'
                    + 'var url = $(obj).prev().attr("url");\r\n'
                    + '$("#nameImage' + newMaxId + '").val($("#nameImage' + newMaxId + '").val().replace("|"+url,"","").replace(url+"|","","").replace(url,"",""));\r\n'
                    + 'nameImage' + newMaxId + 'Preview();\r\n'
                    + '}\r\n'
                    + 'function nameImage' + newMaxId + 'DelAll(){\r\n'
                    + '$("#nameImage' + newMaxId + '").val("");\r\n'
                    + 'nameImage' + newMaxId + 'Preview();\r\n'
                    + '}\r\n'
                    + 'function nameImage' + newMaxId + 'Preview(){\r\n'
                    + 'var li, urls = $("#nameImage' + newMaxId + '").val().split("|");\r\n'
                    + '$("#nameImage' + newMaxId + 'Preview").children().remove();\r\n'
                    + 'for (var i=0; i<urls.length; i++){\r\n'
                    + 'if (urls[i]!=""){\r\n'
                    + 'li = "<li><a href="+urls[i]+" url=\"+urls[i]+\" target=\\"_blank\\"><img src=\"+urls[i]+\" url=\"+urls[i]+\" style=\\"max-width:200px;max-height:200px;_height:200px;border:0;padding:3px;width: 180px;height: 170px;\\">"+"</a>";\r\n'
                    + 'li += "&nbsp;&nbsp;<a href=\\"javascript:\\" onclick=\\"nameImage' + newMaxId + 'Del(this);\\">×</a></li>";\r\n'
                    + '$("#nameImage' + newMaxId + 'Preview").append(li);\r\n'
                    + '}\r\n'
                    + '}\r\n'
                    + 'if ($("#nameImage' + newMaxId + 'Preview").text() == ""){\r\n'
                    + '$("#nameImage' + newMaxId + 'Preview").html("<li style=\'list-style:none;padding-top:5px;\'>无</li>");\r\n'
                    + '}\r\n'
                    + '}\r\n'
                    + 'nameImage' + newMaxId + 'Preview();\r\n'
                    + '<\/script>\r\n'
                    + '</td>'

                    + '<td>'
                    + '<select class="table-form-control" name="customerInvoiceInfoList[' + newMaxId + '].stopFlag">'
                    + '<c:forEach items="${fns:getDictList('stop_flag')}" var="dict" varStatus="idx">'
                    + '<option value="${dict.value}">${dict.label}</option>'
                    + '</c:forEach>'
                    + '</select>'
                    + '</td>'

                    + '<td>'
                    + '<a href="javascript:void(0)" class="btnDel" onclick="oper.invoice.del(' + newMaxId + ');">删除</a>'
                    + '</td>'
                    + '</tr>';
                var html = trStr;
                return html;
            }
        },
        consigner: {
            socpName: "consigner_",
            add: function () {
                if ($("input[name='itemConsignerId']") && $("input[name='itemConsignerId']").length != 0) {
                    var itemConsignerId = [];
                    $("input[name='itemConsignerId']").each(function () {
                        itemConsignerId.push(parseInt($(this).val()));
                    });
                    if (itemConsignerId.length != 0) {
                        var maxId = Math.max.apply(null, itemConsignerId);
                        if (maxId != undefined) {
                            var newMaxId = maxId + 1;
                            var html = this.appendHtml(newMaxId);
                            $("#" + oper.consigner.socpName + "tr_" + maxId).after(html);
                        }
                    }
                } else {
                    var newMaxId = 0;
                    var html = this.appendHtml(newMaxId);
                    $("#" + this.socpName + "contentField").html(html);
                }
            },
            del: function (itemConsignerId, entityId) {
                if (entityId) {
                    var url = "${ctx}/customer/customerConsigner/delete";
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
                                        $("#" + this.socpName + "tr_" + itemConsignerId).remove();
                                    }
                                }
                            })
                        }
                    });
                } else {
                    $("#" + this.socpName + "tr_" + itemConsignerId).remove();
                }
            },
            appendHtml: function (newMaxId) {
                var trStr = '<tr id="' + this.socpName + 'tr_' + newMaxId + '">'
                    + '<td>'
                    + '<input type="hidden" name="itemConsignerId" value="' + newMaxId + '"/>'
                    + '<input type="hidden" name="customerConsignersList[' + newMaxId + '].id" value=""/>'
                    + '<input type="text" class="table-form-control" name="customerConsignersList[' + newMaxId + '].contactsName" value="" valid="vtext"/>'
                    + '</td>'

                    + '<td>'
                    + '<select class="table-form-control" name="customerInvoiceInfoList[' + newMaxId + '].sex">'
                    + '<c:forEach items="${fns:getDictList('sex')}" var="dict" varStatus="idx">'
                    + '<option value="${dict.value}"  >${dict.label}</option>'
                    + '</c:forEach>'
                    + '</select>'
                    + '</td>'

                    + '<td>'
                    + '<input type="text" class="table-form-control" name="customerConsignersList[' + newMaxId + '].phone" value="" valid="text"/>'
                    + '</td>'

                    + '<td>'
                    + '<input type="text" class="table-form-control" name="customerConsignersList[' + newMaxId + '].certNumber" value="" valid="text"/>'
                    + '</td>'

                    + '<td>'
                    + '<input type="text" name="customerConsignersList[' + newMaxId + '].consignerVali" value="" value="" valid="vtext" readonly="readonly" maxlength="20" class="input-medium Wdate"  '
                    + 'pattern="yyyy-MM-dd" onclick="WdatePicker({dateFmt:\'yyyy-MM-dd\',isShowClear:false});"/>'
                    + '</td>'

                    + '<td>'
                    + '<input type="text" class="table-form-control" name="customerConsignersList[' + newMaxId + '].proxyBook" value="" valid="text"/>'
                    + '</td>'

                    + '<td>'
                    + '<input type="text" name="customerConsignersList[' + newMaxId + '].proxyBookVali" value="" value="" valid="vtext" readonly="readonly" maxlength="20" class="input-medium Wdate"  '
                    + 'pattern="yyyy-MM-dd" onclick="WdatePicker({dateFmt:\'yyyy-MM-dd\',isShowClear:false});"/>'
                    + '</td>'

                    + '<td>'
                    + '<input id="nameImage' + newMaxId + '" name="customerConsignersList[' + newMaxId + '].proxyBookImgBook" type="hidden" >'
                    + '<ol id="nameImage' + newMaxId + 'Preview"><li style="list-style:none;padding-top:5px;">无</li></ol>'
                    + '<a href="javascript:" onclick="nameImage' + newMaxId + 'FinderOpen();" class="btn" id="limitAdd">添加</a>&nbsp;<a href="javascript:" onclick="nameImage' + newMaxId + 'DelAll();" class="btn">清除</a>'
                    + '<script type="text/javascript">'
                    + 'function nameImage' + newMaxId + 'FinderOpen(){\r\n'
                    + 'var date = new Date(), year = date.getFullYear(), month = (date.getMonth()+1)>9?date.getMonth()+1:"0"+(date.getMonth()+1);\r\n'
                    + 'var url = "${ctxStatic}/ckfinder/ckfinder.html?type=images&start=images:/photo/customer/consigner/"+year+"/"+month+'
                    + '"/&action=js&func=nameImage' + newMaxId + 'SelectAction&thumbFunc=nameImage' + newMaxId + 'ThumbSelectAction&cb=nameImage' + newMaxId + 'Callback&dts=0&sm=1";\r\n'
                    + 'windowOpen(url,"文件管理",1000,700);\r\n'
                    + '}\r\n'
                    + 'function nameImage' + newMaxId + 'SelectAction(fileUrl, data, allFiles){\r\n'
                    + 'var url="", files=ckfinderAPI.getSelectedFiles();\r\n'
                    + 'for(var i=0; i<files.length; i++){\r\n'
                    + 'url += files[i].getUrl();\r\n'
                    + 'if (i<files.length-1) url+="|";\r\n'
                    + '}\r\n'
                    + '$("#nameImage' + newMaxId + '").val($("#nameImage' + newMaxId + '").val()+($("#nameImage' + newMaxId + '").val(url)==""?url:"|"+url));\r\n'
                    + 'nameImage' + newMaxId + 'Preview();\r\n'
                    + '}\r\n'
                    + 'function nameImage' + newMaxId + 'ThumbSelectAction(fileUrl, data, allFiles){\r\n'
                    + 'var url="", files=ckfinderAPI.getSelectedFiles();\r\n'
                    + 'for(var i=0; i<files.length; i++){\r\n'
                    + 'url += files[i].getThumbnailUrl();\r\n'
                    + 'if (i<files.length-1) url+="|";\r\n'
                    + '}\r\n'
                    + '$("#nameImage' + newMaxId + '").val($("#nameImage' + newMaxId + '").val()+($("#nameImage' + newMaxId + '").val(url)==""?url:"|"+url));\r\n'
                    + 'nameImage' + newMaxId + 'Preview();\r\n'
                    + '}\r\n'
                    + 'function nameImage' + newMaxId + 'Callback(api){\r\n'
                    + 'ckfinderAPI = api;\r\n'
                    + '}\r\n'
                    + 'function nameImage' + newMaxId + 'Del(obj){\r\n'
                    + 'var url = $(obj).prev().attr("url");\r\n'
                    + '$("#nameImage' + newMaxId + '").val($("#nameImage' + newMaxId + '").val().replace("|"+url,"","").replace(url+"|","","").replace(url,"",""));\r\n'
                    + 'nameImage' + newMaxId + 'Preview();\r\n'
                    + '}\r\n'
                    + 'function nameImage' + newMaxId + 'DelAll(){\r\n'
                    + '$("#nameImage' + newMaxId + '").val("");\r\n'
                    + 'nameImage' + newMaxId + 'Preview();\r\n'
                    + '}\r\n'
                    + 'function nameImage' + newMaxId + 'Preview(){\r\n'
                    + 'var li, urls = $("#nameImage' + newMaxId + '").val().split("|");\r\n'
                    + '$("#nameImage' + newMaxId + 'Preview").children().remove();\r\n'
                    + 'for (var i=0; i<urls.length; i++){\r\n'
                    + 'if (urls[i]!=""){\r\n'
                    + 'li = "<li><a href="+urls[i]+" url=\"+urls[i]+\" target=\\"_blank\\"><img src=\"+urls[i]+\" url=\"+urls[i]+\" style=\\"max-width:200px;max-height:200px;_height:200px;border:0;padding:3px;width: 180px;height: 170px;\\">"+"</a>";\r\n'
                    + 'li += "&nbsp;&nbsp;<a href=\\"javascript:\\" onclick=\\"nameImage' + newMaxId + 'Del(this);\\">×</a></li>";\r\n'
                    + '$("#nameImage' + newMaxId + 'Preview").append(li);\r\n'
                    + '}\r\n'
                    + '}\r\n'
                    + 'if ($("#nameImage' + newMaxId + 'Preview").text() == ""){\r\n'
                    + '$("#nameImage' + newMaxId + 'Preview").html("<li style=\'list-style:none;padding-top:5px;\'>无</li>");\r\n'
                    + '}\r\n'
                    + '}\r\n'
                    + 'nameImage' + newMaxId + 'Preview();\r\n'
                    + '<\/script>\r\n'
                    + '</td>'

                    + '<td>'
                    + '<input id="nameImage' + newMaxId + '" name="customerConsignersList[' + newMaxId + '].idCardImgBook" type="hidden" >'
                    + '<ol id="nameImage' + newMaxId + 'Preview"><li style="list-style:none;padding-top:5px;">无</li></ol>'
                    + '<a href="javascript:" onclick="nameImage' + newMaxId + 'FinderOpen();" class="btn" id="limitAdd">添加</a>&nbsp;<a href="javascript:" onclick="nameImage' + newMaxId + 'DelAll();" class="btn">清除</a>'
                    + '<script type="text/javascript">'
                    + 'function nameImage' + newMaxId + 'FinderOpen(){\r\n'
                    + 'var date = new Date(), year = date.getFullYear(), month = (date.getMonth()+1)>9?date.getMonth()+1:"0"+(date.getMonth()+1);\r\n'
                    + 'var url = "${ctxStatic}/ckfinder/ckfinder.html?type=images&start=images:/photo/customer/consigner/"+year+"/"+month+'
                    + '"/&action=js&func=nameImage' + newMaxId + 'SelectAction&thumbFunc=nameImage' + newMaxId + 'ThumbSelectAction&cb=nameImage' + newMaxId + 'Callback&dts=0&sm=1";\r\n'
                    + 'windowOpen(url,"文件管理",1000,700);\r\n'
                    + '}\r\n'
                    + 'function nameImage' + newMaxId + 'SelectAction(fileUrl, data, allFiles){\r\n'
                    + 'var url="", files=ckfinderAPI.getSelectedFiles();\r\n'
                    + 'for(var i=0; i<files.length; i++){\r\n'
                    + 'url += files[i].getUrl();\r\n'
                    + 'if (i<files.length-1) url+="|";\r\n'
                    + '}\r\n'
                    + '$("#nameImage' + newMaxId + '").val($("#nameImage' + newMaxId + '").val()+($("#nameImage' + newMaxId + '").val(url)==""?url:"|"+url));\r\n'
                    + 'nameImage' + newMaxId + 'Preview();\r\n'
                    + '}\r\n'
                    + 'function nameImage' + newMaxId + 'ThumbSelectAction(fileUrl, data, allFiles){\r\n'
                    + 'var url="", files=ckfinderAPI.getSelectedFiles();\r\n'
                    + 'for(var i=0; i<files.length; i++){\r\n'
                    + 'url += files[i].getThumbnailUrl();\r\n'
                    + 'if (i<files.length-1) url+="|";\r\n'
                    + '}\r\n'
                    + '$("#nameImage' + newMaxId + '").val($("#nameImage' + newMaxId + '").val()+($("#nameImage' + newMaxId + '").val(url)==""?url:"|"+url));\r\n'
                    + 'nameImage' + newMaxId + 'Preview();\r\n'
                    + '}\r\n'
                    + 'function nameImage' + newMaxId + 'Callback(api){\r\n'
                    + 'ckfinderAPI = api;\r\n'
                    + '}\r\n'
                    + 'function nameImage' + newMaxId + 'Del(obj){\r\n'
                    + 'var url = $(obj).prev().attr("url");\r\n'
                    + '$("#nameImage' + newMaxId + '").val($("#nameImage' + newMaxId + '").val().replace("|"+url,"","").replace(url+"|","","").replace(url,"",""));\r\n'
                    + 'nameImage' + newMaxId + 'Preview();\r\n'
                    + '}\r\n'
                    + 'function nameImage' + newMaxId + 'DelAll(){\r\n'
                    + '$("#nameImage' + newMaxId + '").val("");\r\n'
                    + 'nameImage' + newMaxId + 'Preview();\r\n'
                    + '}\r\n'
                    + 'function nameImage' + newMaxId + 'Preview(){\r\n'
                    + 'var li, urls = $("#nameImage' + newMaxId + '").val().split("|");\r\n'
                    + '$("#nameImage' + newMaxId + 'Preview").children().remove();\r\n'
                    + 'for (var i=0; i<urls.length; i++){\r\n'
                    + 'if (urls[i]!=""){\r\n'
                    + 'li = "<li><a href="+urls[i]+" url=\"+urls[i]+\" target=\\"_blank\\"><img src=\"+urls[i]+\" url=\"+urls[i]+\" style=\\"max-width:200px;max-height:200px;_height:200px;border:0;padding:3px;width: 180px;height: 170px;\\">"+"</a>";\r\n'
                    + 'li += "&nbsp;&nbsp;<a href=\\"javascript:\\" onclick=\\"nameImage' + newMaxId + 'Del(this);\\">×</a></li>";\r\n'
                    + '$("#nameImage' + newMaxId + 'Preview").append(li);\r\n'
                    + '}\r\n'
                    + '}\r\n'
                    + 'if ($("#nameImage' + newMaxId + 'Preview").text() == ""){\r\n'
                    + '$("#nameImage' + newMaxId + 'Preview").html("<li style=\'list-style:none;padding-top:5px;\'>无</li>");\r\n'
                    + '}\r\n'
                    + '}\r\n'
                    + 'nameImage' + newMaxId + 'Preview();\r\n'
                    + '<\/script>\r\n'
                    + '</td>'

                    + '<td>'
                    + '<select class="table-form-control" name="customerConsignersList[' + newMaxId + '].stopFlag">'
                    + '<c:forEach items="${fns:getDictList('stop_flag')}" var="dict" varStatus="idx">'
                    + '<option value="${dict.value}">${dict.label}</option>'
                    + '</c:forEach>'
                    + '</select>'
                    + '</td>'

                    + '<td>'
                    + '<input type="text" class="table-form-control" name="customerConsignersList[' + newMaxId + '].remarks" value="" valid="text"/>'
                    + '</td>'

                    + '<td>'
                    + '<a href="javascript:void(0)" class="btnDel" onclick="oper.consigner.del(' + newMaxId + ');">删除</a>'
                    + '</td>'
                    + '</tr>';
                var html = trStr;
                return html;
            }
        },
        document: {
            socpName: "document_",
            add: function () {
                if ($("input[name='itemDocumentTemplateId']") && $("input[name='itemDocumentTemplateId']").length != 0) {
                    var itemDocumentTemplateId = [];
                    $("input[name='itemDocumentTemplateId']").each(function () {
                        itemDocumentTemplateId.push(parseInt($(this).val()));
                    });
                    if (itemDocumentTemplateId.length != 0) {
                        var maxId = Math.max.apply(null, itemDocumentTemplateId);
                        if (maxId != undefined) {
                            var newMaxId = maxId + 1;
                            var html = this.appendHtml(newMaxId);
                            $("#" + oper.document.socpName + "tr_" + maxId).after(html);
                        }
                    }
                } else {
                    var newMaxId = 0;
                    var html = this.appendHtml(newMaxId);
                    $("#" + this.socpName + "contentField").html(html);
                }
            },
            del: function (itemDocumentTemplateId, entityId) {
                if (entityId) {
                    var url = "${ctx}/customer/customerDocumentTemplate/delete";
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
                                        $("#" + this.socpName + "tr_" + itemDocumentTemplateId).remove();
                                    }
                                }
                            })
                        }
                    });
                } else {
                    $("#" + this.socpName + "tr_" + itemDocumentTemplateId).remove();
                }
            },
            appendHtml: function (newMaxId) {
                var trStr = '<tr id="' + this.socpName + 'tr_' + newMaxId + '">'
                    + '<td>'
                    + '<input type="hidden" name="itemDocumentTemplateId" value="' + newMaxId + '"/>'
                    + '<input type="hidden" name="customerDocumentTemplatesList[' + newMaxId + '].id" value=""/>'
                    + '<input type="text" class="table-form-control" name="customerConsignersList[' + newMaxId + '].name" value="" valid="vtext"/>'
                    + '</td>'

                    + '<td>'
                    + '<input type="text" class="table-form-control" name="customerDocumentTemplatesList[' + newMaxId + '].certCode" value="" valid="vtext"/>'
                    + '</td>'

                    + '<td>'
                    + '<input type="text" class="table-form-control" name="customerDocumentTemplatesList[' + newMaxId + '].issuingOrgan" value="" valid="text"/>'
                    + '</td>'

                    + '<td>'
                    + '<input type="text" name="customerConsignersList[' + newMaxId + '].consignerVali" value="" value="" valid="vtext" readonly="readonly" maxlength="20" class="input-medium Wdate"  '
                    + 'pattern="yyyy-MM-dd" onclick="WdatePicker({dateFmt:\'yyyy-MM-dd\',isShowClear:false});"/>'
                    + '</td>'

                    + '<td>'
                    + '<input type="text" name="customerConsignersList[' + newMaxId + '].consignerVali" value="" value="" valid="vtext" readonly="readonly" maxlength="20" class="input-medium Wdate"  '
                    + 'pattern="yyyy-MM-dd" onclick="WdatePicker({dateFmt:\'yyyy-MM-dd\',isShowClear:false});"/>'
                    + '</td>'

                    + '<td>'
                    + '<input id="nameImage' + newMaxId + '" name="customerConsignersList[' + newMaxId + '].idCardImgBook" type="hidden" >'
                    + '<ol id="nameImage' + newMaxId + 'Preview"><li style="list-style:none;padding-top:5px;">无</li></ol>'
                    + '<a href="javascript:" onclick="nameImage' + newMaxId + 'FinderOpen();" class="btn" id="limitAdd">添加</a>&nbsp;<a href="javascript:" onclick="nameImage' + newMaxId + 'DelAll();" class="btn">清除</a>'
                    + '<script type="text/javascript">'
                    + 'function nameImage' + newMaxId + 'FinderOpen(){\r\n'
                    + 'var date = new Date(), year = date.getFullYear(), month = (date.getMonth()+1)>9?date.getMonth()+1:"0"+(date.getMonth()+1);\r\n'
                    + 'var url = "${ctxStatic}/ckfinder/ckfinder.html?type=images&start=images:/photo/customer/consigner/"+year+"/"+month+'
                    + '"/&action=js&func=nameImage' + newMaxId + 'SelectAction&thumbFunc=nameImage' + newMaxId + 'ThumbSelectAction&cb=nameImage' + newMaxId + 'Callback&dts=0&sm=1";\r\n'
                    + 'windowOpen(url,"文件管理",1000,700);\r\n'
                    + '}\r\n'
                    + 'function nameImage' + newMaxId + 'SelectAction(fileUrl, data, allFiles){\r\n'
                    + 'var url="", files=ckfinderAPI.getSelectedFiles();\r\n'
                    + 'for(var i=0; i<files.length; i++){\r\n'
                    + 'url += files[i].getUrl();\r\n'
                    + 'if (i<files.length-1) url+="|";\r\n'
                    + '}\r\n'
                    + '$("#nameImage' + newMaxId + '").val($("#nameImage' + newMaxId + '").val()+($("#nameImage' + newMaxId + '").val(url)==""?url:"|"+url));\r\n'
                    + 'nameImage' + newMaxId + 'Preview();\r\n'
                    + '}\r\n'
                    + 'function nameImage' + newMaxId + 'ThumbSelectAction(fileUrl, data, allFiles){\r\n'
                    + 'var url="", files=ckfinderAPI.getSelectedFiles();\r\n'
                    + 'for(var i=0; i<files.length; i++){\r\n'
                    + 'url += files[i].getThumbnailUrl();\r\n'
                    + 'if (i<files.length-1) url+="|";\r\n'
                    + '}\r\n'
                    + '$("#nameImage' + newMaxId + '").val($("#nameImage' + newMaxId + '").val()+($("#nameImage' + newMaxId + '").val(url)==""?url:"|"+url));\r\n'
                    + 'nameImage' + newMaxId + 'Preview();\r\n'
                    + '}\r\n'
                    + 'function nameImage' + newMaxId + 'Callback(api){\r\n'
                    + 'ckfinderAPI = api;\r\n'
                    + '}\r\n'
                    + 'function nameImage' + newMaxId + 'Del(obj){\r\n'
                    + 'var url = $(obj).prev().attr("url");\r\n'
                    + '$("#nameImage' + newMaxId + '").val($("#nameImage' + newMaxId + '").val().replace("|"+url,"","").replace(url+"|","","").replace(url,"",""));\r\n'
                    + 'nameImage' + newMaxId + 'Preview();\r\n'
                    + '}\r\n'
                    + 'function nameImage' + newMaxId + 'DelAll(){\r\n'
                    + '$("#nameImage' + newMaxId + '").val("");\r\n'
                    + 'nameImage' + newMaxId + 'Preview();\r\n'
                    + '}\r\n'
                    + 'function nameImage' + newMaxId + 'Preview(){\r\n'
                    + 'var li, urls = $("#nameImage' + newMaxId + '").val().split("|");\r\n'
                    + '$("#nameImage' + newMaxId + 'Preview").children().remove();\r\n'
                    + 'for (var i=0; i<urls.length; i++){\r\n'
                    + 'if (urls[i]!=""){\r\n'
                    + 'li = "<li><a href="+urls[i]+" url=\"+urls[i]+\" target=\\"_blank\\"><img src=\"+urls[i]+\" url=\"+urls[i]+\" style=\\"max-width:200px;max-height:200px;_height:200px;border:0;padding:3px;width: 180px;height: 170px;\\">"+"</a>";\r\n'
                    + 'li += "&nbsp;&nbsp;<a href=\\"javascript:\\" onclick=\\"nameImage' + newMaxId + 'Del(this);\\">×</a></li>";\r\n'
                    + '$("#nameImage' + newMaxId + 'Preview").append(li);\r\n'
                    + '}\r\n'
                    + '}\r\n'
                    + 'if ($("#nameImage' + newMaxId + 'Preview").text() == ""){\r\n'
                    + '$("#nameImage' + newMaxId + 'Preview").html("<li style=\'list-style:none;padding-top:5px;\'>无</li>");\r\n'
                    + '}\r\n'
                    + '}\r\n'
                    + 'nameImage' + newMaxId + 'Preview();\r\n'
                    + '<\/script>\r\n'
                    + '</td>'

                    + '<td>'
                    + '<input type="text" class="table-form-control" name="customerDocumentTemplatesList[' + newMaxId + '].remarks" value="" valid="text"/>'
                    + '</td>'
                    + '<td>'
                    + '<a href="javascript:void(0)" class="btnDel" onclick="oper.document.del(' + newMaxId + ');">删除</a>'
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
