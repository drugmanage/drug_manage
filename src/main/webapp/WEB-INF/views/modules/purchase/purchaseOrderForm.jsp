<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>采购订单管理</title>
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
		<li><a href="${ctx}/purchase/purchaseOrder/">采购订单列表</a></li>
		<li class="active"><a href="${ctx}/purchase/purchaseOrder/form?id=${purchaseOrder.id}">采购订单<shiro:hasPermission name="purchase:purchaseOrder:edit">${not empty purchaseOrder.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="purchase:purchaseOrder:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<h1>江西赣鑫医药有限公司 订货单</h1>
	<form:form id="inputForm" modelAttribute="purchaseOrder" action="${ctx}/purchase/purchaseOrder/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<div class="div-a">
				<label class="control-label">机构：</label>
				<div class="controls">
					<sys:treeselect id="office" name="office.id" value="${purchaseOrder.office.id}" labelName="office.name" labelValue="${purchaseOrder.office.name}"
						title="部门" url="/sys/office/treeData?type=2" cssClass="input-large " allowClear="true" notAllowSelectParent="true"/>
				</div>
			</div>
			<div class="div-b">
				<label class="control-label">单据编号：</label>
				<div class="controls">
					<form:input path="purchaseNumber" htmlEscape="false" maxlength="10" class="input-xlarge "/>
				</div>
			</div>
		</div>
		<div class="control-group">
			<div class="div-a">
				<label class="control-label">供应商：</label>
				<div class="controls">
					<form:input path="supplierId" htmlEscape="false" maxlength="64" class="input-xlarge "/>
				</div>
			</div>
			<div class="div-b">
				<label class="control-label">采购员：</label>
				<div class="controls">
					<form:input path="purchaseId" htmlEscape="false" maxlength="64" class="input-xlarge "/>
				</div>
			</div>
		</div>
		<div class="control-group">
			<div class="div-a">
				<label class="control-label">订单日期：</label>
				<div class="controls">
					<input name="orderTime" type="text" readonly="readonly" maxlength="20" class="input-xlarge Wdate "
						value="<fmt:formatDate value="${purchaseOrder.orderTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
						onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
				</div>
			</div>
			<div class="div-b">
				<label class="control-label">摘要：</label>
				<div class="controls">
					<form:input path="summary" htmlEscape="false" maxlength="500" class="input-xlarge "/>
				</div>
			</div>
		</div>
		<div class="control-group">
			<div class="div-a">
				<label class="control-label">对方业务员：</label>
				<div class="controls">
					<form:input path="salespersonId" htmlEscape="false" maxlength="64" class="input-xlarge "/>
				</div>
			</div>
			<div class="div-b">
				<label class="control-label">入库仓库：</label>
				<div class="controls">
					<form:input path="storehouse" htmlEscape="false" maxlength="3" class="input-xlarge "/>
				</div>
			</div>
		</div>
		<div class="control-group">
			<div class="div-a">
				<label class="control-label">业务组：</label>
				<div class="controls">
					<form:input path="bizGroup" htmlEscape="false" maxlength="32" class="input-xlarge "/>
				</div>
			</div>
			<div class="div-b">
				<label class="control-label">备注信息：</label>
				<div class="controls">
					<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xlarge "/>
				</div>
			</div>
		</div>
		<table id="contentTable" class="table table-striped table-bordered table-condensed">
			<thead>
			<tr>
				<th>药品编码</th>
				<th>品名</th>
				<th>规格</th>
				<th>剂型</th>
				<th>生产企业</th>
				<th>单位</th>
				<th>内装数</th>
				<th>单价</th>
				<th>采购数量</th>
				<th>金额</th>
				<th>当前库存</th>
				<th>已到货数</th>
				<shiro:hasPermission name="purchase:purchaseOrder:edit"><th>操作</th></shiro:hasPermission>
			</tr>
			</thead>
			<tbody>
			<c:forEach items="${page.list}" var="purchaseOrder">
				<tr>
					<td><a href="${ctx}/purchase/purchaseOrder/form?id=${purchaseOrder.id}">
							${purchaseOrder.office.name}
					</a></td>
					<td>
							${purchaseOrder.purchaseNumber}
					</td>
					<td>
							${purchaseOrder.supplierId}
					</td>
					<td>
							${purchaseOrder.purchaseId}
					</td>
					<td>
						<fmt:formatDate value="${purchaseOrder.orderTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
					</td>
					<td>
							${purchaseOrder.summary}
					</td>
					<td>
							${purchaseOrder.salespersonId}
					</td>
					<td>
							${purchaseOrder.storehouse}
					</td>
					<td>
							${purchaseOrder.bizGroup}
					</td>
					<td>
						<fmt:formatDate value="${purchaseOrder.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
					</td>
					<td>
							${purchaseOrder.remarks}
					</td>
					<td>
							${purchaseOrder.remarks}
					</td>
					<shiro:hasPermission name="purchase:purchaseOrder:edit"><td>
						<a href="${ctx}/purchase/purchaseOrder/form?id=${purchaseOrder.id}">修改</a>
						<a href="${ctx}/purchase/purchaseOrder/delete?id=${purchaseOrder.id}" onclick="return confirmx('确认要删除该采购订单吗？', this.href)">删除</a>
					</td></shiro:hasPermission>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		<div class="pagination">${page}</div>
		<div class="form-actions">
			<shiro:hasPermission name="purchase:purchaseOrder:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>