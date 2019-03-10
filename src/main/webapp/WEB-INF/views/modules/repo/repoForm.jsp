<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>仓库管理</title>
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
		<li><a href="${ctx}/repo/repo/">仓库列表</a></li>
		<li class="active"><a href="${ctx}/repo/repo/form?id=${repo.id}">仓库<shiro:hasPermission name="repo:repo:edit">${not empty repo.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="repo:repo:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="repo" action="${ctx}/repo/repo/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<div class="div-a">
				<label class="control-label">仓库名称：</label>
				<div class="controls">
					<form:input path="repoName" htmlEscape="false" maxlength="255" class="input-xlarge required"/>
					<span class="help-inline"><font color="red">*</font> </span>
				</div>
			</div>
			<div class="div-b">
				<label class="control-label">仓库类型:1-整件仓 2-散件仓 3-赠品库：</label>
				<div class="controls">
					<form:input path="repoType" htmlEscape="false" maxlength="1" class="input-xlarge required"/>
					<span class="help-inline"><font color="red">*</font> </span>
				</div>
			</div>
		</div>
		<div class="control-group">
			<div class="div-a">
				<label class="control-label">是否停用：</label>
				<div class="controls">
					<form:input path="isStop" htmlEscape="false" maxlength="1" class="input-xlarge "/>
				</div>
			</div>
			<div class="div-b">
				<label class="control-label">是否暂停入库：</label>
				<div class="controls">
					<form:input path="isPauseIn" htmlEscape="false" maxlength="1" class="input-xlarge "/>
				</div>
			</div>
		</div>
		<div class="control-group">
			<div class="div-a">
				<label class="control-label">是否暂停出库：</label>
				<div class="controls">
					<form:input path="isPauseOut" htmlEscape="false" maxlength="1" class="input-xlarge "/>
				</div>
			</div>
			<div class="div-b">
				<label class="control-label">备注信息：</label>
				<div class="controls">
					<form:input path="repoDesc" htmlEscape="false" maxlength="255" class="input-xlarge required"/>
					<span class="help-inline"><font color="red">*</font> </span>
				</div>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="repo:repo:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>