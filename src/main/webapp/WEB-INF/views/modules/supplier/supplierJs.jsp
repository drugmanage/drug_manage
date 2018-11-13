<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/12
  Time: 0:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<script type="application/javascript">
    var supOper = {
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
                            $("#" + this.socpName + "tr_" + maxId).after(html);
                        }
                    }
                } else {
                    var newMaxId = 0;
                    var html = this.appendHtml(newMaxId);
                    $("#" + supOper.consigner.socpName + "contentField").html(html);
                }
            },
            del: function (itemEduId, entityId) {
                if (entityId) {
                    var url = "${ctx}/supplier/supplierConsigner/delete";
                    tips = "确定删除供应商委托人信息？";
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
                                        $("#" + supOper.consigner.socpName + "tr_" + itemEduId).remove();
                                    }
                                }
                            })
                        }
                    });
                } else {
                    $("#" + this.socpName + "tr_" + itemEduId).remove();
                }
            },
            appendHtml: function (newMaxId) {
                var proxyBookImgPath = "proxyBookImgPath" + newMaxId;
                var idCardImgPath = "idCardImgPath" + newMaxId;
                var trStr = '<tr id="' + this.socpName + 'tr_' + newMaxId + '">'
                    + '<td>'
                    + '<input type="hidden"  name="itemConsignerId" value="' + newMaxId + '"/>'
                    + '<input type="hidden"  name="supplierConsignerList[' + newMaxId + '].id" value=""/>'
                    + '<input type="text" class="table-form-control" name="supplierConsignerList[' + newMaxId + '].contactsName" value="" valid="vtext"/>'
                    + '</td>'
                    + '<td>'
                    + '<select class="table-form-control" name="supplierConsignerList[' + newMaxId + '].sex">'
                    + '<c:forEach items="${fns:getDictList('sex')}" var="dict" varStatus="idx">'
                    + '<option value="${dict.value}"  >${dict.label}</option>'
                    + '</c:forEach>'
                    + '</select>'
                    + '</td>'
                    + '<td>'
                    + '<input type="text" class="table-form-control" name="supplierConsignerList[' + newMaxId + '].phone" value="" valid="vnum"/>'
                    + '</td>'
                    + '<td>'
                    + '<input type="text" class="table-form-control" name="supplierConsignerList[' + newMaxId + '].certNumber" value="" valid="vnum"/>'
                    + '</td>'
                    + '<td>'
                    + '<input type="text" name="supplierConsignerList[' + newMaxId + '].consignerVali" value="" valid="vtext" readonly="readonly" maxlength="20" class="table-form-control Wdate"  '
                    + 'pattern="yyyy-MM-dd" onclick="WdatePicker({dateFmt:\'yyyy-MM-dd\',isShowClear:false});"/>'
                    + '</td>'
                    + '<td>'
                    + '<input type="text" class="table-form-control" name="supplierConsignerList[' + newMaxId + '].proxyBook" value="" valid="vnum"/>'
                    + '</td>'
                    + '<td>'
                    + '<input type="text" name="supplierConsignerList[' + newMaxId + '].proxyBookVali" value="" valid="vtext" readonly="readonly" maxlength="20" class="table-form-control Wdate"  '
                    + 'pattern="yyyy-MM-dd" onclick="WdatePicker({dateFmt:\'yyyy-MM-dd\',isShowClear:false});"/>'
                    + '</td>'
                    + '<td>'
                    + '<input type="checkbox" class="table-form-control" name="supplierConsignerList[' + newMaxId + '].stopFlag" value="1" />'
                    + '<td>'
                    + '<input id="nameImage' + proxyBookImgPath + '" name="supplierConsignerList[' + newMaxId + '].proxyBookImgPath" type="hidden" >'
                    + getCKFinderHtml(proxyBookImgPath, "supplier/consigner")
                    + '</td>'
                    + '<td>'
                    + '<input id="nameImage' + idCardImgPath + '" name="supplierConsignerList[' + newMaxId + '].idCardImgPath" type="hidden" >'
                    + getCKFinderHtml(idCardImgPath, "supplier/consigner")
                    + '</td>'
                    + '<td>'
                    + '<a href="javascript:void(0)" class="btnDel" onclick="supOper.consigner.del(' + newMaxId + ');">删除</a>'
                    + '</td>'
                    + '</tr>';
                var html = trStr;
                return html;
            }
        },
        invoice: {
            socpName: "invoice_",
            //供应商开票信息页面
            add: function () {
                if ($("input[name='itemInvoiceId']") && $("input[name='itemInvoiceId']").length != 0) {
                    var itemInvoiceId = [];
                    $("input[name='itemInvoiceId']").each(function () {
                        itemInvoiceId.push(parseInt($(this).val()));
                    });
                    if (itemInvoiceId.length != 0) {
                        var maxId = Math.max.apply(null, itemInvoiceId);
                        if (maxId != undefined) {
                            var newMaxId = maxId + 1;
                            var html = this.appendHtml(newMaxId);
                            $("#" + this.socpName + "tr_" + maxId).after(html);
                        }
                    }
                } else {
                    var newMaxId = 0;
                    var html = this.appendHtml(newMaxId);
                    $("#" + this.socpName + "contentField").html(html);
                }
            },
            del: function (itemWorkId, entityId) {
                if (entityId) {
                    var url = "${ctx}/supplier/supplierInvoiceInfo/delete";
                    tips = "确定删除供应商开票信息信息？";
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
                                        $("#" + supOper.invoice.socpName + "tr_" + itemWorkId).remove();
                                    }
                                }
                            })
                        }
                    });
                } else {
                    $("#" + this.socpName + "tr_" + itemWorkId).remove();
                }
            },
            appendHtml: function (newMaxId) {
                var invoicePath = "invoicePath" + newMaxId;
                var areaName ="invoiceArea"+newMaxId;
                var trStr = '<tr id="' + this.socpName + 'tr_' + newMaxId + '">'
                    + '<td>'
                    + '<input type="hidden" name="itemInvoiceId" value="' + newMaxId + '"/>'
                    + '<input type="hidden" name="supplierInvoiceInfoList[' + newMaxId + '].id" value=""/>'
                    + '<input type="text" class="table-form-control" name="supplierInvoiceInfoList[' + newMaxId + '].accountName" value="" valid="vtext"/>'
                    + '</td>'

                    + '<td>'
                    + '<select class="table-form-control" name="supplierInvoiceInfoList[' + newMaxId + '].bankDeposit">'
                    + '<c:forEach items="${fns:getDictList('bank')}" var="dict" varStatus="idx">'
                    + '<option value="${dict.value}"  >${dict.label}</option>'
                    + '</c:forEach>'
                    + '</select>'
                    + '</td>'

                    + '<td>'
                    + '<input id="' + areaName + 'Id" name="supplierInvoiceInfoList[' + newMaxId + '].area.id" class="table-form-control" type="hidden" value="">'
                    + '<input id="' + areaName + 'Name" name="supplierInvoiceInfoList[' + newMaxId + '].area.name" readonly="readonly" type="text" value="" data-msg-required="" class="input-medium" style="">'
                    + getAreaHtml(areaName)
                    + '</td>'

                    + '<td>'
                    + ' <input type="text" class="table-form-control" name="supplierInvoiceInfoList[' + newMaxId + '].detailAddress" value="" valid="vtext"/>'
                    + '</td>'
                    + '<td>'
                    + '<input type="text" class="table-form-control" name="supplierInvoiceInfoList[' + newMaxId + '].phone" value="" valid="vtext"/>'
                    + '</td>'
                    + '<td>'
                    + '<input type="text" class="table-form-control" name="supplierInvoiceInfoList[' + newMaxId + '].accountNumber" value="" valid="vnum"/>'
                    + '</td>'
                    + '<td>'
                    + '<input type="text" class="table-form-control" name="supplierInvoiceInfoList[' + newMaxId + '].dutyParagraph" value="" valid="vnum"/>'
                    + '</td>'
                    + '<td>'
                    + '<input type="checkbox" class="table-form-control" name="supplierInvoiceInfoList[' + newMaxId + '].stopFlag" value="1" />'
                    + '</td>'

                    + '<td>'
                    + '<input id="nameImage' + invoicePath + '" name="supplierInvoiceInfoList[' + newMaxId + '].invoicePath" type="hidden" >'
                    + getCKFinderHtml(invoicePath, "supplier/invoice")
                    + '</td>'

                    + '<td>'
                    + '<a href="javascript:void(0)" class="btnDel" onclick="supOper.invoice.del(' + newMaxId + ');">删除</a>'
                    + '</td>'
                    + '</tr>';
                var html = trStr;
                return html;
            }
        },
        docTemp: {
            socpName: "docTemp_",
            //工作经历页面
            add: function () {
                if ($("input[name='itemDocTempId']") && $("input[name='itemDocTempId']").length != 0) {
                    var itemDocTempId = [];
                    $("input[name='itemDocTempId']").each(function () {
                        itemDocTempId.push(parseInt($(this).val()));
                    });
                    if (itemDocTempId.length != 0) {
                        var maxId = Math.max.apply(null, itemDocTempId);
                        if (maxId != undefined) {
                            var newMaxId = maxId + 1;
                            var html = this.appendHtml(newMaxId);
                            $("#" + this.socpName + "tr_" + maxId).after(html);
                        }
                    }
                } else {
                    var newMaxId = 0;
                    var html = this.appendHtml(newMaxId);
                    $("#" + this.socpName + "contentField").html(html);
                }
            },
            del: function (itemWorkId, entityId) {
                if (entityId) {
                    var url = "${ctx}/supplier/supplierDocumentTemplate/delete";
                    tips = "确定删除供应商证件模板信息？";
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
                                        $("#" + supOper.docTemp.socpName + "tr_" + itemWorkId).remove();
                                    }
                                }
                            })
                        }
                    });
                } else {
                    $("#" + this.socpName + "tr_" + itemWorkId).remove();
                }
            },
            appendHtml: function (newMaxId) {
                var imgPath="imgPath"+newMaxId;
                var trStr = '<tr id="' + this.socpName + 'tr_' + newMaxId + '">'

                    + '<td>'
                    + '<input type="hidden" name="itemDocTempId" value="' + newMaxId + '"/>'
                    + '<input type="hidden" name="supplierDocumentTemplateList[' + newMaxId + '].id" value=""/>'
                    + '<input type="text" class="table-form-control" name="supplierDocumentTemplateList[' + newMaxId + '].name" value="" valid="vtext"/>'
                    + '</td>'
                    + '<td>'
                    + '<input type="text" class="table-form-control" name="supplierDocumentTemplateList[' + newMaxId + '].certCode" value="" valid="vtext">'
                    + '</td>'
                    + '<td>'
                    + '<input type="text" class="table-form-control" name="supplierDocumentTemplateList[' + newMaxId + '].issuingOrgan"  value="" valid="vtext"/>'
                    + '</td>'
                    + '<td>'
                    + '<input type="text" name="supplierDocumentTemplateList[' + newMaxId + '].dateIssue" value="" value="" valid="vtext" readonly="readonly" maxlength="20" class="input-medium Wdate"  '
                    + 'pattern="yyyy-MM-dd" onclick="WdatePicker({dateFmt:\'yyyy-MM-dd\',isShowClear:false});"/>'
                    + '</td>'
                    + '<td>'
                    + '<input type="text" name="supplierDocumentTemplateList[' + newMaxId + '].validityDate" value="" value="" valid="vtext" readonly="readonly" maxlength="20" class="input-medium Wdate"  '
                    + 'pattern="yyyy-MM-dd" onclick="WdatePicker({dateFmt:\'yyyy-MM-dd\',isShowClear:false});"/>'
                    + '</td>'
                    + '<td>'
                    + '<input id="nameImage' + imgPath + '" name="supplierDocumentTemplateList[' + newMaxId + '].imgPath" type="hidden" >'
                    + getCKFinderHtml(imgPath, "supplier/documentTemplate")
                    + '</td>'
                    + '<td>'
                    + '<a href="javascript:void(0)" class="btnDel" onclick="supOper.docTemp.del(' + newMaxId + ');">删除</a>'
                    + '</td>'
                    + '</tr>';
                var html = trStr;
                return html;
            }
        },
        bank: {
            socpName: "bank_",
            //银行信息页面
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
                            $("#" + supOper.bank.socpName + "tr_" + maxId).after(html);
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
                    var url = "${ctx}/supplier/supplierBank/delete";
                    tips = "确定删除银行信息吗？";
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
                                        $("#" + supOper.bank.socpName + "tr_" + itemBankId).remove();
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
                    + '<input type="hidden" name="supplierBankList[' + newMaxId + '].id" value=""/>'
                    + '<input type="text" class="table-form-control" name="supplierBankList[' + newMaxId + '].openAccountName" value="" valid="vtext"/>'
                    + '</td>'
                    + '<td>'
                    + '<select class="table-form-control" name="supplierBankList[' + newMaxId + '].bank">'
                    + '<c:forEach items="${fns:getDictList('bank')}" var="dict" varStatus="idx">'
                    + '<option value="${dict.value}"  >${dict.label}</option>'
                    + '</c:forEach>'
                    + '</select>'
                    + '</td>'
                    + '<td>'
                    + '<input type="text" class="table-form-control" name="supplierBankList[' + newMaxId + '].bankNumber" value="" valid="vtext"/>'
                    + '</td>'
                    + '<td>'
                    + '<input type="text" class="table-form-control" name="supplierBankList[' + newMaxId + '].idCard" value="" valid="vtext"/>'
                    + '</td>'
                    + '<td>'
                    + '<input type="checkbox" class="table-form-control" name="supplierBankList[' + newMaxId + '].stopFlag" value="1" />'
                    + '</td>'

                    + '<td>'

                    + '<input id="nameImage' + frontUploadId + '" name="supplierBankList[' + newMaxId + '].positivePhoto" type="hidden" >'
                    + '<ol id="nameImage' + frontUploadId + 'Preview"><li style="list-style:none;padding-top:5px;">无</li></ol>'

                    + '<a href="javascript:" onclick="nameImage' + frontUploadId + 'FinderOpen();" class="btn" id="limitAdd">添加</a>&nbsp;<a href="javascript:" onclick="nameImage' + frontUploadId + 'DelAll();" class="btn">清除</a>'
                    + '<script type="text/javascript">'
                    + 'function nameImage' + frontUploadId + 'FinderOpen(){\r\n'
                    + 'var date = new Date(), year = date.getFullYear(), month = (date.getMonth()+1)>9?date.getMonth()+1:"0"+(date.getMonth()+1);\r\n'
                    + 'var url = "${ctxStatic}/ckfinder/ckfinder.html?type=images&start=images:/photo/supplier/bank/"+year+"/"+month+'
                    + '"/&action=js&func=nameImage' + frontUploadId + 'SelectAction&thumbFunc=nameImage' + frontUploadId + 'ThumbSelectAction&cb=nameImage' + frontUploadId + 'Callback&dts=0&sm=1";\r\n'
                    + 'windowOpen(url,"文件管理",1000,700);\r\n'
                    + '}\r\n'
                    + 'function nameImage' + frontUploadId + 'SelectAction(fileUrl, data, allFiles){\r\n'
                    + 'var url="", files=ckfinderAPI.getSelectedFiles();\r\n'
                    + 'for(var i=0; i<files.length; i++){\r\n'
                    + 'url += files[i].getUrl();\r\n'
                    + 'if (i<files.length-1) url+="|";\r\n'
                    + '}\r\n'
                    + '$("#nameImage' + frontUploadId + '").val($("#nameImage' + frontUploadId + '").val()+($("#nameImage' + frontUploadId + '").val(url)==""?url:"|"+url));\r\n'
                    + 'nameImage' + frontUploadId + 'Preview();\r\n'
                    + '}\r\n'
                    + 'function nameImage' + frontUploadId + 'ThumbSelectAction(fileUrl, data, allFiles){\r\n'
                    + 'var url="", files=ckfinderAPI.getSelectedFiles();\r\n'
                    + 'for(var i=0; i<files.length; i++){\r\n'
                    + 'url += files[i].getThumbnailUrl();\r\n'
                    + 'if (i<files.length-1) url+="|";\r\n'
                    + '}\r\n'
                    + '$("#nameImage' + frontUploadId + '").val($("#nameImage' + frontUploadId + '").val()+($("#nameImage' + frontUploadId + '").val(url)==""?url:"|"+url));\r\n'
                    + 'nameImage' + frontUploadId + 'Preview();\r\n'
                    + '}\r\n'
                    + 'function nameImage' + frontUploadId + 'Callback(api){\r\n'
                    + 'ckfinderAPI = api;\r\n'
                    + '}\r\n'
                    + 'function nameImage' + frontUploadId + 'Del(obj){\r\n'
                    + 'var url = $(obj).prev().attr("url");\r\n'
                    + '$("#nameImage' + frontUploadId + '").val($("#nameImage' + frontUploadId + '").val().replace("|"+url,"","").replace(url+"|","","").replace(url,"",""));\r\n'
                    + 'nameImage' + frontUploadId + 'Preview();\r\n'
                    + '}\r\n'
                    + 'function nameImage' + frontUploadId + 'DelAll(){\r\n'
                    + '$("#nameImage' + frontUploadId + '").val("");\r\n'
                    + 'nameImage' + frontUploadId + 'Preview();\r\n'
                    + '}\r\n'

                    + 'function nameImage' + frontUploadId + 'Preview(){\r\n'
                    + 'var li, urls = $("#nameImage' + frontUploadId + '").val().split("|");\r\n'
                    + '$("#nameImage' + frontUploadId + 'Preview").children().remove();\r\n'
                    + 'for (var i=0; i<urls.length; i++){\r\n'
                    + 'if (urls[i]!=""){\r\n'
                    + 'li = "<li><a href="+urls[i]+" url=\"+urls[i]+\" target=\\"_blank\\"><img src=\"+urls[i]+\" url=\"+urls[i]+\" style=\\"max-width:200px;max-height:200px;_height:200px;border:0;padding:3px;width: 180px;height: 170px;\\">"+"</a>";\r\n'
                    + 'li += "&nbsp;&nbsp;<a href=\\"javascript:\\" onclick=\\"nameImage' + frontUploadId + 'Del(this);\\">×</a></li>";\r\n'
                    + '$("#nameImage' + frontUploadId + 'Preview").append(li);\r\n'
                    + '}\r\n'
                    + '}\r\n'
                    + 'if ($("#nameImage' + frontUploadId + 'Preview").text() == ""){\r\n'
                    + '$("#nameImage' + frontUploadId + 'Preview").html("<li style=\'list-style:none;padding-top:5px;\'>无</li>");\r\n'
                    + '}\r\n'
                    + '}\r\n'
                    + 'nameImage' + frontUploadId + 'Preview();\r\n'
                    + '<\/script>\r\n'
                    + '</td>'
                    + '<td>'
                    + '<input id="nameImage' + backUploadId + '" name="supplierBankList[' + newMaxId + '].backPhoto" type="hidden" >'
                    + '<ol id="nameImage' + backUploadId + 'Preview"><li style="list-style:none;padding-top:5px;">无</li></ol>'

                    + '<a href="javascript:" onclick="nameImage' + backUploadId + 'FinderOpen();" class="btn" id="limitAdd">添加</a>&nbsp;<a href="javascript:" onclick="nameImage' + backUploadId + 'DelAll();" class="btn">清除</a>'
                    + '<script type="text/javascript">'
                    + 'function nameImage' + backUploadId + 'FinderOpen(){\r\n'
                    + 'var date = new Date(), year = date.getFullYear(), month = (date.getMonth()+1)>9?date.getMonth()+1:"0"+(date.getMonth()+1);\r\n'
                    + 'var url = "${ctxStatic}/ckfinder/ckfinder.html?type=images&start=images:/photo/supplier/bank/"+year+"/"+month+'
                    + '"/&action=js&func=nameImage' + backUploadId + 'SelectAction&thumbFunc=nameImage' + backUploadId + 'ThumbSelectAction&cb=nameImage' + backUploadId + 'Callback&dts=0&sm=1";\r\n'
                    + 'windowOpen(url,"文件管理",1000,700);\r\n'
                    + '}\r\n'
                    + 'function nameImage' + backUploadId + 'SelectAction(fileUrl, data, allFiles){\r\n'
                    + 'var url="", files=ckfinderAPI.getSelectedFiles();\r\n'
                    + 'for(var i=0; i<files.length; i++){\r\n'
                    + 'url += files[i].getUrl();\r\n'
                    + 'if (i<files.length-1) url+="|";\r\n'
                    + '}\r\n'
                    + '$("#nameImage' + backUploadId + '").val($("#nameImage' + backUploadId + '").val()+($("#nameImage' + backUploadId + '").val(url)==""?url:"|"+url));\r\n'
                    + 'nameImage' + backUploadId + 'Preview();\r\n'
                    + '}\r\n'
                    + 'function nameImage' + backUploadId + 'ThumbSelectAction(fileUrl, data, allFiles){\r\n'
                    + 'var url="", files=ckfinderAPI.getSelectedFiles();\r\n'
                    + 'for(var i=0; i<files.length; i++){\r\n'
                    + 'url += files[i].getThumbnailUrl();\r\n'
                    + 'if (i<files.length-1) url+="|";\r\n'
                    + '}\r\n'
                    + '$("#nameImage' + backUploadId + '").val($("#nameImage' + backUploadId + '").val()+($("#nameImage' + backUploadId + '").val(url)==""?url:"|"+url));\r\n'
                    + 'nameImage' + backUploadId + 'Preview();\r\n'
                    + '}\r\n'
                    + 'function nameImage' + backUploadId + 'Callback(api){\r\n'
                    + 'ckfinderAPI = api;\r\n'
                    + '}\r\n'
                    + 'function nameImage' + backUploadId + 'Del(obj){\r\n'
                    + 'var url = $(obj).prev().attr("url");\r\n'
                    + '$("#nameImage' + backUploadId + '").val($("#nameImage' + backUploadId + '").val().replace("|"+url,"","").replace(url+"|","","").replace(url,"",""));\r\n'
                    + 'nameImage' + backUploadId + 'Preview();\r\n'
                    + '}\r\n'
                    + 'function nameImage' + backUploadId + 'DelAll(){\r\n'
                    + '$("#nameImage' + backUploadId + '").val("");\r\n'
                    + 'nameImage' + backUploadId + 'Preview();\r\n'
                    + '}\r\n'

                    + 'function nameImage' + backUploadId + 'Preview(){\r\n'
                    + 'var li, urls = $("#nameImage' + backUploadId + '").val().split("|");\r\n'
                    + '$("#nameImage' + backUploadId + 'Preview").children().remove();\r\n'
                    + 'for (var i=0; i<urls.length; i++){\r\n'
                    + 'if (urls[i]!=""){\r\n'
                    + 'li = "<li><a href="+urls[i]+" url=\"+urls[i]+\" target=\\"_blank\\"><img src=\"+urls[i]+\" url=\"+urls[i]+\" style=\\"max-width:200px;max-height:200px;_height:200px;border:0;padding:3px;width: 180px;height: 170px;\\">"+"</a>";\r\n'
                    + 'li += "&nbsp;&nbsp;<a href=\\"javascript:\\" onclick=\\"nameImage' + backUploadId + 'Del(this);\\">×</a></li>";\r\n'
                    + '$("#nameImage' + backUploadId + 'Preview").append(li);\r\n'
                    + '}\r\n'
                    + '}\r\n'
                    + 'if ($("#nameImage' + backUploadId + 'Preview").text() == ""){\r\n'
                    + '$("#nameImage' + backUploadId + 'Preview").html("<li style=\'list-style:none;padding-top:5px;\'>无</li>");\r\n'
                    + '}\r\n'
                    + '}\r\n'
                    + 'nameImage' + backUploadId + 'Preview();\r\n'
                    + '<\/script>\r\n'

                    + '</td>'
                    + '<td>'
                    + '<a href="javascript:void(0)" class="btnDel" onclick="supOper.bank.del(' + newMaxId + ');">删除</a>'
                    + '</td>'
                    + '</tr>';
                var html = trStr;
                return html;
            }
        },
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
                    $("#" + supOper.address.socpName + "contentField").html(html);
                }
            },
            del: function (itemAddressId, entityId) {
                if (entityId) {
                    var url = "${ctx}/supplier/supplierAddress/delete";
                    tips = "确定删除收货信息吗？";
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
                                        $("#" + supOper.address.socpName + "tr_" + itemAddressId).remove();
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
                var areaName ="area"+newMaxId;
                var trStr = '<tr id="' + this.socpName + 'tr_' + newMaxId + '">'
                    + '<td>'
                    + '<input type="hidden" name="itemAddressId" value="' + newMaxId + '"/>'
                    + '<input type="hidden" name="supplierAddressList[' + newMaxId + '].id" value=""/>'
                    + '<input type="text" class="table-form-control" name="supplierAddressList[' + newMaxId + '].receivingName" value="" valid="vtext"/>'
                    + '</td>'

                    + '<td>'
                    + '<input id="' + areaName + 'Id" name="supplierAddressList[' + newMaxId + '].area.id" class="" type="hidden" value="">'
                    + '<input id="' + areaName + 'Name" name="supplierAddressList[' + newMaxId + '].area.name" readonly="readonly" type="text" value="" data-msg-required="" class="input-medium" style="">'
                        + getAreaHtml(areaName)
                    + '</td>'

                    + '<td>'
                    + '<input type="text" class="table-form-control" name="supplierAddressList[' + newMaxId + '].receivingAddress" value="" valid="vtext"/>'
                    + '</td>'

                    + '<td>'
                    + '<input type="text" class="table-form-control" name="supplierAddressList[' + newMaxId + '].contactPhone" value="" valid="vnum"/>'
                    + '</td>'
                    + '<td>'
                    + '<input type="checkbox" class="table-form-control" name="supplierAddressList[' + newMaxId + '].stopFlag" value="1" />'
                    + '</td>'
                    + '<td>'
                    + '<a href="javascript:void(0)" class="btnDel" onclick="supOper.address.del(' + newMaxId + ');">删除</a>'
                    + '</td>'
                    + '</tr>';
                var html = trStr;
                return html;
            }
        }
    };

    function getAreaHtml(areaName) {
        var html = ''

            + '<a id="' + areaName + 'Button" href="javascript:" class="btn  " style="">&nbsp;<i class="icon-search"></i>&nbsp;</a>&nbsp;&nbsp;'

            + '<script type="text/javascript">\r\n'
            + '$("#' + areaName + 'Button, #' + areaName + 'Name").click(function(){ \r\n'
            + 'if ($("#' + areaName + 'Button").hasClass("disabled")){ return true; }\r\n'
            + 'top.$.jBox.open("iframe:/a/tag/treeselect?url="+encodeURIComponent("/sys/area/treeData")+"&module=&checked=&extId=&isAll=", "选择区域", 300, 420, {'
            + ' ajaxData:{selectIds: $("#' + areaName + 'Id").val()},buttons:{"确定":"ok", "关闭":true}, submit:function(v, h, f){ \r\n'
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
            + '$("#' + areaName + 'Id").val(ids.join(",").replace(/u_/ig,""));\r\n'
            + '$("#' + areaName + 'Name").val(names.join(","));\r\n'
            + '}\r\n'
            + 'else if (v=="clear"){\r\n'
            + '$("#' + areaName + 'Id").val("");\r\n'
            + '$("#' + areaName + 'Name").val("");\r\n'
            + '}\r\n'
            + 'if(typeof areaTreeselectCallBack == \'function\'){\r\n'
            + 'areaTreeselectCallBack(v, h, f);\r\n'
            + '}\r\n'
            + '}, loaded:function(h){\r\n'
            + '$(".jbox-content", top.document).css("overflow-y","hidden");\r\n'
            + '}\r\n'
            + '});\r\n'
            + '});\r\n'
            + '<\/script>';
        return html;
    }
    /**
     * 根据隐藏域中的id名称来进行生成脚本信息
     * @param name
     */
    function getCKFinderHtml(name, path) {
        var html = ""
            + '<ol id="nameImage' + name + 'Preview"><li style="list-style:none;padding-top:5px;">无</li></ol>'

            + '<a href="javascript:" onclick="nameImage' + name + 'FinderOpen();" class="btn" id="limitAdd">添加</a>&nbsp;<a href="javascript:" onclick="nameImage' + name + 'DelAll();" class="btn">清除</a>'
            + '<script type="text/javascript">'
            + 'function nameImage' + name + 'FinderOpen(){\r\n'
            + 'var date = new Date(), year = date.getFullYear(), month = (date.getMonth()+1)>9?date.getMonth()+1:"0"+(date.getMonth()+1);\r\n'
            + 'var url = "${ctxStatic}/ckfinder/ckfinder.html?type=images&start=images:/photo/' + path + '/"+year+"/"+month+'
            + '"/&action=js&func=nameImage' + name + 'SelectAction&thumbFunc=nameImage' + name + 'ThumbSelectAction&cb=nameImage' + name + 'Callback&dts=0&sm=1";\r\n'
            + 'windowOpen(url,"文件管理",1000,700);\r\n'
            + '}\r\n'
            + 'function nameImage' + name + 'SelectAction(fileUrl, data, allFiles){\r\n'
            + 'var url="", files=ckfinderAPI.getSelectedFiles();\r\n'
            + 'for(var i=0; i<files.length; i++){\r\n'
            + 'url += files[i].getUrl();\r\n'
            + 'if (i<files.length-1) url+="|";\r\n'
            + '}\r\n'
            + '$("#nameImage' + name + '").val($("#nameImage' + name + '").val()+($("#nameImage' + name + '").val(url)==""?url:"|"+url));\r\n'
            + 'nameImage' + name + 'Preview();\r\n'
            + '}\r\n'
            + 'function nameImage' + name + 'ThumbSelectAction(fileUrl, data, allFiles){\r\n'
            + 'var url="", files=ckfinderAPI.getSelectedFiles();\r\n'
            + 'for(var i=0; i<files.length; i++){\r\n'
            + 'url += files[i].getThumbnailUrl();\r\n'
            + 'if (i<files.length-1) url+="|";\r\n'
            + '}\r\n'
            + '$("#nameImage' + name + '").val($("#nameImage' + name + '").val()+($("#nameImage' + name + '").val(url)==""?url:"|"+url));\r\n'
            + 'nameImage' + name + 'Preview();\r\n'
            + '}\r\n'
            + 'function nameImage' + name + 'Callback(api){\r\n'
            + 'ckfinderAPI = api;\r\n'
            + '}\r\n'
            + 'function nameImage' + name + 'Del(obj){\r\n'
            + 'var url = $(obj).prev().attr("url");\r\n'
            + '$("#nameImage' + name + '").val($("#nameImage' + name + '").val().replace("|"+url,"","").replace(url+"|","","").replace(url,"",""));\r\n'
            + 'nameImage' + name + 'Preview();\r\n'
            + '}\r\n'
            + 'function nameImage' + name + 'DelAll(){\r\n'
            + '$("#nameImage' + name + '").val("");\r\n'
            + 'nameImage' + name + 'Preview();\r\n'
            + '}\r\n'

            + 'function nameImage' + name + 'Preview(){\r\n'
            + 'var li, urls = $("#nameImage' + name + '").val().split("|");\r\n'
            + '$("#nameImage' + name + 'Preview").children().remove();\r\n'
            + 'for (var i=0; i<urls.length; i++){\r\n'
            + 'if (urls[i]!=""){\r\n'
            + 'li = "<li><a href="+urls[i]+" url=\"+urls[i]+\" target=\\"_blank\\"><img src=\"+urls[i]+\" url=\"+urls[i]+\" style=\\"max-width:200px;max-height:200px;_height:200px;border:0;padding:3px;width: 180px;height: 170px;\\">"+"</a>";\r\n'
            + 'li += "&nbsp;&nbsp;<a href=\\"javascript:\\" onclick=\\"nameImage' + name + 'Del(this);\\">×</a></li>";\r\n'
            + '$("#nameImage' + name + 'Preview").append(li);\r\n'
            + '}\r\n'
            + '}\r\n'
            + 'if ($("#nameImage' + name + 'Preview").text() == ""){\r\n'
            + '$("#nameImage' + name + 'Preview").html("<li style=\'list-style:none;padding-top:5px;\'>无</li>");\r\n'
            + '}\r\n'
            + '}\r\n'
            + 'nameImage' + name + 'Preview();\r\n'
            + '<\/script>\r\n';
        return html;
    }
</script>
