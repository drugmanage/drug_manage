<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/4
  Time: 21:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<script type="application/javascript">
    var oper = {
        edu: {
            socpName: "edu_",
            add: function () {
                if ($("input[name='itemEduId']") && $("input[name='itemEduId']").length != 0) {
                    var itemEduId = [];
                    $("input[name='itemEduId']").each(function () {
                        itemEduId.push(parseInt($(this).val()));
                    });
                    if (itemEduId.length != 0) {
                        var maxId = Math.max.apply(null, itemEduId);
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
            del: function (itemEduId,entityId) {
                if(entityId){
                    var url = "${ctx}/hrmuser/hrmEdu/delete";
                    tips="确定删除教育信息？";
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
                                        $("#" + oper.edu.socpName + "tr_" + itemEduId).remove();
                                    }
                                }
                            })
                        }
                    });
                }else{
                    $("#" + this.socpName + "tr_" + itemEduId).remove();
                }
            },
            appendHtml: function (newMaxId) {
                var trStr = '<tr id="' + this.socpName + 'tr_' + newMaxId + '">'
                    + '<td>'
                    + '<input type="hidden"  name="itemEduId" value="' + newMaxId + '"/>'
                    + '<input type="hidden"  name="hrmEduList[' + newMaxId + '].id" value=""/>'
                    + '<input type="text" name="hrmEduList[' + newMaxId + '].startDate" value="" valid="vtext" readonly="readonly" maxlength="20" class="input-medium Wdate"  '
                    + 'pattern="yyyy-MM-dd" onclick="WdatePicker({dateFmt:\'yyyy-MM-dd\',isShowClear:false});"/>'
                    + '</td>'
                    + '<td>'
                    + '<input type="text" name="hrmEduList[' + newMaxId + '].endDate" value="" value="" valid="vtext" readonly="readonly" maxlength="20" class="input-medium Wdate"  '
                    + 'pattern="yyyy-MM-dd" onclick="WdatePicker({dateFmt:\'yyyy-MM-dd\',isShowClear:false});"/>'
                    + '</td>'
                    + '<td>'
                    + '<select class="table-form-control" id="selectOptId_' + newMaxId + '" onchange="changeDefault(' + newMaxId + ')" name="hrmEduList[' + newMaxId + '].stage">'
                    <c:forEach items="${fns:getDictList('edu_type')}" var="dict" varStatus="idx">
                    + '<option value="${dict.value}">${dict.label}</option>'
                    </c:forEach>
                    + '</select>'
                    + '</td>'
                    + '<td>'
                    + '<input type="text" class="table-form-control" name="hrmEduList[' + newMaxId + '].schoolName" value="" valid="vtext"/>'
                    + '</td>'
                    + '<td>'
                    + '<input type="text" class="table-form-control" name="hrmEduList[' + newMaxId + '].major"  value="" valid="vtext"/>'
                    + '</td>'
                    + '<td>'
                    + '<input type="text" class="table-form-control" name="hrmEduList[' + newMaxId + '].witness" value="" valid="vtext"/>'
                    + '</td>'
                    + '<td>'
                    + '<input type="text" class="table-form-control" name="hrmEduList[' + newMaxId + '].phone" value="" valid="vnum"/>'
                    + '</td>'
                    + '<td>'
                    + '<a href="javascript:void(0)" class="btnDel" onclick="oper.edu.del(' + newMaxId + ');">删除</a>'
                    + '</td>'
                    + '</tr>';
                var html = trStr;
                return html;
            }
        },
        work: {
            socpName: "work_",
            //工作经历页面
            add: function () {
                if ($("input[name='itemWorkId']") && $("input[name='itemWorkId']").length != 0) {
                    var itemWorkId = [];
                    $("input[name='itemWorkId']").each(function () {
                        itemWorkId.push(parseInt($(this).val()));
                    });
                    if (itemWorkId.length != 0) {
                        var maxId = Math.max.apply(null, itemWorkId);
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
            del: function (itemWorkId,entityId) {
                if(entityId){
                    var url = "${ctx}/hrmuser/hrmWork/delete";
                    tips="确定删除工作经历信息？";
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
                                        $("#" + oper.work.socpName + "tr_" + itemWorkId).remove();
                                    }
                                }
                            })
                        }
                    });
                }else{
                    $("#" + this.socpName + "tr_" + itemWorkId).remove();
                }
            },
            appendHtml: function (newMaxId) {
                var trStr = '<tr id="' + this.socpName + 'tr_' + newMaxId + '">'
                    + '<td>'
                    + '<input type="hidden"  name="itemWorkId" value="' + newMaxId + '"/>'
                    + '<input type="hidden"  name="hrmWorkExperList[' + newMaxId + '].id" value=""/>'
                    + '<input type="text" name="hrmWorkExperList[' + newMaxId + '].startDate" value="" valid="vtext" readonly="readonly" maxlength="20" class="input-medium Wdate"  '
                    + 'pattern="yyyy-MM-dd" onclick="WdatePicker({dateFmt:\'yyyy-MM-dd\',isShowClear:false});"/>'
                    + '</td>'
                    + '<td>'
                    + '<input type="text" name="hrmWorkExperList[' + newMaxId + '].endDate" value="" value="" valid="vtext" readonly="readonly" maxlength="20" class="input-medium Wdate"  '
                    + 'pattern="yyyy-MM-dd" onclick="WdatePicker({dateFmt:\'yyyy-MM-dd\',isShowClear:false});"/>'
                    + '</td>'

                    + '<td>'
                    + '<input type="text" class="table-form-control" name="hrmWorkExperList[' + newMaxId + '].companyName" value="" valid="vtext"/>'
                    + '</td>'
                    + '<td>'
                    + '<input type="text" class="table-form-control" name="hrmWorkExperList[' + newMaxId + '].companyAddress"  value="" valid="vtext"/>'
                    + '</td>'
                    + '<td>'
                    + '<input type="text" class="table-form-control" name="hrmWorkExperList[' + newMaxId + '].post" value="" valid="vtext"/>'
                    + '</td>'
                    + '<td>'
                    + '<input type="text" class="table-form-control" name="hrmWorkExperList[' + newMaxId + '].phone" value="" valid="vnum"/>'
                    + '</td>'
                    + '<td>'
                    + '<a href="javascript:void(0)" class="btnDel" onclick="oper.work.del(' + newMaxId + ');">删除</a>'
                    + '</td>'
                    + '</tr>';
                var html = trStr;
                return html;
            }
        },
        family: {
            socpName: "family_",
            //工作经历页面
            add: function () {
                if ($("input[name='itemFamilyId']") && $("input[name='itemFamilyId']").length != 0) {
                    var itemFamilyId = [];
                    $("input[name='itemFamilyId']").each(function () {
                        itemFamilyId.push(parseInt($(this).val()));
                    });
                    if (itemFamilyId.length != 0) {
                        var maxId = Math.max.apply(null, itemFamilyId);
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
            del: function (itemWorkId,entityId) {
                if(entityId){
                    var url = "${ctx}/hrmuser/hrmFamilyContact/delete";
                    tips="确定删除家庭联系人信息？";
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
                                        $("#" + oper.family.socpName + "tr_" + itemWorkId).remove();
                                    }
                                }
                            })
                        }
                    });
                }else{
                    $("#" + this.socpName + "tr_" + itemWorkId).remove();
                }
            },
            appendHtml: function (newMaxId) {
                var trStr = '<tr id="' + this.socpName + 'tr_' + newMaxId + '">'

                    + '<td>'
                    + '<input type="hidden" name="itemFamilyId" value="' + newMaxId + '"/>'
                    + '<input type="hidden" name="hrmFamilyList[' + newMaxId + '].id" value=""/>'
                    + '<input type="text" class="table-form-control" name="hrmFamilyList[' + newMaxId + '].name" value="" valid="vtext"/>'
                    + '</td>'
                    + '<td>'
                    + '<input type="text" class="table-form-control" name="hrmFamilyList[' + newMaxId + '].relationship" value="" valid="vtext"/>'
                    + '</td>'
                    + '<td>'
                    + '<input type="text" class="table-form-control" name="hrmFamilyList[' + newMaxId + '].workUnit"  value="" valid="vtext"/>'
                    + '</td>'
                    + '<td>'
                    + '<input type="text" class="table-form-control" name="hrmFamilyList[' + newMaxId + '].post" value="" valid="vtext"/>'
                    + '</td>'
                    + '<td>'
                    + '<input type="text" class="table-form-control" name="hrmFamilyList[' + newMaxId + '].phone" value="" valid="vnum"/>'
                    + '</td>'
                    + '<td>'
                    + '<a href="javascript:void(0)" class="btnDel" onclick="oper.family.del(' + newMaxId + ');">删除</a>'
                    + '</td>'
                    + '</tr>';
                var html = trStr;
                return html;
            }
        },
        bank: {
            socpName: "bank_",
            //工作经历页面
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
            del: function (itemBankId,entityId) {
                if(entityId){
                    var url = "${ctx}/hrmuser/hrmBank/delete";
                    tips="确定删除家庭联系人信息？";
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
                                        $("#" + this.socpName + "tr_" + itemBankId).remove();
                                    }
                                }
                            })
                        }
                    });
                }else{
                    $("#" + this.socpName + "tr_" + itemBankId).remove();
                }
            },
            appendHtml: function (newMaxId) {
                var frontUploadId = "front" + newMaxId;
                var backUploadId = "back" + newMaxId;
                var trStr = '<tr id="' + this.socpName + 'tr_' + newMaxId + '">'
                    + '<td>'
                    + '<input type="hidden" name="itemBankId" value="' + newMaxId + '"/>'
                    + '<input type="hidden" name="hrmBanksList[' + newMaxId + '].id" value=""/>'
                    + '<select class="table-form-control" name="hrmBanksList[' + newMaxId + '].bank">'
                    + '<c:forEach items="${fns:getDictList('bank')}" var="dict" varStatus="idx">'
                    + '<option value="${dict.value}"  >${dict.label}</option>'
                    + '</c:forEach>'
                    + '</select>'
                    + '</td>'
                    + '<td>'
                    + '<input type="text" class="table-form-control" name="hrmBanksList[' + newMaxId + '].bankNumber" value="" valid="vtext"/>'
                    + '</td>'
                    + '<td>'
                    + '<select class="table-form-control" name="hrmBanksList[' + newMaxId + '].status">'
                    + '<c:forEach items="${fns:getDictList('bank_status')}" var="dict" varStatus="idx">'
                    + '<option value="${dict.value}">${dict.label}</option>'
                    + '</c:forEach>'
                    + '</select>'

                    + '</td>'
                    + '<td>'

                    + '<input id="nameImage' + frontUploadId + '" name="hrmBanksList[' + newMaxId + '].positivePhoto" type="hidden" >'
                    + '<ol id="nameImage' + frontUploadId + 'Preview"><li style="list-style:none;padding-top:5px;">无</li></ol>'

                    + '<a href="javascript:" onclick="nameImage' + frontUploadId + 'FinderOpen();" class="btn" id="limitAdd">添加</a>&nbsp;<a href="javascript:" onclick="nameImage' + frontUploadId + 'DelAll();" class="btn">清除</a>'
                    + '<script type="text/javascript">'
                    + 'function nameImage' + frontUploadId + 'FinderOpen(){\r\n'
                    + 'var date = new Date(), year = date.getFullYear(), month = (date.getMonth()+1)>9?date.getMonth()+1:"0"+(date.getMonth()+1);\r\n'
                    + 'var url = "${ctxStatic}/ckfinder/ckfinder.html?type=images&start=images:/photo/hrmuser/bank/"+year+"/"+month+'
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
                    + '<input id="nameImage' + backUploadId + '" name="hrmBanksList[' + newMaxId + '].backPhoto" type="hidden" >'
                    + '<ol id="nameImage' + backUploadId + 'Preview"><li style="list-style:none;padding-top:5px;">无</li></ol>'

                    + '<a href="javascript:" onclick="nameImage' + backUploadId + 'FinderOpen();" class="btn" id="limitAdd">添加</a>&nbsp;<a href="javascript:" onclick="nameImage' + backUploadId + 'DelAll();" class="btn">清除</a>'
                    + '<script type="text/javascript">'
                    + 'function nameImage' + backUploadId + 'FinderOpen(){\r\n'
                    + 'var date = new Date(), year = date.getFullYear(), month = (date.getMonth()+1)>9?date.getMonth()+1:"0"+(date.getMonth()+1);\r\n'
                    + 'var url = "${ctxStatic}/ckfinder/ckfinder.html?type=images&start=images:/photo/hrmuser/bank/"+year+"/"+month+'
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
                    + '<input type="text" class="table-form-control" name="hrmBanksList[' + newMaxId + '].remarks" value="" valid="text"/>'
                    + '</td>'
                    + '<td>'
                    + '<a href="javascript:void(0)" class="btnDel" onclick="oper.bank.del(' + newMaxId + ');">删除</a>'
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
                    $("#" + oper.address.socpName + "contentField").html(html);
                }
            },
            del: function (itemAddressId,entityId) {
                if(entityId){
                    var url = "${ctx}/hrmuser/hrmAddress/delete";
                    tips="确定删除第三方收货地址信息吗？";
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
                                        $("#" + this.socpName + "tr_" + itemAddressId).remove();
                                    }
                                }
                            })
                        }
                    });
                }else{
                    $("#" + this.socpName + "tr_" + itemAddressId).remove();
                }
            },
            appendHtml: function (newMaxId) {
                var frontUploadId = "front" + newMaxId;
                var backUploadId = "back" + newMaxId;
                var trStr = '<tr id="' + this.socpName + 'tr_' + newMaxId + '">'
                    + '<td>'
                    + '<input type="hidden" name="itemAddressId" value="' + newMaxId + '"/>'
                    + '<input type="hidden" name="hrmAddressList[' + newMaxId + '].id" value=""/>'
                    + '<input type="text" class="table-form-control" name="hrmAddressList[' + newMaxId + '].receivingName" value="" valid="vtext"/>'
                    + '</td>'

                    + '<td>'
                    + '<input id="area' + newMaxId + 'Id" name="hrmAddressList[' + newMaxId + '].area.id" class="required" type="hidden" value="">'
                    + '<input id="area' + newMaxId + 'Name" name="hrmAddressList[' + newMaxId + '].area.name" readonly="readonly" type="text" value="" data-msg-required="" class="required" style="">'
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
                    + '<input type="text" class="table-form-control" name="hrmAddressList[' + newMaxId + '].receivingAddress" value="" valid="vtext"/>'
                    + '</td>'

                    + '<td>'
                    + '<input type="text" class="table-form-control" name="hrmAddressList[' + newMaxId + '].contactPhone" value="" valid="vnum"/>'
                    + '</td>'
                    + '<td>'
                    + '<a href="javascript:void(0)" class="btnDel" onclick="oper.address.del(' + newMaxId + ');">删除</a>'
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
