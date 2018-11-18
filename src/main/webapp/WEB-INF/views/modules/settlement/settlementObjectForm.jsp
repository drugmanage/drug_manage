<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>结算对象信息管理</title>
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
		<li><a href="${ctx}/settlement/settlementObject/">结算对象信息列表</a></li>
		<li class="active"><a href="${ctx}/settlement/settlementObject/form?id=${settlementObject.id}">结算对象信息<shiro:hasPermission name="settlement:settlementObject:edit">${not empty settlementObject.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="settlement:settlementObject:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="settlementObject" action="${ctx}/settlement/settlementObject/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<div class="div-a">
				<label class="control-label">结算对象：</label>
				<div class="controls">
					<form:input path="outerId" htmlEscape="false" maxlength="64" class="input-xlarge "/>
				</div>
			</div>
			<div class="div-b">
				<label class="control-label">结算对象类型：</label>
				<div class="controls">
					<form:select path="settlementType" class="input-xlselect ">
						<form:option value="" label=""/>
						<form:options items="${fns:getDictList('settlement_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					</form:select>
				</div>
			</div>
		</div>
		<div class="control-group">
			<div class="div-a">
				<label class="control-label">底价点：</label>
				<div class="controls">
					<form:input path="bottomPricePoint" htmlEscape="false" class="input-xlarge  number"/>
				</div>
			</div>
			<div class="div-b">
				<label class="control-label">搬运费：</label>
				<div class="controls">
					<form:input path="handlingCost" htmlEscape="false" class="input-xlarge  number"/>
				</div>
			</div>
		</div>
		<div class="control-group">
			<div class="div-a">
				<label class="control-label">清单费：</label>
				<div class="controls">
					<form:input path="bills" htmlEscape="false" class="input-xlarge  number"/>
				</div>
			</div>
			<div class="div-b">
				<label class="control-label">运费：</label>
				<div class="controls">
					<form:input path="freight" htmlEscape="false" class="input-xlarge  number"/>
				</div>
			</div>
		</div>
		<div class="control-group">
			<div class="div-a">
				<label class="control-label">上货费：</label>
				<div class="controls">
					<form:input path="exhibitCost" htmlEscape="false" class="input-xlarge  number"/>
				</div>
			</div>
			<div class="div-b">
				<label class="control-label">下货费：</label>
				<div class="controls">
					<form:input path="deliveryFee" htmlEscape="false" class="input-xlarge  number"/>
				</div>
			</div>
		</div>
		<div class="control-group">
			<div class="div-a">
				<label class="control-label">本方网营品种结算价格类别：</label>
				<div class="controls">
					<form:input path="partyPriceType" htmlEscape="false" maxlength="2" class="input-xlarge "/>
				</div>
			</div>
			<div class="div-b">
				<label class="control-label">他人网营品种结算价格类别：</label>
				<div class="controls">
					<form:input path="otherPriceType" htmlEscape="false" maxlength="2" class="input-xlarge "/>
				</div>
			</div>
		</div>
		<div class="control-group">
			<div class="div-a">
				<label class="control-label">是否本方标识：</label>
				<div class="controls">
					<form:radiobuttons path="partyFlag" items="${fns:getDictList('party_flag')}" itemLabel="label" itemValue="value" htmlEscape="false" class=""/>
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
			<shiro:hasPermission name="settlement:settlementObject:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>