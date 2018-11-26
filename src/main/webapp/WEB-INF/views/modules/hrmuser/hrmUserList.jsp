<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>内部员工管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }

        function showSaleDiv(id){

            var width = $("#content",window.top.document).width();
            if(width!=undefined){
                width = width-100;
            }else{
                width = 1400;
            }
            var _jBoxConfig = {};
            _jBoxConfig.defaults = {
                opacity: 0.5,
                persistent: true, /* 在显示隔离层的情况下，点击隔离层时，是否坚持窗口不关闭 */
            }
            top.$.jBox.setDefaults(_jBoxConfig);
            top.$.jBox.open("iframe:${ctx}/hrmuser/hrmUser/bindSale?id="+id, "业务员信息", 810,$(top.document).height()-240, {
                buttons:{"确定分配":"ok", "清除已选":"clear", "关闭":true}, bottomText:"区域经理分配业务员信息。",submit:function(v, h, f){
                    var pre_ids = h.find("iframe")[0].contentWindow.pre_ids;
                    var ids = h.find("iframe")[0].contentWindow.ids;
                    var manageId = h.find("iframe")[0].contentWindow.hrmManageId;
                    var empName = h.find("iframe")[0].contentWindow.empName;
                    //nodes = selectedTree.getSelectedNodes();
                    if (v=="ok"){
                        // 删除''的元素
                        if(ids[0]==''){
                            ids.shift();
                            pre_ids.shift();
                        }
                        if(pre_ids.sort().toString() == ids.sort().toString()){
                            top.$.jBox.tip("未给员工【"+empName+"】分配新成员！", 'info');
                            return false;
                        };
                        // 执行保存
                        loading('正在提交，请稍等...');
                        var idsArr = "";
                        for (var i = 0; i<ids.length; i++) {
                            idsArr = (idsArr + ids[i]) + (((i + 1)== ids.length) ? '':',');
                        }
                        $('#idsArr').val(idsArr);
                        $("#manageId").val(manageId);
                        $('#assignSalemanForm').submit();
                        return true;
                    } else if (v=="clear"){
                        h.find("iframe")[0].contentWindow.clearSalesman();
                        return false;
                    }
                }, loaded:function(h){
                    $(".jbox-content", top.document).css("overflow-y","hidden");
                }
            });
        }

        function showCustomerDiv(id){

            var width = $("#content",window.top.document).width();
            if(width!=undefined){
                width = width-100;
            }else{
                width = 1400;
            }
            var _jBoxConfig = {};
            _jBoxConfig.defaults = {
                opacity: 0.5,
                persistent: true, /* 在显示隔离层的情况下，点击隔离层时，是否坚持窗口不关闭 */
            }
            top.$.jBox.setDefaults(_jBoxConfig);
            top.$.jBox.open("iframe:${ctx}/hrmuser/hrmUser/bindCustomer?id="+id, "客户信息", 810,$(top.document).height()-240, {
                buttons:{"确定分配":"ok", "清除已选":"clear", "关闭":true}, bottomText:"分配客户信息。",submit:function(v, h, f){
                    var pre_ids = h.find("iframe")[0].contentWindow.pre_ids;
                    var ids = h.find("iframe")[0].contentWindow.ids;
                    var manageId = h.find("iframe")[0].contentWindow.hrmManageId;
                    var empName = h.find("iframe")[0].contentWindow.empName;
                    //nodes = selectedTree.getSelectedNodes();
                    if (v=="ok"){
                        // 删除''的元素
                        if(ids[0]==''){
                            ids.shift();
                            pre_ids.shift();
                        }
                        if(pre_ids.sort().toString() == ids.sort().toString()){
                            top.$.jBox.tip("未给员工【"+empName+"】分配客户！", 'info');
                            return false;
                        };
                        // 执行保存
                        loading('正在提交，请稍等...');
                        var idsArr = "";
                        for (var i = 0; i<ids.length; i++) {
                            idsArr = (idsArr + ids[i]) + (((i + 1)== ids.length) ? '':',');
                        }
                        $('#idsCustomerArr').val(idsArr);
                        $("#hrmUserId").val(manageId);
                        $('#assignCustomerForm').submit();
                        return true;
                    } else if (v=="clear"){
                        h.find("iframe")[0].contentWindow.clearSalesman();
                        return false;
                    }
                }, loaded:function(h){
                    $(".jbox-content", top.document).css("overflow-y","hidden");
                }
            });

        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/hrmuser/hrmUser/">内部员工列表</a></li>
		<shiro:hasPermission name="hrmuser:hrmUser:edit"><li><a href="${ctx}/hrmuser/hrmUser/form">内部员工添加</a></li></shiro:hasPermission>
	</ul>
	<form id="assignSalemanForm" action="${ctx}/hrmuser/hrmUser/assignSaleman" method="post" class="hide">
		<input type="hidden" name="manageId" id="manageId" value=""/>
		<input id="idsArr" type="hidden" name="idsArr" value=""/>
	</form>
	<form id="assignCustomerForm" action="${ctx}/hrmuser/hrmUser/assignCustomer" method="post" class="hide">
		<input type="hidden" name="manageId" id="hrmUserId" value=""/>
		<input id="idsCustomerArr" type="hidden" name="idsArr" value=""/>
	</form>

	<form:form id="searchForm" modelAttribute="hrmUser" action="${ctx}/hrmuser/hrmUser/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>职员编号：</label>
				<form:input path="empNumber" htmlEscape="false" maxlength="32" class="input-medium"/>
			</li>
			<li><label>职员名称：</label>
				<form:input path="empName" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>助记码：</label>
				<form:input path="pinyin" htmlEscape="false" maxlength="32" class="input-medium"/>
			</li>
			<li><label>学历：</label>
				<form:select path="education" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('edu_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>QQ号：</label>
				<form:input path="qqNumber" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>手机号：</label>
				<form:input path="mobile" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>邮箱：</label>
				<form:input path="email" htmlEscape="false" maxlength="32" class="input-medium"/>
			</li>
			<li><label>应聘登记时间：</label>
				<input name="beginRegTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${hrmUser.beginRegTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/> - 
				<input name="endRegTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${hrmUser.endRegTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>应聘职务：</label>
				<form:input path="jobObjective" htmlEscape="false" maxlength="32" class="input-medium"/>
			</li>
			<li><label>用户类型：</label>
				<form:select path="userType" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('user_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>公司类型：</label>
				<form:radiobuttons path="companyType" items="${fns:getDictList('user_company_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>

		<ul class="ul-form">
			<li class="btns"><input id="btnBindSalesman" class="btn btn-primary" type="submit" value="绑定业务员"/></li>
			<li class="btns"><input id="btnBindCustomer" class="btn btn-primary" type="submit" value="绑定客户"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>登录用户名</th>
				<th>职员编号</th>
				<th>职员名称</th>
				<th>助记码</th>
				<th>性别</th>
				<th>学历</th>
				<th>QQ号</th>
				<th>手机号</th>
				<th>邮箱</th>
				<th>用户状态</th>
				<th>应聘登记时间</th>
				<th>应聘职务</th>
				<th>紧急联系人电话</th>
				<th>用户类型</th>
				<th>公司类型</th>
				<shiro:hasPermission name="hrmuser:hrmUser:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="hrmUser">
			<tr>
				<td><a href="${ctx}/hrmuser/hrmUser/form?id=${hrmUser.id}">
					${hrmUser.sysUser.name}
				</a></td>
				<td>
					${hrmUser.empNumber}
				</td>
				<td>
					${hrmUser.empName}
				</td>
				<td>
					${hrmUser.pinyin}
				</td>
				<td>
					${fns:getDictLabel(hrmUser.sex, 'sex', '')}
				</td>
				<td>
					${fns:getDictLabel(hrmUser.education, 'edu_type', '')}
				</td>
				<td>
					${hrmUser.qqNumber}
				</td>
				<td>
					${hrmUser.mobile}
				</td>
				<td>
					${hrmUser.email}
				</td>
				<td>
					${fns:getDictLabel(hrmUser.userStatus, 'user_status', '')}
				</td>
				<td>
					<fmt:formatDate value="${hrmUser.regTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${hrmUser.jobObjective}
				</td>
				<td>
					${hrmUser.emergencyContactPhone}
				</td>
				<td>
					${fns:getDictLabel(hrmUser.userType, 'user_type', '')}
				</td>
				<td>
					${fns:getDictLabel(hrmUser.companyType, 'user_company_type', '')}
				</td>
				<shiro:hasPermission name="hrmuser:hrmUser:edit"><td>
    				<a href="${ctx}/hrmuser/hrmUser/form?id=${hrmUser.id}">修改</a>
					<c:if test="${hrmUser.userType=='1'}">
						<a href="javascript:void(0)" onclick="showSaleDiv('${hrmUser.id}')">绑定业务员</a>
					</c:if>
					<c:if test="${hrmUser.userType!='3'}">
						<a href="javascript:void(0)" onclick="showCustomerDiv('${hrmUser.id}')">绑定客户</a>
					</c:if>
					<a href="${ctx}/hrmuser/hrmUser/delete?id=${hrmUser.id}" onclick="return confirmx('确认要删除该内部员工吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>