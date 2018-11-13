<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<table class="table table-striped table-bordered table-hover" width="100%">
	<thead>
	<tr>
		<th style="width:8%">联系人</th>
		<th style="width:7%">性别</th>
		<th style="width:10%">电话</th>
		<th style="width:12%">证件号</th>
        <th style="width:8%">委托人有效期</th>
        <th style="width:12%">委托书</th>
        <th style="width:8%">委托书有效期</th>
        <th style="width:3%">停用</th>
        <th style="width:15%">委托书照片</th>
        <th style="width:15%">身份证照片</th>
        <th width="50">操作</th>
	</tr>
	</thead>
	<tbody id="consigner_contentField">
	<c:forEach items="${supplier.supplierConsignerList}" var="item" varStatus="i">
		<tr id="consigner_tr_${i.index}">
			<td>
				<input type="hidden" name="itemConsignerId" value="${i.index}"/>
				<input type="hidden" name="supplierConsignerList[${i.index }].id" value="${item.id }"/>
				<input type="text" class="table-form-control" name="supplierConsignerList[${i.index }].contactsName"
					   value="${item.contactsName }" valid='vtext'/>
			</td>
			<td>
                <select class="table-form-control" name="supplierConsignerList[${i.index }].sex">
                    <c:forEach items="${fns:getDictList('sex')}" var="dict" varStatus="idx">
                        <option value="${dict.value}"
                                <c:if test="${dict.value == item.sex }">selected='true'</c:if> >${dict.label}</option>
                    </c:forEach>

                </select>
			</td>
			<td>
				<input type="text" class="table-form-control" name="supplierConsignerList[${i.index }].phone"
					   value="${item.phone }"
					   valid='vnum'/>
			</td>
			<td>
				<input type="text" class="table-form-control" name="supplierConsignerList[${i.index }].certNumber"
					   value="${item.certNumber }"
					   valid='vnum'/>
			</td>
            <td>
                <input type="text" name="supplierConsignerList[${i.index }].consignerVali" readonly="readonly" class="table-form-control Wdate "
                       value="<fmt:formatDate value="${item.consignerVali}" pattern="yyyy-MM-dd"/>"
                       onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
            </td>
            <td>
                <input type="text" class="table-form-control" name="supplierConsignerList[${i.index }].proxyBook"
                       value="${item.proxyBook }"
                       valid='vnum'/>
            </td>
            <td>
                <input type="text" name="supplierConsignerList[${i.index }].proxyBookVali" readonly="readonly" class="table-form-control Wdate "
                       value="<fmt:formatDate value="${item.proxyBookVali}" pattern="yyyy-MM-dd"/>"
                       onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
            </td>
            <td>
                <input type="checkbox" class="table-form-control" name="supplierConsignerList[${i.index }].stopFlag"
					   value="1" <c:if test="${item.stopFlag==1}">checked=true</c:if> />
            </td>
            <td>
                <input type="hidden" id="nameImageproxyBookImgPath${i.index }" name="supplierConsignerList[${i.index }].proxyBookImgPath" value="${item.proxyBookImgPath}"/>
                <sys:ckfinder input="nameImageproxyBookImgPath${i.index }" type="images" uploadPath="/photo/supplier/consigner" selectMultiple="false" maxWidth="100" maxHeight="100"/>
            </td>
            <td>
                <input type="hidden" id="nameImageidCardImgPath${i.index }" name="supplierConsignerList[${i.index }].idCardImgPath" value="${item.proxyBookImgPath}"/>
                <sys:ckfinder input="nameImageidCardImgPath${i.index }" type="images" uploadPath="/photo/supplier/consigner" selectMultiple="false" maxWidth="100" maxHeight="100"/>
            </td>

			<td>
				<a href="javascript:void(0)" class="btnDel" onclick="supOper.consigner.del('${i.index}','${item.id }');">删除</a>
			</td>
		</tr>
	</c:forEach>
	</tbody>
	<tfoot>
	<tr>
		<td colspan="11"><a href="javascript:" onclick="supOper.consigner.add();" class="btn">新增</a></td>
	</tr>
	</tfoot>
</table>