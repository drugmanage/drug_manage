<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<table class="table table-striped table-bordered table-hover" width="100%">
	<thead>
	<tr>
		<th style="width:8%;">开户名称</th>
		<th style="width:11%;">开户行</th>
		<th style="width:15%;">地区</th>
		<th style="width:13%;">街道门牌号</th>
		<th style="width:8%;">联系电话</th>
		<th style="width:11%;">账号</th>
        <th style="width:11%;">税号</th>
        <th style="width:50px;">停用</th>
        <th style="width:18%;">开票图片路径</th>
		<th width="50">操作</th>
	</tr>
	</thead>
	<tbody id="invoice_contentField">
	<c:forEach items="${supplier.supplierInvoiceInfoList }" var="item" varStatus="i">
		<tr id="invoice_tr_${i.index}">
			<td>
				<input type="hidden" name="itemInvoiceId" value="${i.index}"/>
				<input type="hidden" name="supplierInvoiceInfoList[${i.index }].id" value="${item.id}"/>
                <input type="text" class="table-form-control" name="supplierInvoiceInfoList[${i.index }].accountName"
                       value="${item.accountName }" valid='vtext'/>
			</td>

            <td>
            <select class="table-form-control" name="supplierInvoiceInfoList[${i.index }].bankDeposit">
                <c:forEach items="${fns:getDictList('bank')}" var="dict" varStatus="idx">
                    <option value="${dict.value}"
                            <c:if test="${dict.value == item.bankDeposit }">selected='true'</c:if> >${dict.label}</option>
                </c:forEach>
            </select>
            </td>

			<td>
                <sys:treeselect id="invoiceArea${i.index }" name="supplierInvoiceInfoList[${i.index }].area.id" value="${item.area.id}" labelName="area.name" labelValue="${item.area.name}"
                                title="区域" url="/sys/area/treeData" cssClass="" allowClear="true" notAllowSelectParent="true"/>
			</td>
            <td>
                <input type="text" class="table-form-control" name="supplierInvoiceInfoList[${i.index }].detailAddress"
                       value="${item.detailAddress }" valid='vtext'/>
            </td>
            <td>
                <input type="text" class="table-form-control" name="supplierInvoiceInfoList[${i.index }].phone"
                       value="${item.phone }" valid='vtext'/>
            </td>
            <td>
                <input type="text" class="table-form-control" name="supplierInvoiceInfoList[${i.index }].accountNumber"
                       value="${item.accountNumber }" valid='vtext'/>
            </td>
            <td>
                <input type="text" class="table-form-control" name="supplierInvoiceInfoList[${i.index }].dutyParagraph"
                       value="${item.dutyParagraph }" valid='vtext'/>
            </td>

            <td>
                <input type="checkbox" class="table-form-control" name="supplierInvoiceInfoList[${i.index }].stopFlag"
                       value="1" <c:if test="${item.stopFlag==1}">checked=true</c:if>/>
            </td>

			<td>
				<input type="hidden" id="nameImageinvoicePath${i.index }" name="supplierInvoiceInfoList[${i.index }].invoicePath" value="${item.invoicePath}"/>
				<sys:ckfinder input="nameImageinvoicePath${i.index }" type="images" uploadPath="/photo/supplier/invoice" selectMultiple="false" maxWidth="100" maxHeight="100"/>
			</td>
			<td>
				<a href="javascript:void(0)" class="btnDel" onclick="supOper.invoice.del('${i.index}','${item.id }');">删除</a>
			</td>
		</tr>
	</c:forEach>
	</tbody>
	<tfoot>
	<tr>
		<td colspan="10"><a href="javascript:" onclick="supOper.invoice.add();" class="btn">新增</a></td>
	</tr>
	</tfoot>
</table>