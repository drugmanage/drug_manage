<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>委托人管理</title>
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
		<li><a href="${ctx}/customer/customerConsigner/">委托人列表</a></li>
		<li class="active"><a href="${ctx}/customer/customerConsigner/form?id=${customerConsigner.id}">委托人<shiro:hasPermission name="customer:customerConsigner:edit">${not empty customerConsigner.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="customer:customerConsigner:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="customerConsigner" action="${ctx}/customer/customerConsigner/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<div class="div-a">
				<label class="control-label">联系人：</label>
				<div class="controls">
					<form:input path="contactsName" htmlEscape="false" maxlength="32" class="input-xlarge "/>
				</div>
			</div>
			<div class="div-b">
				<label class="control-label">性别：</label>
				<div class="controls">
					<form:input path="sex" htmlEscape="false" maxlength="1" class="input-xlarge "/>
				</div>
			</div>
		</div>
		<div class="control-group">
			<div class="div-a">
				<label class="control-label">电话：</label>
				<div class="controls">
					<form:input path="phone" htmlEscape="false" maxlength="20" class="input-xlarge "/>
				</div>
			</div>
			<div class="div-b">
				<label class="control-label">证件号：</label>
				<div class="controls">
					<form:input path="certNumber" htmlEscape="false" maxlength="32" class="input-xlarge "/>
				</div>
			</div>
		</div>
		<div class="control-group">
			<div class="div-a">
				<label class="control-label">未投入有效期：</label>
				<div class="controls">
					<form:input path="consignerVali" htmlEscape="false" maxlength="4" class="input-xlarge "/>
				</div>
			</div>
			<div class="div-b">
				<label class="control-label">委托书：</label>
				<div class="controls">
					<form:input path="proxyBook" htmlEscape="false" maxlength="64" class="input-xlarge "/>
				</div>
			</div>
		</div>
		<div class="control-group">
			<div class="div-a">
				<label class="control-label">委托书有效期：</label>
				<div class="controls">
					<form:input path="proxyBookVali" htmlEscape="false" maxlength="4" class="input-xlarge "/>
				</div>
			</div>
			<div class="div-b">
				<label class="control-label">委托书图片路径：</label>
				<div class="controls">
					<form:input path="proxyBookImgBook" htmlEscape="false" maxlength="128" class="input-xlarge "/>
				</div>
			</div>
		</div>
		<div class="control-group">
			<div class="div-a">
				<label class="control-label">身份证图片路径：</label>
				<div class="controls">
					<form:input path="idCardImgBook" htmlEscape="false" maxlength="128" class="input-xlarge "/>
				</div>
			</div>
			<div class="div-b">
				<label class="control-label">是否停用            0、未停用            1、停用：</label>
				<div class="controls">
					<form:input path="stopFlag" htmlEscape="false" maxlength="1" class="input-xlarge "/>
				</div>
			</div>
		</div>
		<div class="control-group">
			<div class="div-a">
				<label class="control-label">备注信息：</label>
				<div class="controls">
					<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xlarge "/>
				</div>
			</div>
		<div class="form-actions">
			<shiro:hasPermission name="customer:customerConsigner:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>