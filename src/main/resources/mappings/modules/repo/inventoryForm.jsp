<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>盘点表管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/repo/inventory/">盘点表列表</a></li>
		<li class="active"><a href="${ctx}/repo/inventory/form?id=${inventory.id}">盘点表<shiro:hasPermission name="repo:inventory:edit">${not empty inventory.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="repo:inventory:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="inventory" action="${ctx}/repo/inventory/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<div class="div-a">
				<label class="control-label">单据编号：</label>
				<div class="controls">
					<form:input path="docNumber" htmlEscape="false" maxlength="32" class="input-xlarge "/>
				</div>
			</div>
			<div class="div-b">
				<label class="control-label">单据状态：</label>
				<div class="controls">
					<form:input path="status" htmlEscape="false" maxlength="1" class="input-xlarge "/>
				</div>
			</div>
		</div>
		<div class="control-group">
			<div class="div-a">
				<label class="control-label">盘点仓库：</label>
				<div class="controls">
					<form:input path="repoId" htmlEscape="false" maxlength="64" class="input-xlarge "/>
				</div>
			</div>
			<div class="div-b">
				<label class="control-label">盘点人姓名：</label>
				<div class="controls">
					<form:input path="inventoryName" htmlEscape="false" maxlength="32" class="input-xlarge "/>
				</div>
			</div>
		</div>
		<div class="control-group">
			<div class="div-a">
				<label class="control-label">盘点时间：</label>
				<div class="controls">
					<input name="inventoryTime" type="text" readonly="readonly" maxlength="20" class="input-xlarge Wdate "
						value="<fmt:formatDate value="${inventory.inventoryTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
						onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
				</div>
			</div>
			<div class="div-b">
				<label class="control-label">备注信息：</label>
				<div class="controls">
					<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xlarge "/>
				</div>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="repo:inventory:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>