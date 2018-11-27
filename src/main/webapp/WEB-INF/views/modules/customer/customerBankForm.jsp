<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<table class="table table-striped table-bordered table-hover" width="100%">
	<thead>
	<tr>
		<th style="width:22%;">开户银行</th>
		<th style="width:22%;">银行账号</th>
		<th style="width:22%;">开户户名</th>
		<th style="width:22%;">备注</th>
		<th width="60">操作</th>
	</tr>
	</thead>
	<tbody id="bank_contentField">
	<c:forEach items="${customer.customerBankList }" var="item" varStatus="i">
		<tr id="bank_tr_${i.index}">
			<td>
				<input type="hidden" name="itemBankId" value="${i.index}"/>
				<input type="hidden" name="customerBanksList[${i.index }].id" value="${item.id}"/>

				<select class="table-form-control" name="customerBanksList[${i.index }].bank">
					<c:forEach items="${fns:getDictList('bank')}" var="dict" varStatus="idx">
						<option value="${dict.value}"
								<c:if test="${dict.value == item.bank }">selected='true'</c:if> >${dict.label}</option>
					</c:forEach>

				</select>
			</td>
			<td>
				<input type="text" class="table-form-control" name="customerBanksList[${i.index }].bankNumber"
					   value="${item.bankNumber }" valid='vtext'/>
			</td>
			<td>
				<input type="text" class="table-form-control" name="customerBanksList[${i.index }].openAccountName"
					   value="${item.openAccountName }"
					   valid='vtext'/>
			</td>
			<td>
				<input type="text" class="table-form-control" name="customerBanksList[${i.index }].remarks"
					   value="${item.remarks }"
					   valid='vtext'/>
			</td>
			<td>
				<a href="javascript:void(0)" class="btnDel" onclick="oper.bank.del('${i.index}','${item.id }');">删除</a>
			</td>
		</tr>
	</c:forEach>
	</tbody>
	<tfoot>
	<tr>
		<td colspan="10"><a href="javascript:" onclick="oper.bank.add();" class="btn">新增</a></td>
	</tr>
	</tfoot>
</table>