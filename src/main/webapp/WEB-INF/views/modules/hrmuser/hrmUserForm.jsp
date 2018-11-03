<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>内部员工管理</title>
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
            //Tab页签
            $('#myTab a:first').tab('show');
            $('#myTab a').click(function (e) {
                e.preventDefault();
                $(this).tab('show');
            });
        });
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
                        $("#" + this.socpName + "contentField").html(html);
                    }
                },
                del: function (itemEduId) {
                    $("#" + this.socpName + "tr_" + itemEduId).remove();
                },
                appendHtml: function (newMaxId) {
                    var trStr = '<tr id="' + this.socpName + 'tr_' + newMaxId + '">'
                        + '<td>'
                        + '<input type="hidden"  name="itemEduId" value="' + newMaxId + '"/>'
                        + '<input type="text" name="hrmEduList[' + newMaxId + '].startDate" value="" valid="vtext" readonly="readonly" maxlength="20" class="input-medium Wdate"  '
                        + 'pattern="yyyy-MM-dd" onclick="WdatePicker({dateFmt:\'yyyy-MM-dd\',isShowClear:false});"/>'
                        + '</td>'
                        + '<td>'
                        + '<input type="text" name="hrmEduList[' + newMaxId + '].endDate" value="" value="" valid="vtext" readonly="readonly" maxlength="20" class="input-medium Wdate"  '
                        + 'pattern="yyyy-MM-dd" onclick="WdatePicker({dateFmt:\'yyyy-MM-dd\',isShowClear:false});"/>'
                        + '</td>'
                        + '<td>'
                        + '<select class="table-form-control" id="selectOptId_' + newMaxId + '" onchange="changeDefault(' + newMaxId + ')" name="hrmEduList[' + newMaxId + '].stage">'
                        <c:forEach items="${fns:getDictList('edu_stage')}" var="dict" varStatus="idx">
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
                del: function (itemWorkId) {
                    $("#" + this.socpName + "tr_" + itemWorkId).remove();
                },
                appendHtml: function (newMaxId) {
                    var trStr = '<tr id="' + this.socpName + 'tr_' + newMaxId + '">'
                        + '<td>'
                        + '<input type="hidden"  name="itemWorkId" value="' + newMaxId + '"/>'
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
                del: function (itemWorkId) {
                    $("#" + this.socpName + "tr_" + itemWorkId).remove();
                },
                appendHtml: function (newMaxId) {
                    var trStr = '<tr id="' + this.socpName + 'tr_' + newMaxId + '">'

                        + '<td>'
                        + '<input type="hidden" name="itemFamilyId" value="' + newMaxId + '"/>'
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
                                $("#" + this.socpName + "tr_" + maxId).after(html);
                            }
                        }
                    } else {
                        var newMaxId = 0;
                        var html = this.appendHtml(newMaxId);
                        $("#" + this.socpName + "contentField").html(html);
                    }
                },
                del: function (itemBankId) {
                    $("#" + this.socpName + "tr_" + itemBankId).remove();
                },
                appendHtml: function (newMaxId) {
                    var frontUploadId="front"+newMaxId;
                    var backUploadId = "back"+newMaxId;
                    var trStr = '<tr id="' + this.socpName + 'tr_' + newMaxId + '">'
                        + '<td>'
                        + '<input type="hidden" name="itemBankId" value="' + newMaxId + '"/>'
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
            }
        };

    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li><a href="${ctx}/hrmuser/hrmUser/">内部员工列表</a></li>
    <li class="active"><a href="${ctx}/hrmuser/hrmUser/form?id=${hrmUser.id}">内部员工<shiro:hasPermission
            name="hrmuser:hrmUser:edit">${not empty hrmUser.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission
            name="hrmuser:hrmUser:edit">查看</shiro:lacksPermission></a></li>
</ul>
<br/>
<form:form id="inputForm" modelAttribute="hrmUser" action="${ctx}/hrmuser/hrmUser/save" method="post"
           class="form-horizontal">
    <form:hidden path="id"/>
    <sys:message content="${message}"/>
    <ul class="nav nav-tabs" id="myTab">
        <li class="active"><a href="#baseInfo">基本信息</a></li>
        <li><a href="#eduInfo">教育经历</a></li>
        <li><a href="#workInfo">工作经历</a></li>
        <li><a href="#familyInfo">家庭成员</a></li>
        <li><a href="#bankInfo">银行卡信息</a></li>

    </ul>

    <div class="tab-content">
        <div class="tab-pane active" id="baseInfo">
            <div class="control-group">
                <div class="div-a">
                    <label class="control-label">用户表id：</label>
                    <div class="controls">
                        <sys:treeselect id="sysUser" name="sysUser" value="${hrmUser.sysUser.id}" labelName=""
                                        labelValue="${hrmUser.sysUser.name}"
                                        title="用户" url="/sys/office/treeData?type=3" cssClass="input-large"
                                        allowClear="true"
                                        notAllowSelectParent="true"/>
                    </div>
                </div>
                <div class="div-b">
                    <label class="control-label">职员编号：</label>
                    <div class="controls">
                        <form:input path="empNumber" htmlEscape="false" maxlength="32" class="input-xlarge required"/>
                        <span class="help-inline"><font color="red">*</font> </span>
                    </div>
                </div>
            </div>
            <div class="control-group">
                <div class="div-a">
                    <label class="control-label">职员名称：</label>
                    <div class="controls">
                        <form:input path="empName" htmlEscape="false" maxlength="64" class="input-xlarge required"/>
                        <span class="help-inline"><font color="red">*</font> </span>
                    </div>
                </div>
                <div class="div-b">
                    <label class="control-label">助记码：</label>
                    <div class="controls">
                        <form:input path="pinyin" htmlEscape="false" maxlength="32" class="input-xlarge required"/>
                        <span class="help-inline"><font color="red">*</font> </span>
                    </div>
                </div>
            </div>
            <div class="control-group">
                <div class="div-a">
                    <label class="control-label">出生日期：</label>
                    <div class="controls">
                        <input name="birth" type="text" readonly="readonly" maxlength="20" class="input-xlarge Wdate "
                               value="<fmt:formatDate value="${hrmUser.birth}" pattern="yyyy-MM-dd"/>"
                               onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
                    </div>
                </div>
                <div class="div-b">
                    <label class="control-label">年龄：</label>
                    <div class="controls">
                        <form:input path="age" htmlEscape="false" maxlength="11" class="input-xlarge "/>
                    </div>
                </div>
            </div>
            <div class="control-group">
                <div class="div-a">
                    <label class="control-label">性别：</label>
                    <div class="controls">
                        <form:radiobuttons path="sex" items="${fns:getDictList('sex')}" itemLabel="label"
                                           itemValue="value"
                                           htmlEscape="false" class=""/>
                    </div>
                </div>
                <div class="div-b">
                    <label class="control-label">婚姻状况：</label>
                    <div class="controls">
                        <form:radiobuttons path="maritalStatus" items="${fns:getDictList('marital_status')}"
                                           itemLabel="label"
                                           itemValue="value" htmlEscape="false" class=""/>
                    </div>
                </div>
            </div>
            <div class="control-group">
                <div class="div-a">
                    <label class="control-label">学历：</label>
                    <div class="controls">
                        <form:select path="education" class="input-xlselect ">
                            <form:option value="" label=""/>
                            <form:options items="${fns:getDictList('edu_type')}" itemLabel="label" itemValue="value"
                                          htmlEscape="false"/>
                        </form:select>
                    </div>
                </div>
                <div class="div-b">
                    <label class="control-label">毕业院校：</label>
                    <div class="controls">
                        <form:input path="schoolName" htmlEscape="false" maxlength="255" class="input-xlarge "/>
                    </div>
                </div>

            </div>
            <div class="control-group">
                <div class="div-a">
                    <label class="control-label">籍贯：</label>
                    <div class="controls">
                        <form:input path="nativePlace" htmlEscape="false" maxlength="128" class="input-xlarge "/>
                    </div>
                </div>
                <div class="div-b">
                    <label class="control-label">民族：</label>
                    <div class="controls">
                        <form:input path="nation" htmlEscape="false" maxlength="10" class="input-xlarge "/>
                    </div>
                </div>
            </div>
            <div class="control-group">
                <div class="div-a">
                    <label class="control-label">健康状况：</label>
                    <div class="controls">
                        <form:input path="health" htmlEscape="false" maxlength="10" class="input-xlarge "/>
                    </div>
                </div>
                <div class="div-b">
                    <label class="control-label">政治面貌：</label>
                    <div class="controls">
                        <form:input path="politicalOutlook" htmlEscape="false" maxlength="10" class="input-xlarge "/>
                    </div>
                </div>
            </div>
            <div class="control-group">
                <div class="div-a">
                    <label class="control-label">QQ号：</label>
                    <div class="controls">
                        <form:input path="qqNumber" htmlEscape="false" maxlength="20" class="input-xlarge "/>
                    </div>
                </div>
                <div class="div-b">
                    <label class="control-label">手机号：</label>
                    <div class="controls">
                        <form:input path="mobile" htmlEscape="false" maxlength="20" class="input-xlarge "/>
                    </div>
                </div>
            </div>
            <div class="control-group">
                <div class="div-a">
                    <label class="control-label">邮箱：</label>
                    <div class="controls">
                        <form:input path="email" htmlEscape="false" maxlength="32" class="input-xlarge "/>
                    </div>
                </div>
                <div class="div-b">
                    <label class="control-label">邮编：</label>
                    <div class="controls">
                        <form:input path="zipCode" htmlEscape="false" maxlength="20" class="input-xlarge "/>
                    </div>
                </div>
            </div>
            <div class="control-group">
                <div class="div-a">
                    <label class="control-label">联系地址：</label>
                    <div class="controls">
                        <form:input path="proCode" htmlEscape="false" maxlength="10" class="input-mini "/>
                        <form:input path="cityCode" htmlEscape="false" maxlength="10" class="input-mini"/>
                        <form:input path="countyCode" htmlEscape="false" maxlength="10" class="input-mini "/>
                        <form:input path="contactAddress" htmlEscape="false" maxlength="25" class="input-xlarge "/>
                    </div>
                </div>
                <div class="div-b">
                    <label class="control-label">座机电话：</label>
                    <div class="controls">
                        <form:input path="telephone" htmlEscape="false" maxlength="20" class="input-xlarge "/>
                    </div>
                </div>
            </div>

            <div class="control-group">
                <div class="div-a">
                    <label class="control-label">应聘登记时间：</label>
                    <div class="controls">
                        <input name="regTime" type="text" readonly="readonly" maxlength="20" class="input-xlarge Wdate "
                               value="<fmt:formatDate value="${hrmUser.regTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                               onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
                    </div>
                </div>
                <div class="div-b">
                    <label class="control-label">应聘职务：</label>
                    <div class="controls">
                        <form:input path="jobObjective" htmlEscape="false" maxlength="32" class="input-xlarge "/>
                    </div>
                </div>
            </div>

            <div class="control-group">
                <div class="div-a">
                    <label class="control-label">紧急联系人姓名：</label>
                    <div class="controls">
                        <form:input path="emergencyContactName" htmlEscape="false" maxlength="32"
                                    class="input-xlarge "/>
                    </div>
                </div>
                <div class="div-b">
                    <label class="control-label">紧急联系人电话：</label>
                    <div class="controls">
                        <form:input path="emergencyContactPhone" htmlEscape="false" maxlength="20"
                                    class="input-xlarge "/>
                    </div>
                </div>
            </div>

            <div class="control-group">
                <div class="div-a">
                    <label class="control-label">用户类型：</label>
                    <div class="controls">
                        <form:select path="userType" class="input-xlarge ">
                            <form:option value="" label=""/>
                            <form:options items="${fns:getDictList('user_type')}" itemLabel="label" itemValue="value"
                                          htmlEscape="false"/>
                        </form:select>
                    </div>
                </div>
                <div class="div-b">
                    <label class="control-label">申请时间：</label>
                    <div class="controls">
                        <input name="applyTime" type="text" readonly="readonly" maxlength="20"
                               class="input-xlarge Wdate "
                               value="<fmt:formatDate value="${hrmUser.applyTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                               onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
                    </div>
                </div>

            </div>

            <div class="control-group">
                <div class="div-a">
                    <label class="control-label">证件类型：</label>
                    <div class="controls">
                        <form:select path="certType" class="input-xlarge ">
                            <form:option value="" label=""/>
                            <form:options items="${fns:getDictList('user_cert_type')}" itemLabel="label"
                                          itemValue="value"
                                          htmlEscape="false"/>
                        </form:select>
                    </div>
                </div>
                <div class="div-b">
                    <label class="control-label">证件号码：</label>
                    <div class="controls">
                        <form:input path="certNumber" htmlEscape="false" maxlength="1" class="input-xlarge "/>
                    </div>
                </div>
            </div>

            <div class="control-group">
                <label class="control-label">用户公司类型：</label>
                <div class="controls">
                    <form:radiobuttons path="companyType" items="${fns:getDictList('user_company_type')}"
                                       itemLabel="label"
                                       itemValue="value" htmlEscape="false" class=""/>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">个人描述：</label>
                <div class="controls">
                    <form:input path="personalDesc" htmlEscape="false" maxlength="1000" class="input-xlarge "/>
                </div>
            </div>

            <div class="control-group">
                <label class="control-label">备注信息：</label>
                <div class="controls">
                    <form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
                </div>
            </div>
        </div>

        <div class="tab-pane" id="eduInfo">
            <%@include file="/WEB-INF/views/modules/hrmuser/hrmEducationForm.jsp" %>
        </div>

        <div class="tab-pane" id="workInfo">
            <%@include file="/WEB-INF/views/modules/hrmuser/hrmWorkExperForm.jsp" %>
        </div>
        <div class="tab-pane" id="familyInfo">
            <%@include file="/WEB-INF/views/modules/hrmuser/hrmFamilyContactForm.jsp" %>
        </div>

        <div class="tab-pane active" id="bankInfo">
            <%@include file="/WEB-INF/views/modules/hrmuser/hrmBankForm.jsp" %>
        </div>

    </div>

    <div class="form-actions">
        <shiro:hasPermission name="hrmuser:hrmUser:edit"><input id="btnSubmit" class="btn btn-primary" type="submit"
                                                                value="保 存"/>&nbsp;</shiro:hasPermission>
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </div>
</form:form>
</body>
</html>