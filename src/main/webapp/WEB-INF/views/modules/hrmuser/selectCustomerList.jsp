<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>分配业务员</title>
    <meta name="decorator" content="blank"/>
    <%@include file="/WEB-INF/views/include/treeview.jsp" %>
    <script type="text/javascript">

        var customerTree;
        var selectedTree;//zTree已选择对象

        // 初始化
        $(document).ready(function () {
            customerTree = $.fn.zTree.init($("#customerTree"), setting, customerNodes);
            selectedTree = $.fn.zTree.init($("#selectedTree"), setting, selectedNodes);
            initHeight();
        });

        var setting = {
            view: {selectedMulti: false, nameIsHTML: true, showTitle: false, dblClickExpand: false},
            data: {simpleData: {enable: true}},
            callback: {onClick: treeOnClick}
        };

        var customerNodes = [
            <c:forEach items="${customerList}" var="cus">
            {
                id: "${cus.id}",
                pId: "0",
                name: "${cus.name}"
            },
            </c:forEach>];

        var pre_selectedNodes = [
            <c:forEach items="${selectedCustomerList}" var="cus">
            {
                id: "${cus.customer.id}",
                pId: "0",
                name: "<font color='red' style='font-weight:bold;'>${user.customer.name}</font>"
            },
            </c:forEach>];

        var selectedNodes = [
            <c:forEach items="${selectedCustomerList}" var="cus">
            {
                id: "${cus.customer.id}",
                pId: "0",
                name: "<font color='red' style='font-weight:bold;'>${user.customer.name}</font>"
            },
            </c:forEach>];

        var hrmManageId = "${hrmUser.id}";
        var empName = "${hrmUser.empName}";
        var pre_ids = "${selectIds}".split(",");
        var ids = "${selectIds}".split(",");

        //点击选择项回调
        function treeOnClick(event, treeId, treeNode, clickFlag) {
            $.fn.zTree.getZTreeObj(treeId).expandNode(treeNode);
            if ("customerTree" == treeId) {
                <%--$.get("${ctx}/hrmuser/hrmUser/hrmUserByOffice?userType=2&office.id=" + treeNode.id, function(userNodes){--%>
                <%--$.fn.zTree.init($("#userTree"), setting, userNodes);--%>
                <%--});--%>
                if ($.inArray(String(treeNode.id), ids) < 0) {
                    selectedTree.addNodes(null, treeNode);
                    ids.push(String(treeNode.id));
                }
            }
//            if("userTree"==treeId){
//                //alert(treeNode.id + " | " + ids);
//                //alert(typeof ids[0] + " | " +  typeof treeNode.id);
//                if($.inArray(String(treeNode.id), ids)<0){
//                    selectedTree.addNodes(null, treeNode);
//                    ids.push(String(treeNode.id));
//                }
//            };
            if ("selectedTree" == treeId) {
                if ($.inArray(String(treeNode.id), pre_ids) < 0) {
                    selectedTree.removeNode(treeNode);
                    ids.splice($.inArray(String(treeNode.id), ids), 1);
                } else {

//                    top.$.jBox.tip("分配业务员不能清除！", 'info');
                    //说明已经选中过该业务员，删除的话给提示，同意后直接删除数据库信息
                    var submit = function (v, h, f) {
                        if (v == 'ok') {
                            console.log(treeNode.id);
                            console.log(pre_ids);
                            console.log(hrmManageId);
                            var data = {manageId: hrmManageId, saleId: treeNode.id};
                            $.ajax({
                                url: "${ctx}/hrmuser/hrmUser/removeCustomer",
                                data: data,
                                type: "post",
                                dataType: "json",
                                success: function (data) {
                                    if (data.code == "1") {
                                        selectedTree.removeNode(treeNode);
                                        ids.splice($.inArray(String(treeNode.id), ids), 1);
                                        top.$.jBox.tip("删除成功", 'info');
                                    }
                                },
                                error: function () {

                                }
                            })
                        } else if (v == 'cancel') {
                            // 取消
                            top.$.jBox.tip("取消清除操作！", 'info');
                        }
                    }
                    tips = "确定清除员【${hrmUser.empName}】下的已选【" + treeNode.name + "】业务员？";
                    top.$.jBox.confirm(tips, "清除确认", submit);
                }

            }

        };
        function clearSalesman() {
            var submit = function (v, h, f) {
                if (v == 'ok') {
                    var tips = "";
                    if (pre_ids.sort().toString() == "" || ids.sort().toString() == "") {
                        tips = "未给员工【${hrmUser.empName}】分配客户！";
                    } else {
                        tips = "已选客户清除成功！";
                    }
                    pre_ids = [];
                    ids = [];
//                    ids=pre_ids.slice(0);
                    selectedNodes = [];
                    $.fn.zTree.init($("#selectedTree"), setting, selectedNodes);
                    top.$.jBox.tip(tips, 'info');
                } else if (v == 'cancel') {
                    // 取消
                    top.$.jBox.tip("取消清除操作！", 'info');
                }
                return true;
            };
            tips = "确定清除【${hrmUser.empName}】下的已选客户？";
            top.$.jBox.confirm(tips, "清除确认", submit);
        };
        function initHeight() {
            var height = $(document).height();
            $("#depart_div").height(height + 16);
            $("#selection_div").height(height + 16);
            $("#selected_div").height(height + 16);
        }
    </script>
</head>
<body scroll="no">
<div id="assignRole" class="row-fluid span12" style="margin-left:0px;width:810px;  scroll:no">
    <div id="depart_div" class="span4"
         style="border-right: 1px solid #A8A8A8;height:auto;padding-left: 20px;width:270px; overflow: scroll;">
        <p>待选客户：</p>
        <div id="customerTree" class="ztree"></div>
    </div>

    <div id="selected_div" class="span3"
         style="padding-left:16px;border-left: 1px solid #A8A8A8;margin: 0px;padding-left: 20px;width:270px;  overflow: scroll;">
        <p>已选人员：</p>
        <div id="selectedTree" class="ztree"></div>
    </div>
</div>
</body>
</html>