<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>开票信息管理</title>
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
		<li><a href="${ctx}/customer/customerInvoiceInfo/">开票信息列表</a></li>
		<li class="active"><a href="${ctx}/customer/customerInvoiceInfo/form?id=${customerInvoiceInfo.id}">开票信息<shiro:hasPermission name="customer:customerInvoiceInfo:edit">${not empty customerInvoiceInfo.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="customer:customerInvoiceInfo:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="customerInvoiceInfo" action="${ctx}/customer/customerInvoiceInfo/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<div class="div-a">
				<label class="control-label">开户名称：</label>
				<div class="controls">
					<form:input path="accountName" htmlEscape="false" maxlength="64" class="input-xlarge "/>
				</div>
			</div>
			<div class="div-b">
				<label class="control-label">开户行：</label>
				<div class="controls">
					<form:input path="bankDeposit" htmlEscape="false" maxlength="128" class="input-xlarge "/>
				</div>
			</div>
		</div>
		<div class="control-group">
			<div class="div-a">
				<label class="control-label">区域id：</label>
				<div class="controls">
					<sys:treeselect id="area" name="area.id" value="${customerInvoiceInfo.area.id}" labelName="area.name" labelValue="${customerInvoiceInfo.area.name}"
						title="区域" url="/sys/area/treeData" cssClass="input-large " allowClear="true" notAllowSelectParent="true"/>
				</div>
			</div>
			<div class="div-b">
				<label class="control-label">详细地址：</label>
				<div class="controls">
					<form:input path="detailAddress" htmlEscape="false" maxlength="255" class="input-xlarge "/>
				</div>
			</div>
		</div>
		<div class="control-group">
			<div class="div-a">
				<label class="control-label">联系电话：</label>
				<div class="controls">
					<form:input path="phone" htmlEscape="false" maxlength="20" class="input-xlarge "/>
				</div>
			</div>
			<div class="div-b">
				<label class="control-label">账号：</label>
				<div class="controls">
					<form:input path="accountNumber" htmlEscape="false" maxlength="64" class="input-xlarge "/>
				</div>
			</div>
		</div>
		<div class="control-group">
			<div class="div-a">
				<label class="control-label">税号：</label>
				<div class="controls">
					<form:input path="dutyParagraph" htmlEscape="false" maxlength="64" class="input-xlarge "/>
				</div>
			</div>
			<div class="div-b">
				<label class="control-label">开票图片路径：</label>
				<div class="controls">
					<form:input path="invoicePath" htmlEscape="false" maxlength="128" class="input-xlarge "/>
				</div>
			</div>
		</div>
		<div class="control-group">
			<div class="div-a">
				<label class="control-label">是否停用            0、未停用            1、停用：</label>
				<div class="controls">
					<form:input path="stopFlag" htmlEscape="false" maxlength="1" class="input-xlarge "/>
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
			<shiro:hasPermission name="customer:customerInvoiceInfo:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>