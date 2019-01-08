<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>采购补差价单管理</title>
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
		<li><a href="${ctx}/purchase/purchaseBackDiffPrice/">采购补差价单列表</a></li>
		<li class="active"><a href="${ctx}/purchase/purchaseBackDiffPrice/form?id=${purchaseBackDiffPrice.id}">采购补差价单<shiro:hasPermission name="purchase:purchaseBackDiffPrice:edit">${not empty purchaseBackDiffPrice.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="purchase:purchaseBackDiffPrice:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="purchaseBackDiffPrice" action="${ctx}/purchase/purchaseBackDiffPrice/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<div class="div-a">
				<label class="control-label">机构id：</label>
				<div class="controls">
					<sys:treeselect id="office" name="office.id" value="${purchaseBackDiffPrice.office.id}" labelName="office.name" labelValue="${purchaseBackDiffPrice.office.name}"
						title="部门" url="/sys/office/treeData?type=2" cssClass="input-large " allowClear="true" notAllowSelectParent="true"/>
				</div>
			</div>
			<div class="div-b">
				<label class="control-label">采购id：</label>
				<div class="controls">
					<form:input path="purchaseId" htmlEscape="false" maxlength="64" class="input-xlarge "/>
				</div>
			</div>
		</div>
		<div class="control-group">
			<div class="div-a">
				<label class="control-label">商品id：</label>
				<div class="controls">
					<form:input path="goodsId" htmlEscape="false" maxlength="64" class="input-xlarge "/>
				</div>
			</div>
			<div class="div-b">
				<label class="control-label">单位退补差价：</label>
				<div class="controls">
					<form:input path="backPriceUnit" htmlEscape="false" class="input-xlarge "/>
				</div>
			</div>
		</div>
		<div class="control-group">
			<div class="div-a">
				<label class="control-label">退补差价总不含税金额：</label>
				<div class="controls">
					<form:input path="backPriceTaxFree" htmlEscape="false" class="input-xlarge "/>
				</div>
			</div>
			<div class="div-b">
				<label class="control-label">退补差价总税额：</label>
				<div class="controls">
					<form:input path="backPriceTotalTax" htmlEscape="false" class="input-xlarge "/>
				</div>
			</div>
		</div>
		<div class="control-group">
			<div class="div-a">
				<label class="control-label">退补差价总含税金额：</label>
				<div class="controls">
					<form:input path="backPriceTaxAmount" htmlEscape="false" class="input-xlarge "/>
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
			<shiro:hasPermission name="purchase:purchaseBackDiffPrice:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>