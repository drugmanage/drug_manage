<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>销售开票单管理</title>
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
			//Tab页签
            $('#myTab a:first').tab('show');
            $('#myTab a').click(function (e) {
                e.preventDefault();
                $(this).tab('show');
            });
		});
		
		function appendHtml(newMaxId, goodsStr) {
            var goods = {
                "id": "",
                "goodsCode": "",
                "goodsName": "",
                "goodsSpec": "",
                "goodsType": "",
                "manufacturer": "",
                "unit": "",
                "content": "",
                "repoId":"",
                "cargoNumber": "",
                "lotNumber": "",
                "validDateUntil": "",
                "number": "",
                "billingPrice": "",
                "settlementPrice": "",
                "highPrice": "",
                "tax": "",
                "taxFree": "",
                "taxAmount": "",
                "taxRate": ""
            };
            var goodsAttr = goodsStr.split(",")
            for (let i = 0; i < goodsAttr.length; i++) {
                const element = goodsAttr[i];
                var attr = element.split("=");
                // 为需要的属性赋值
                if (attr[0] == "id") {
                    goods.id = attr[1];
                } else if (attr[0] == "goodsCode") {
                    goods.goodsCode = attr[1];
                } else if (attr[0] == "goodsName") {
                    goods.goodsName = attr[1];
                } else if (attr[0] == "goodsSpec") {
                    goods.goodsSpec = attr[1];
                } else if (attr[0] == "goodsType") {
                    goods.goodsType = attr[1];
                } else if (attr[0] == "manufacturer") {
                    goods.manufacturer = attr[1];
                } else if (attr[0] == "unit") {
                    goods.unit = attr[1];
                } else if (attr[0] == "content") {
                    goods.content = attr[1];
                } else if (attr[0] == "repoId") {
                    goods.repoId = attr[1];
                } else if (attr[0] == "cargoNumber") {
                    goods.cargoNumber = attr[1];
                } else if (attr[0] == "lotNumber") {
                    goods.lotNumber = attr[1];
                } else if (attr[0] == "validDateUntil") {
                    goods.validDateUntil = attr[1];
                } else if (attr[0] == "tax") {
                    goods.tax = attr[1];
                } else if (attr[0] == "taxFree") {
                    goods.taxFree = attr[1];
                } else if (attr[0] == "taxAmount") {
                    goods.taxAmount = attr[1];
                } else if (attr[0] == "taxRate") {
                    goods.taxRate = attr[1];
                } else if (attr[0] == "number") {
                    goods.number = attr[1];
                } else if (attr[0] == "billingPrice") {
                    goods.billingPrice = attr[1];
                } else if (attr[0] == "settlementPrice") {
                    goods.settlementPrice = attr[1];
                } else if (attr[0] == "highPrice") {
                    goods.highPrice = attr[1];
                }
            }

            var trStr = '<tr id="sales_tr_' + newMaxId + '">'
                + '<td>'
                + '<input type="hidden" name="itemGoodsId" value="' + newMaxId + '"/>'
                + '<input type="hidden" name="goodsList[' + newMaxId + '].goodsId" value="' + goods.id + '"/>'
                + '<input type="text" name="goodsList[' + newMaxId + '].goodsCode" value="' + goods.goodsCode + '" readonly="readonly"/>'
                + '</td>'
                + '<td>'
                + '<input type="text" name="goodsList[' + newMaxId + '].goodsName" value="' + goods.goodsName + '" readonly="readonly"/>'
                + '</td>'
                + '<td>'
                + '<input type="text" name="goodsList[' + newMaxId + '].goodsSpec" value="' + goods.goodsSpec + '" readonly="readonly"/>'
                + '</td>'
                + '<td>'
                + '<input type="text" name="goodsList[' + newMaxId + '].goodsType" value="' + goods.goodsType + '" readonly="readonly"/>'
                + '</td>'
                + '<td>'
                + '<input type="text" name="goodsList[' + newMaxId + '].manufacturer" value="' + goods.manufacturer + '" readonly="readonly"/>'
                + '</td>'
                + '<td>'
                + '<input type="text" name="goodsList[' + newMaxId + '].unit" value="' + goods.unit + '" readonly="readonly"/>'
                + '</td>'
                + '<td>'
                + '<input type="text" name="goodsList[' + newMaxId + '].content" value="' + goods.content + '" readonly="readonly"/>'
                + '</td>'
                + '<td>'
                + '<input type="text" class="table-form-control" name="goodsList[' + newMaxId + '].repoId" value="" valid="vtext"/>'
                + '</td>'
                + '<td>'
                + '<input type="text" class="table-form-control" name="goodsList[' + newMaxId + '].cargoNumber" value="" valid="vtext"/>'
                + '</td>'
                + '<td>'
                + '<input type="text" name="goodsList[' + newMaxId + '].lotNumber" value="' + goods.lotNumber + '" readonly="readonly"/>'
                + '</td>'
                + '<td>'
                + '<input type="text" name="goodsList[' + newMaxId + '].validDateUntil" value="' + goods.validDateUntil + '" readonly="readonly"/>'
                + '</td>'
                + '<td>'
                + '<input type="text" class="table-form-control" name="goodsList[' + newMaxId + '].number" value="" valid="vtext"/>'
                + '</td>'
                + '<td>'
                + '<input type="text" class="table-form-control" name="goodsList[' + newMaxId + '].billingPrice" value="" valid="vtext"/>'
                + '</td>'
                + '<td>'
                + '<input type="text" class="table-form-control" name="goodsList[' + newMaxId + '].settlementPrice" value="" valid="vtext"/>'
                + '</td>'
                + '<td>'
                + '<input type="text" class="table-form-control" name="goodsList[' + newMaxId + '].highPrice" value="" valid="vtext"/>'
                + '</td>'
                + '<td>'
                + '<input type="text" name="goodsList[' + newMaxId + '].tax" value="' + goods.tax + '" readonly="readonly"/>'
                + '</td>'
                + '<td>'
                + '<input type="text" name="goodsList[' + newMaxId + '].taxFree" value="' + goods.taxFree + '" readonly="readonly"/>'
                + '</td>'
                + '<td>'
                + '<input type="text" name="goodsList[' + newMaxId + '].taxAmount" value="' + goods.taxAmount + '" readonly="readonly"/>'
                + '</td>'
                + '<td>'
                + '<input type="text" name="goodsList[' + newMaxId + '].taxRate" value="' + goods.taxRate + '" readonly="readonly"/>'
                + '</td>'
                + '<shiro:hasPermission name="sales:salesOrder:edit"><td>'
                + '<a href="javascript:void(0)" class="btnDel" onclick="oper.sales.del(' + newMaxId + ');">删除</a>'
                + '</td></shiro:hasPermission>'
                + '</tr>';
            var html = trStr;
            return html;
        }
	</script>
	<%@include file="/WEB-INF/views/modules/sales/salesOrderJs.jsp" %>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/sales/salesOrder/">销售开票单列表</a></li>
		<li class="active"><a href="${ctx}/sales/salesOrder/form?id=${salesOrder.id}">销售开票单<shiro:hasPermission name="sales:salesOrder:edit">${not empty salesOrder.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="sales:salesOrder:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="salesOrder" action="${ctx}/sales/salesOrder/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>
		<ul class="nav nav-tabs" id="myTab">
	        <li class="active"><a href="#baseInfo">销售订单基本信息</a></li>
	        <li><a href="#goodsInfo">销售商品列表</a></li>
	    </ul>
		<div class="tab-content">
        	<div class="tab-pane active" id="baseInfo">
        		<div class="control-group">
					<div class="div-a">
						<label class="control-label">单据编号：</label>
						<div class="controls">
							<form:input path="documentNum" htmlEscape="false" maxlength="32" class="input-xlarge "/>
						</div>
					</div>
					<div class="div-b">
						<label class="control-label">单据状态：</label>
						<div class="controls">
							<form:input path="status" htmlEscape="false" maxlength="2" class="input-xlarge "/>
						</div>
					</div>
				</div>
				<div class="control-group">
					<div class="div-a">
						<label class="control-label">订单号：</label>
						<div class="controls">
							<form:input path="orderNum" htmlEscape="false" maxlength="32" class="input-xlarge "/>
						</div>
					</div>
					<div class="div-b">
						<label class="control-label">制单日期：</label>
						<div class="controls">
							<input name="orderTime" type="text" readonly="readonly" maxlength="20" class="input-xlarge Wdate "
								value="<fmt:formatDate value="${salesOrder.orderTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
								onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
						</div>
					</div>
				</div>
				<div class="control-group">
					<div class="div-a">
						<label class="control-label">出货仓库：</label>
						<div class="controls">
							<form:input path="repoId" htmlEscape="false" maxlength="64" class="input-xlarge "/>
						</div>
					</div>
					<div class="div-b">
						<label class="control-label">客户名称：</label>
						<div class="controls">
							<form:input path="customerName" htmlEscape="false" maxlength="32" class="input-xlarge "/>
						</div>
					</div>
				</div>
				<div class="control-group">
					<div class="div-a">
						<label class="control-label">发票类型：</label>
						<div class="controls">
							<form:select path="invoiceType" class="input-xlselect ">
								<form:option value="" label=""/>
								<form:options items="${fns:getDictList('invoice_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
							</form:select>
						</div>
					</div>
					<div class="div-b">
						<label class="control-label">货运类型：</label>
						<div class="controls">
							<form:select path="freightType" class="input-xlselect ">
								<form:option value="" label=""/>
								<form:options items="${fns:getDictList('freight_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
							</form:select>
						</div>
					</div>
				</div>
				<div class="control-group">
					<div class="div-a">
						<label class="control-label">结算对象：</label>
						<div class="controls">
							<form:input path="settlementObjectId" htmlEscape="false" maxlength="64" class="input-xlarge "/>
						</div>
					</div>
					<div class="div-b">
						<label class="control-label">区域经理：</label>
						<div class="controls">
							<form:input path="manageId" htmlEscape="false" maxlength="64" class="input-xlarge "/>
						</div>
					</div>
				</div>
				<div class="control-group">
					<div class="div-a">
						<label class="control-label">业务员：</label>
						<div class="controls">
							<form:input path="salemanId" htmlEscape="false" maxlength="64" class="input-xlarge "/>
						</div>
					</div>
					<div class="div-b">
						<label class="control-label">单据属性：</label>
						<div class="controls">
							<form:select path="documentAttr" class="input-xlselect ">
								<form:option value="" label=""/>
								<form:options items="${fns:getDictList('document_attr')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
							</form:select>
						</div>
					</div>
				</div>
				<div class="control-group">
					<div class="div-a">
						<label class="control-label">是否单位账客户：</label>
						<div class="controls">
							<form:radiobuttons path="unitFlag" items="${fns:getDictList('unit_flag')}" itemLabel="label" itemValue="value" htmlEscape="false" class=""/>
						</div>
					</div>
					<div class="div-b">
						<label class="control-label">客户属性：</label>
						<div class="controls">
							<form:select path="customerAttr" class="input-xlselect ">
								<form:option value="" label=""/>
								<form:options items="${fns:getDictList('customer_attr')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
							</form:select>
						</div>
					</div>
				</div>
				<div class="control-group">
					<div class="div-a">
						<label class="control-label">收货地址：</label>
						<div class="controls">
							<form:input path="receivingAddress" htmlEscape="false" maxlength="128" class="input-xlarge "/>
						</div>
					</div>
					<div class="div-b">
						<label class="control-label">付款方式：</label>
						<div class="controls">
							<form:select path="paymentMethod" class="input-xlselect ">
								<form:option value="" label=""/>
								<form:options items="${fns:getDictList('payment_method')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
							</form:select>
						</div>
					</div>
				</div>
				<div class="control-group">
					<div class="div-a">
						<label class="control-label">运费承担方：</label>
						<div class="controls">
							<form:select path="freightUnderwriter" class="input-xlselect ">
								<form:option value="" label=""/>
								<form:options items="${fns:getDictList('freight_underwriter')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
							</form:select>
						</div>
					</div>
					<div class="div-b">
						<label class="control-label">是否调拨：</label>
						<div class="controls">
							<form:radiobuttons path="allocationFlag" items="${fns:getDictList('allocation_flag')}" itemLabel="label" itemValue="value" htmlEscape="false" class=""/>
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
				</div>
        	</div>
        	<div class="tab-pane" id="goodsInfo">
	            <table class="table table-striped table-bordered table-hover" width="100%">
	                <thead>
	                <tr>
	                    <th>药品编码</th>
	                    <th>品名</th>
	                    <th>规格</th>
	                    <th>剂型</th>
	                    <th>生产企业</th>
	                    <th>单位</th>
	                    <th>内装数</th>
	                    <th>仓库</th>
	                    <th>货位号</th>
	                    <th>批号</th>
	                    <th>有效期至</th>
	                    <th>销售数量</th>
	                    <th>开票价格</th>
	                    <th>结算价</th>
	                    <th>高开价</th>
	                    <th>含税金额</th>
	                    <th>不含税金额</th>
	                    <th>税额</th>
	                    <th>税率</th>
	                    <shiro:hasPermission name="sales:salesOrder:edit">
	                        <th>操作</th>
	                    </shiro:hasPermission>
	                </tr>
	                </thead>
	                <tbody id="sales_contentField">
	                <c:forEach items="${salesOrder.goodsList}" var="item" varStatus="i">
	                    <tr id="sales_tr_${i.index}">
	                        <td>
	                            <input type="hidden" name="itemGoodsId" value="${i.index}"/>
	                            <input type="hidden" name="goodsList[${i.index }].goodsId" value="${item.goodsId}"/>
	                            <input type="text" class="table-form-control" name="goodsList[${i.index }].goodsCode"
	                                   value="${item.goodsCode }" valid='vtext'/>
	                        </td>
	                        <td>
	                            <input type="text" class="table-form-control" name="goodsList[${i.index }].goodsName"
	                                   value="${item.goodsName }" valid='vtext'/>
	                        </td>
	                        <td>
	                            <input type="text" class="table-form-control" name="goodsList[${i.index }].goodsSpec"
	                                   value="${item.goodsSpec }" valid='vtext'/>
	                        </td>
	                        <td>
	                            <input type="text" class="table-form-control" name="goodsList[${i.index }].goodsType"
	                                   value="${item.goodsType }" valid='vtext'/>
	                        </td>
	                        <td>
	                            <input type="text" class="table-form-control" name="goodsList[${i.index }].manufacturer"
	                                   value="${item.manufacturer }" valid='vtext'/>
	                        </td>
	                        <td>
	                            <input type="text" class="table-form-control" name="goodsList[${i.index }].unit"
	                                   value="${item.unit }" valid='vtext'/>
	                        </td>
	                        <td>
	                            <input type="text" class="table-form-control" name="goodsList[${i.index }].content"
	                                   value="${item.content }" valid='vtext'/>
	                        </td>
	                        <td>
	                            <input type="text" class="table-form-control" name="goodsList[${i.index }].repoId"
	                                   value="${item.repoId }" valid='vtext'/>
	                        </td>
	                        <td>
	                            <input type="text" class="table-form-control" name="goodsList[${i.index }].cargoNumber"
	                                   value="${item.cargoNumber }" valid='vtext'/>
	                        </td>
	                        <td>
	                            <input type="text" class="table-form-control" name="goodsList[${i.index }].lotNumber"
	                                   value="${item.lotNumber }" valid='vtext'/>
	                        </td>
	                        <td>
	                            <input type="text" class="table-form-control" name="goodsList[${i.index }].validDateUntil"
	                                   value="${item.validDateUntil }" valid='vtext'/>
	                        </td>
	                        <td>
	                            <input type="text" class="table-form-control" name="goodsList[${i.index }].number"
	                                   value="${item.number }" valid='vtext'/>
	                        </td>
	                        <td>
	                            <input type="text" class="table-form-control" name="goodsList[${i.index }].billingPrice"
	                                   value="${item.billingPrice }" valid='vtext'/>
	                        </td>
	                        <td>
	                            <input type="text" class="table-form-control" name="goodsList[${i.index }].settlementPrice"
	                                   value="${item.settlementPrice }" valid='vtext'/>
	                        </td>
	                        <td>
	                            <input type="text" class="table-form-control" name="goodsList[${i.index }].highPrice"
	                                   value="${item.highPrice }" valid='vtext'/>
	                        </td>
	                        <td>
	                            <input type="text" class="table-form-control" name="goodsList[${i.index }].tax"
	                                   value="${item.tax }" valid='vtext'/>
	                        </td>
	                        <td>
	                            <input type="text" class="table-form-control" name="goodsList[${i.index }].taxFree"
	                                   value="${item.taxFree }" valid='vtext'/>
	                        </td>
	                        <td>
	                            <input type="text" class="table-form-control" name="goodsList[${i.index }].taxAmount"
	                                   value="${item.taxAmount }" valid='vtext'/>
	                        </td>
	                        <td>
	                            <input type="text" class="table-form-control" name="goodsList[${i.index }].taxRate"
	                                   value="${item.taxRate }" valid='vtext'/>
	                        </td>
	                        <shiro:hasPermission name="sales:salesOrder:edit">
	                            <td>
	                                <a href="javascript:void(0)" class="btnDel" onclick="oper.sales.del('${i.index}','${item.id }');">删除</a>
	                            </td>
	                        </shiro:hasPermission>
	                    </tr>
	                </c:forEach>
	                </tbody>
	                <tfoot>
	                <tr>
	                	<shiro:hasPermission name="sales:salesOrder:edit">
	                   		<td colspan="20"><a href="javascript:" onclick="oper.sales.viewGoods();" class="btn">新增</a></td>
	                	</shiro:hasPermission>
	                </tr>
	                </tfoot>
	            </table>
	        </div>
       	</div>
		<div class="form-actions">
			<shiro:hasPermission name="sales:salesOrder:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>