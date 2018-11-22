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
            del: function (itemAddressId,entityId) {
                if(entityId){
                    var url = "${ctx}/customer/customerAddress/delete";
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
                                        $("#" + oper.address.socpName + "tr_" + itemAddressId).remove();
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
                var trStr = '<tr id="' + this.socpName + 'tr_' + newMaxId + '">'
                    + '<td>'
                    + '<input type="hidden"  name="itemAddressId" value="' + newMaxId + '"/>'
                    + '<input type="hidden"  name="customerAddressList[' + newMaxId + '].id" value=""/>'
                    + '<input type="text" name="customerAddressList[' + newMaxId + '].startDate" value="" valid="vtext" readonly="readonly" maxlength="20" class="input-medium Wdate"  '
                    + 'pattern="yyyy-MM-dd" onclick="WdatePicker({dateFmt:\'yyyy-MM-dd\',isShowClear:false});"/>'
                    + '</td>'
                    + '<td>'
                    + '<input type="text" name="customerAddressList[' + newMaxId + '].endDate" value="" value="" valid="vtext" readonly="readonly" maxlength="20" class="input-medium Wdate"  '
                    + 'pattern="yyyy-MM-dd" onclick="WdatePicker({dateFmt:\'yyyy-MM-dd\',isShowClear:false});"/>'
                    + '</td>'
                    + '<td>'
                    + '<select class="table-form-control" id="selectOptId_' + newMaxId + '" onchange="changeDefault(' + newMaxId + ')" name="customerAddressList[' + newMaxId + '].stage">'
                    <c:forEach items="${fns:getDictList('edu_type')}" var="dict" varStatus="idx">
                    + '<option value="${dict.value}">${dict.label}</option>'
                    </c:forEach>
                    + '</select>'
                    + '</td>'
                    + '<td>'
                    + '<input type="text" class="table-form-control" name="customerAddressList[' + newMaxId + '].schoolName" value="" valid="vtext"/>'
                    + '</td>'
                    + '<td>'
                    + '<input type="text" class="table-form-control" name="customerAddressList[' + newMaxId + '].major"  value="" valid="vtext"/>'
                    + '</td>'
                    + '<td>'
                    + '<input type="text" class="table-form-control" name="customerAddressList[' + newMaxId + '].witness" value="" valid="vtext"/>'
                    + '</td>'
                    + '<td>'
                    + '<input type="text" class="table-form-control" name="customerAddressList[' + newMaxId + '].phone" value="" valid="vnum"/>'
                    + '</td>'
                    + '<td>'
                    + '<a href="javascript:void(0)" class="btnDel" onclick="oper.edu.del(' + newMaxId + ');">删除</a>'
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
            del: function (itemBankId,entityId) {
                if(entityId){
                    var url = "${ctx}/customer/customerBank/delete";
                    tips="确定删除银行信息？";
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
