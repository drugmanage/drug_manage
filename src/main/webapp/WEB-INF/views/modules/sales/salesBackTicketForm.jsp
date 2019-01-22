<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>销售退回开票单管理</title>
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
		<li><a href="${ctx}/sales/salesBackTicket/">销售退回开票单列表</a></li>
		<li class="active"><a href="${ctx}/sales/salesBackTicket/form?id=${salesBackTicket.id}">销售退回开票单<shiro:hasPermission name="sales:salesBackTicket:edit">${not empty salesBackTicket.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="sales:salesBackTicket:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="salesBackTicket" action="${ctx}/sales/salesBackTicket/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<div class="div-a">
				<label class="control-label">销售单：</label>
				<div class="controls">
					<form:input path="salesOrder.id" htmlEscape="false" maxlength="64" class="input-xlarge "/>
				</div>
			</div>
			<div class="div-b">
				<label class="control-label">商品：</label>
				<div class="controls">
					<form:input path="goodsId" htmlEscape="false" maxlength="64" class="input-xlarge "/>
				</div>
			</div>
		</div>
		<div class="control-group">
			<div class="div-a">
				<label class="control-label">单位退货数量：</label>
				<div class="controls">
					<form:input path="unitBackNumber" htmlEscape="false" class="input-xlarge "/>
				</div>
			</div>
			<div class="div-b">
				<label class="control-label">总不含税金额：</label>
				<div class="controls">
					<form:input path="backPriceTaxFree" htmlEscape="false" class="input-xlarge "/>
				</div>
			</div>
		</div>
		<div class="control-group">
			<div class="div-a">
				<label class="control-label">总税额：</label>
				<div class="controls">
					<form:input path="backPriceTotalTax" htmlEscape="false" class="input-xlarge "/>
				</div>
			</div>
			<div class="div-b">
				<label class="control-label">总含税金额：</label>
				<div class="controls">
					<form:input path="backPriceTaxAmount" htmlEscape="false" class="input-xlarge "/>
				</div>
			</div>
		</div>
		<div class="control-group">
			<div class="div-a">
				<label class="control-label">退货原因：</label>
				<div class="controls">
					<form:input path="returnReason" htmlEscape="false" maxlength="2" class="input-xlarge "/>
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
			<shiro:hasPermission name="sales:salesBackTicket:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>