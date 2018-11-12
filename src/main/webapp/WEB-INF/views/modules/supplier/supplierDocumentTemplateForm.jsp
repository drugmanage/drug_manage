<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<table class="table table-striped table-bordered table-hover" width="100%">
	<thead>
	<tr>
		<th style="width:15%;">证书名称</th>
		<th style="width:15%;">证书编码</th>
		<th style="width:15%;">发证机关</th>
		<th style="width:15%;">发证时间</th>
		<th style="width:15%;">有效期至</th>
		<th style="width:15%;">图片</th>
		<th width="60">操作</th>
	</tr>
	</thead>
	<tbody id="docTemp_contentField">
	<c:forEach items="${supplier.supplierDocumentTemplateList }" var="item" varStatus="i">
		<tr id="docTemp_tr_${i.index}">
            <td>
                <input type="hidden" name="itemDocTempId" value="${i.index}"/>
                <input type="hidden" name="supplierDocumentTemplateList[${i.index }].id" value="${item.id}"/>
                <input type="text" class="table-form-control" name="supplierDocumentTemplateList[${i.index }].name"
                       value="${item.name }" valid='vtext'/>
            </td>
			<td>
				<input type="text" class="table-form-control" name="supplierDocumentTemplateList[${i.index }].certCode"
					   value="${item.certCode }" valid="vtext">
			</td>
			<td>
				<input type="text" class="table-form-control" name="supplierDocumentTemplateList[${i.index }].issuingOrgan"
					   value="${item.issuingOrgan }" valid='vtext'/>
			</td>
			<td>
				<input type="text" name="supplierDocumentTemplateList[${i.index }].dateIssue" class="input-medium Wdate "
					   value="<fmt:formatDate value="${item.dateIssue}" pattern="yyyy-MM-dd"/>"
					   onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
			</td>
			<td>
				<input type="text" name="supplierDocumentTemplateList[${i.index }].validityDate" class="input-medium Wdate "
					   value="<fmt:formatDate value="${item.validityDate}" pattern="yyyy-MM-dd"/>"
					   onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
			</td>
			<td>
				<input type="hidden" id="nameImageimgPath${i.index }" name="supplierDocumentTemplateList[${i.index }].imgPath" value="${item.imgPath}"/>
				<sys:ckfinder input="nameImageimgPath${i.index }" type="images" uploadPath="/photo/supplier/documentTemplate" selectMultiple="false" maxWidth="100" maxHeight="100"/>
			</td>
			<td>
				<a href="javascript:void(0)" class="btnDel" onclick="supOper.docTemp.del('${i.index}','${item.id }');">删除</a>
			</td>
		</tr>
	</c:forEach>
	</tbody>
	<tfoot>
	<tr>
		<td colspan="10"><a href="javascript:" onclick="supOper.docTemp.add();" class="btn">新增</a></td>
	</tr>
	</tfoot>
</table>