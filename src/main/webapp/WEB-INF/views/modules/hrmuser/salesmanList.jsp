<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>分配业务员</title>
	<meta name="decorator" content="blank"/>
	<%@include file="/WEB-INF/views/include/treeview.jsp" %>
	<script type="text/javascript">

        var officeTree;
        var selectedTree;//zTree已选择对象

        // 初始化
        $(document).ready(function(){
            officeTree = $.fn.zTree.init($("#officeTree"), setting, officeNodes);
            selectedTree = $.fn.zTree.init($("#selectedTree"), setting, selectedNodes);
            initHeight();
        });

        var setting = {view: {selectedMulti:false,nameIsHTML:true,showTitle:false,dblClickExpand:false},
            data: {simpleData: {enable: true}},
            callback: {onClick: treeOnClick}};

        var officeNodes=[
            <c:forEach items="${officeList}" var="office">
            {id:"${office.id}",
                pId:"${not empty office.parent?office.parent.id:0}",
                name:"${office.name}"},
            </c:forEach>];

        var pre_selectedNodes =[
            <c:forEach items="${userList}" var="user">
            {id:"${user.salemanHrmUser.id}",
                pId:"0",
                name:"<font color='red' style='font-weight:bold;'>${user.salemanHrmUser.empName}</font>"},
            </c:forEach>];

        var selectedNodes =[
            <c:forEach items="${userList}" var="user">
            {id:"${user.salemanHrmUser.id}",
                pId:"0",
                name:"<font color='red' style='font-weight:bold;'>${user.salemanHrmUser.empName}</font>"},
            </c:forEach>];

        var pre_ids = "${selectIds}".split(",");
        var ids = "${selectIds}".split(",");

        //点击选择项回调
        function treeOnClick(event, treeId, treeNode, clickFlag){
            $.fn.zTree.getZTreeObj(treeId).expandNode(treeNode);
            if("officeTree"==treeId){
                $.get("${ctx}/sys/role/users?officeId=" + treeNode.id, function(userNodes){
                    $.fn.zTree.init($("#userTree"), setting, userNodes);
                });
            }
            if("userTree"==treeId){
                //alert(treeNode.id + " | " + ids);
                //alert(typeof ids[0] + " | " +  typeof treeNode.id);
                if($.inArray(String(treeNode.id), ids)<0){
                    selectedTree.addNodes(null, treeNode);
                    ids.push(String(treeNode.id));
                }
            };
            if("selectedTree"==treeId){
                if($.inArray(String(treeNode.id), pre_ids)<0){
                    selectedTree.removeNode(treeNode);
                    ids.splice($.inArray(String(treeNode.id), ids), 1);
                }else{
                    top.$.jBox.tip("分配业务员不能清除！", 'info');
                }
            }
        };
        function clearAssign(){
            var submit = function (v, h, f) {
                if (v == 'ok'){
                    var tips="";
                    if(pre_ids.sort().toString() == ids.sort().toString()){
                        tips = "未给员工【${hrmUser.empNname}】分配业务员！";
                    }else{
                        tips = "已选业务员清除成功！";
                    }
                    ids=pre_ids.slice(0);
                    selectedNodes=pre_selectedNodes;
                    $.fn.zTree.init($("#selectedTree"), setting, selectedNodes);
                    top.$.jBox.tip(tips, 'info');
                } else if (v == 'cancel'){
                    // 取消
                    top.$.jBox.tip("取消清除操作！", 'info');
                }
                return true;
            };
            tips="确定清除员【${hrmUser.empNname}】下的已选业务员？";
            top.$.jBox.confirm(tips, "清除确认", submit);
        };
        function initHeight(){
            var height=$(document).height();
            $("#depart_div").height(height+16);
            $("#selection_div").height(height+16);
            $("#selected_div").height(height+16);
        }
	</script>
</head>
<body scroll="no">
    <div id="assignRole" class="row-fluid span12" style="margin-left:0px;width:810px;  scroll:no">
        <div id="depart_div" class="span4" style="border-right: 1px solid #A8A8A8;height:auto;padding-left: 20px;width:270px; overflow: scroll;">
            <p>所在部门：</p>
            <div id="officeTree" class="ztree"></div>
        </div>
        <div id="selection_div" class="span3" style=" margin: 0px;padding-left: 20px;width:270px;  overflow: scroll;"">
            <p>待选人员：</p>
            <div id="userTree" class="ztree"></div>
        </div>
        <div id="selected_div" class="span3" style="padding-left:16px;border-left: 1px solid #A8A8A8;margin: 0px;padding-left: 20px;width:270px;  overflow: scroll;"">
        <p>已选人员：</p>
        <div id="selectedTree" class="ztree"></div>
        </div>
    </div>
</body>
</html>