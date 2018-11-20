<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>证件模板管理</title>
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
		<li><a href="${ctx}/customer/customerDocumentTemplate/">证件模板列表</a></li>
		<li class="active"><a href="${ctx}/customer/customerDocumentTemplate/form?id=${customerDocumentTemplate.id}">证件模板<shiro:hasPermission name="customer:customerDocumentTemplate:edit">${not empty customerDocumentTemplate.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="customer:customerDocumentTemplate:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="customerDocumentTemplate" action="${ctx}/customer/customerDocumentTemplate/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<div class="div-a">
				<label class="control-label">证件名称：</label>
				<div class="controls">
					<form:input path="name" htmlEscape="false" maxlength="64" class="input-xlarge "/>
				</div>
			</div>
			<div class="div-b">
				<label class="control-label">证书编码：</label>
				<div class="controls">
					<form:input path="certCode" htmlEscape="false" maxlength="64" class="input-xlarge "/>
				</div>
			</div>
		</div>
		<div class="control-group">
			<div class="div-a">
				<label class="control-label">发证机关：</label>
				<div class="controls">
					<form:input path="issuingOrgan" htmlEscape="false" maxlength="128" class="input-xlarge "/>
				</div>
			</div>
			<div class="div-b">
				<label class="control-label">发证日期：</label>
				<div class="controls">
					<input name="dateIssue" type="text" readonly="readonly" maxlength="20" class="input-xlarge Wdate "
						value="<fmt:formatDate value="${customerDocumentTemplate.dateIssue}" pattern="yyyy-MM-dd HH:mm:ss"/>"
						onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
				</div>
			</div>
		</div>
		<div class="control-group">
			<div class="div-a">
				<label class="control-label">有效期至：</label>
				<div class="controls">
					<input name="validityDate" type="text" readonly="readonly" maxlength="20" class="input-xlarge Wdate "
						value="<fmt:formatDate value="${customerDocumentTemplate.validityDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
						onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
				</div>
			</div>
			<div class="div-b">
				<label class="control-label">图片路径：</label>
				<div class="controls">
					<form:hidden id="imgPath" path="imgPath" htmlEscape="false" maxlength="128" class="input-xlarge"/>
					<sys:ckfinder input="imgPath" type="files" uploadPath="/customer/customerDocumentTemplate" selectMultiple="true"/>
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
			<shiro:hasPermission name="customer:customerDocumentTemplate:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>