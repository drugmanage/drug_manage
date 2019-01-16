<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>业务员定价管理</title>
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
		<li><a href="${ctx}/valuation/saleValuation/">业务员定价列表</a></li>
		<li class="active"><a href="${ctx}/valuation/saleValuation/form?id=${saleValuation.id}">业务员定价<shiro:hasPermission name="valuation:saleValuation:edit">${not empty saleValuation.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="valuation:saleValuation:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="saleValuation" action="${ctx}/valuation/saleValuation/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<div class="div-a">
				<label class="control-label">业务员id：</label>
				<div class="controls">
					<form:input path="saleId" htmlEscape="false" maxlength="64" class="input-xlarge "/>
				</div>
			</div>
			<div class="div-b">
				<label class="control-label">商品id：</label>
				<div class="controls">
					<form:input path="goodsId" htmlEscape="false" maxlength="64" class="input-xlarge "/>
				</div>
			</div>
		</div>
		<div class="control-group">
			<div class="div-a">
				<label class="control-label">一类价格：</label>
				<div class="controls">
					<form:input path="onePrice" htmlEscape="false" class="input-xlarge  number"/>
				</div>
			</div>
			<div class="div-b">
				<label class="control-label">设置客户一类价格关联id：</label>
				<div class="controls">
					<form:input path="onePriceCustomerLkId" htmlEscape="false" maxlength="64" class="input-xlarge "/>
				</div>
			</div>
		</div>
		<div class="control-group">
			<div class="div-a">
				<label class="control-label">二类价格：</label>
				<div class="controls">
					<form:input path="twoPrice" htmlEscape="false" class="input-xlarge  number"/>
				</div>
			</div>
			<div class="div-b">
				<label class="control-label">设置客户二类价格关联id：</label>
				<div class="controls">
					<form:input path="twoPriceCustomerLkId" htmlEscape="false" maxlength="64" class="input-xlarge "/>
				</div>
			</div>
		</div>
		<div class="control-group">
			<div class="div-a">
				<label class="control-label">三类价格：</label>
				<div class="controls">
					<form:input path="threePrice" htmlEscape="false" class="input-xlarge  number"/>
				</div>
			</div>
			<div class="div-b">
				<label class="control-label">设置客户三类价格关联id：</label>
				<div class="controls">
					<form:input path="threePriceCustomerLkId" htmlEscape="false" maxlength="64" class="input-xlarge "/>
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
			<shiro:hasPermission name="valuation:saleValuation:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>