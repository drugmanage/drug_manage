<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<table class="table table-striped table-bordered table-hover" width="100%">
    <thead>
    <tr>
        <th style="width:12%;">证件名称</th>
        <th style="width:12%;">证书编码</th>
        <th style="width:12%;">发证机关</th>
        <th style="width:12%;">发证日期</th>
        <th style="width:12%;">有效期至</th>
        <th style="width:12%;">图片</th>
        <th style="width:12%;">备注</th>
        <th width="60">操作</th>
    </tr>
    </thead>
    <tbody id="document_contentField">
    <c:forEach items="${customer.customerDocumentTemplateList }" var="item" varStatus="i">
        <tr id="document_tr_${i.index}">
            <td>
                <input type="hidden" name="itemDocumentId" value="${i.index}"/>
                <input type="hidden" name="customerDocumentTemplateList[${i.index }].id" value="${item.id }"/>
                <input type="text" class="table-form-control" name="customerDocumentTemplateList[${i.index }].name"
                       value="${item.name }" valid='vtext'/>
            </td>
            <td>
                <input type="text" class="table-form-control" name="customerDocumentTemplateList[${i.index }].certCode"
                       value="${item.certCode }"
                       valid='vtext'/>
            </td>
            <td>
                <input type="text" class="table-form-control" name="customerDocumentTemplateList[${i.index }].issuingOrgan"
                       value="${item.issuingOrgan }"
                       valid='vtext'/>
            </td>
            <td>
                <input type="text" name="customerDocumentTemplateList[${i.index }].endDate" class="input-medium Wdate "
                       value="<fmt:formatDate value="${item.endDate}" pattern="yyyy-MM-dd"/>"
                       onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
            </td>
            <td>
                <input type="text" name="customerDocumentTemplateList[${i.index }].endDate" class="input-medium Wdate "
                       value="<fmt:formatDate value="${item.endDate}" pattern="yyyy-MM-dd"/>"
                       onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
            </td>
            <td>
                <input type="hidden" id="nameImagefront${i.index }"
                       name="customerDocumentTemplateList[${i.index }].proxyBookImgBook" value="${item.proxyBookImgBook}"/>
                <sys:ckfinder input="nameImagefront${i.index }" type="images" uploadPath="/photo/customer/proxy"
                              selectMultiple="false" maxWidth="100" maxHeight="100"/>
            </td>
            <td>
                <input type="text" class="table-form-control" name="customerDocumentTemplateList[${i.index }].contactPhone"
                       value="${item.remarks }"
                       valid='vnum'/>
            </td>
            <td>
                <a href="javascript:void(0)" class="btnDel"
                   onclick="oper.document.del('${i.index}','${item.id }');">删除</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
    <tfoot>
    <tr>
        <td colspan="10"><a href="javascript:" onclick="oper.document.add();" class="btn">新增</a></td>
    </tr>
    </tfoot>
</table>