<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>库存查询管理</title>
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
		<li><a href="${ctx}/repo/stock/">库存查询列表</a></li>
		<li class="active"><a href="${ctx}/repo/stock/form?id=${stock.id}">库存查询<shiro:hasPermission name="repo:stock:edit">${not empty stock.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="repo:stock:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="stock" action="${ctx}/repo/stock/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<div class="div-a">
				<label class="control-label">仓库：</label>
				<div class="controls">
					<form:input path="repoId" htmlEscape="false" maxlength="64" class="input-xlarge "/>
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
				<label class="control-label">商品数量：</label>
				<div class="controls">
					<form:input path="stockNum" htmlEscape="false" maxlength="11" class="input-xlarge "/>
				</div>
			</div>
			<div class="div-b">
				<label class="control-label">采购员：</label>
				<div class="controls">
					<form:input path="salemanId" htmlEscape="false" maxlength="64" class="input-xlarge "/>
				</div>
			</div>
		</div>
		<div class="control-group">
			<div class="div-a">
				<label class="control-label">入库时间：</label>
				<div class="controls">
					<input name="goodsFirstRepoTime" type="text" readonly="readonly" maxlength="20" class="input-xlarge Wdate "
						value="<fmt:formatDate value="${stock.goodsFirstRepoTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
						onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
				</div>
			</div>
			<div class="div-b">
				<label class="control-label">整件件数：</label>
				<div class="controls">
					<form:input path="wholeNumber" htmlEscape="false" maxlength="11" class="input-xlarge "/>
				</div>
			</div>
		</div>
		<div class="control-group">
			<div class="div-a">
				<label class="control-label">不含税金额：</label>
				<div class="controls">
					<form:input path="taxFree" htmlEscape="false" class="input-xlarge "/>
				</div>
			</div>
			<div class="div-b">
				<label class="control-label">占用数量：</label>
				<div class="controls">
					<form:input path="occupyNum" htmlEscape="false" maxlength="11" class="input-xlarge "/>
				</div>
			</div>
		</div>
		<div class="control-group">
			<div class="div-a">
				<label class="control-label">散件件数：</label>
				<div class="controls">
					<form:input path="piecesNumber" htmlEscape="false" maxlength="11" class="input-xlarge "/>
				</div>
			</div>
			<div class="div-b">
				<label class="control-label">含税金额：</label>
				<div class="controls">
					<form:input path="tax" htmlEscape="false" class="input-xlarge "/>
				</div>
			</div>
		</div>
		<div class="control-group">
			<div class="div-a">
				<label class="control-label">税额：</label>
				<div class="controls">
					<form:input path="taxAmount" htmlEscape="false" class="input-xlarge "/>
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
			<shiro:hasPermission name="repo:stock:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>