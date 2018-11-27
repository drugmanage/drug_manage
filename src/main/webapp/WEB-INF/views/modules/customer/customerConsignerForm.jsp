<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<table class="table table-striped table-bordered table-hover" width="100%">
	<thead>
	<tr>
		<th style="width:18%;">联系人</th>
		<th style="width:18%;">性别</th>
		<th style="width:18%;">电话</th>
		<th style="width:18%;">证件号</th>
		<th style="width:18%;">委托人有效期</th>
		<th style="width:18%;">委托书</th>
		<th style="width:18%;">委托书有效期</th>
		<th style="width:18%;">委托书图片</th>
		<th style="width:18%;">身份证图片</th>
		<th style="width:18%;">是否停用</th>
		<th style="width:18%;">备注</th>
		<th width="60">操作</th>
	</tr>
	</thead>
	<tbody id="consigner_contentField">
	<c:forEach items="${customer.customerConsignerList }" var="item" varStatus="i">
		<tr id="consigner_tr_${i.index}">
			<td>
				<input type="hidden" name="itemConsignerId" value="${i.index}"/>
				<input type="hidden" name="customerConsignerList[${i.index }].id" value="${item.id }"/>
				<input type="text" class="table-form-control" name="customerConsignerList[${i.index }].contactsName"
					   value="${item.contactsName }" valid='vtext'/>
			</td>
			<td>
				<select class="table-form-control" name="customerConsignerList[${i.index }].sex">
					<c:forEach items="${fns:getDictList('sex')}" var="dict" varStatus="idx">
						<option value="${dict.value}"
								<c:if test="${dict.value == item.status }">selected='true'</c:if> >${dict.label}</option>
					</c:forEach>
				</select>
			</td>
			<td>
				<input type="text" class="table-form-control" name="customerConsignerList[${i.index }].phone"
					   value="${item.phone }"
					   valid='vnum'/>
			</td>
			<td>
				<input type="text" class="table-form-control" name="customerConsignerList[${i.index }].certNumber"
					   value="${item.certNumber }"
					   valid='vnum'/>
			</td>
			<td>
				<input type="text" name="customerConsignerList[${i.index }].endDate" class="input-medium Wdate "
					   value="<fmt:formatDate value="${item.endDate}" pattern="yyyy-MM-dd"/>"
					   onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
			</td>
			<td>
				<input type="text" class="table-form-control" name="customerConsignerList[${i.index }].proxyBook"
					   value="${item.proxyBook }"
					   valid='vnum'/>
			</td>
			<td>
				<input type="text" name="customerConsignerList[${i.index }].endDate" class="input-medium Wdate "
					   value="<fmt:formatDate value="${item.endDate}" pattern="yyyy-MM-dd"/>"
					   onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
			</td>
			<td>
				<input type="hidden" id="nameImagefront${i.index }" name="customerConsignerList[${i.index }].proxyBookImgBook" value="${item.proxyBookImgBook}"/>
				<sys:ckfinder input="nameImagefront${i.index }" type="images" uploadPath="/photo/customer/proxy" selectMultiple="false" maxWidth="100" maxHeight="100"/>
			</td>
			<td>
				<input type="hidden" id="nameImageback${i.index }" name="customerConsignerList[${i.index }].idCardImgBook" value="${item.idCardImgBook}"/>
				<sys:ckfinder input="nameImageback${i.index }" type="images" uploadPath="/photo/customer/idCard" selectMultiple="false" maxWidth="100" maxHeight="100"/>
			</td>
			<td>
				<select class="table-form-control" name="customerConsignerList[${i.index }].sex">
					<c:forEach items="${fns:getDictList('stop_flag')}" var="dict" varStatus="idx">
						<option value="${dict.value}"
								<c:if test="${dict.value == item.status }">selected='true'</c:if> >${dict.label}</option>
					</c:forEach>
				</select>
			</td>
			<td>
				<input type="text" class="table-form-control" name="customerConsignerList[${i.index }].contactPhone"
					   value="${item.remarks }"
					   valid='vnum'/>
			</td>
			<td>
				<a href="javascript:void(0)" class="btnDel" onclick="oper.consigner.del('${i.index}','${item.id }');">删除</a>
			</td>
		</tr>
	</c:forEach>
	</tbody>
	<tfoot>
	<tr>
		<td colspan="10"><a href="javascript:" onclick="oper.consigner.add();" class="btn">新增</a></td>
	</tr>
	</tfoot>
</table>