<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<table class="table table-striped table-bordered table-hover" width="100%">
	<thead>
	<tr>
		<th style="width:15%;">开户银行</th>
		<th style="width:15%;">银行账号</th>
		<th style="width:15%;">状态</th>
		<th style="width:15%;">正面照片</th>
		<th style="width:15%;">背面照片</th>
		<th style="width:15%;">说明</th>
		<th width="60">操作</th>
	</tr>
	</thead>
	<tbody id="bank_contentField">
	<c:forEach items="${hrmUser.hrmBanksList }" var="item" varStatus="i">
		<tr id="bank_tr_${i.index}">
			<td>
				<input type="hidden" name="itemBankId" value="${i.index}"/>
				<input type="hidden" name="hrmBanksList[${i.index }].id" value="${item.id}"/>

				<select class="table-form-control" name="hrmBanksList[${i.index }].bank">
					<c:forEach items="${fns:getDictList('bank')}" var="dict" varStatus="idx">
						<option value="${dict.value}"
								<c:if test="${dict.value == item.bank }">selected='true'</c:if> >${dict.label}</option>
					</c:forEach>

				</select>
			</td>
			<td>
				<input type="text" class="table-form-control" name="hrmBanksList[${i.index }].bankNumber"
					   value="${item.bankNumber }" valid='vtext'/>
			</td>
			<td>
				<select class="table-form-control" name="hrmBanksList[${i.index }].status">
					<c:forEach items="${fns:getDictList('bank_status')}" var="dict" varStatus="idx">
						<option value="${dict.value}"
								<c:if test="${dict.value == item.status }">selected='true'</c:if> >${dict.label}</option>
					</c:forEach>
				</select>
			</td>
			<td>
				<input type="hidden" id="nameImagefront${i.index }" name="hrmBanksList[${i.index }].positivePhoto" value="${item.positivePhoto}"/>
				<sys:ckfinder input="nameImagefront${i.index }" type="images" uploadPath="/photo/hrmuser/bank" selectMultiple="false" maxWidth="100" maxHeight="100"/>
			</td>
			<td>
				<input type="hidden" id="nameImageback${i.index }" name="hrmBanksList[${i.index }].backPhoto" value="${item.backPhoto}"/>
				<sys:ckfinder input="nameImageback${i.index }" type="images" uploadPath="/photo/hrmuser/bank" selectMultiple="false" maxWidth="100" maxHeight="100"/>
			</td>
			<td>
				<input type="text" class="table-form-control" name="hrmBanksList[${i.index }].remarks"
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