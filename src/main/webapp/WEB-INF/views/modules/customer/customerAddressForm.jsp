<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>客户收货地址管理</title>
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
		<li><a href="${ctx}/customer/customerAddress/">客户收货地址列表</a></li>
		<li class="active"><a href="${ctx}/customer/customerAddress/form?id=${customerAddress.id}">客户收货地址<shiro:hasPermission name="customer:customerAddress:edit">${not empty customerAddress.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="customer:customerAddress:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="customerAddress" action="${ctx}/customer/customerAddress/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<div class="div-a">
				<label class="control-label">收货人：</label>
				<div class="controls">
					<form:input path="receivingName" htmlEscape="false" maxlength="32" class="input-xlarge "/>
				</div>
			</div>
			<div class="div-b">
				<label class="control-label">区域id：</label>
				<div class="controls">
					<sys:treeselect id="area" name="area.id" value="${customerAddress.area.id}" labelName="area.name" labelValue="${customerAddress.area.name}"
						title="区域" url="/sys/area/treeData" cssClass="input-large " allowClear="true" notAllowSelectParent="true"/>
				</div>
			</div>
		</div>
		<div class="control-group">
			<div class="div-a">
				<label class="control-label">收货地址:街道门牌号：</label>
				<div class="controls">
					<form:input path="receivingAddress" htmlEscape="false" maxlength="255" class="input-xlarge "/>
				</div>
			</div>
			<div class="div-b">
				<label class="control-label">联系人电话：</label>
				<div class="controls">
					<form:input path="contactPhone" htmlEscape="false" maxlength="20" class="input-xlarge "/>
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
			<shiro:hasPermission name="customer:customerAddress:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>