<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<table class="table table-striped table-bordered table-hover" width="100%">
    <thead>
    <tr>
        <th style="width:10%;">开户名称</th>
        <th style="width:10%;">开户行</th>
        <th style="width:10%;">区域</th>
        <th style="width:10%;">详细地址</th>
        <th style="width:10%;">联系电话</th>
        <th style="width:10%;">账号</th>
        <th style="width:10%;">税号</th>
        <th style="width:10%;">开票图片</th>
        <th style="width:10%;">是否停用</th>
        <th width="60">操作</th>
    </tr>
    </thead>
    <tbody id="invoice_contentField">
    <c:forEach items="${customer.customerInvoiceInfoList }" var="item" varStatus="i">
        <tr id="consigner_tr_${i.index}">
            <td>
                <input type="hidden" name="itemConsignerId" value="${i.index}"/>
                <input type="hidden" name="customerInvoiceInfoList[${i.index }].id" value="${item.id }"/>
                <input type="text" class="table-form-control" name="customerInvoiceInfoList[${i.index }].accountName"
                       value="${item.accountName }" valid='vtext'/>
            </td>
            <td>
                <input type="text" class="table-form-control" name="customerInvoiceInfoList[${i.index }].bankDeposit"
                       value="${item.bankDeposit }"
                       valid='vtext'/>
            </td>
            <td>
                <input type="text" class="table-form-control" name="customerInvoiceInfoList[${i.index }].area"
                       value="${item.area }"
                       valid='vtext'/>
            </td>
            <td>
                <input type="text" class="table-form-control" name="customerInvoiceInfoList[${i.index }].detailAddress"
                       value="${item.detailAddress }"
                       valid='vtext'/>
            </td>
            <td>
                <input type="text" class="table-form-control" name="customerInvoiceInfoList[${i.index }].phone"
                       value="${item.phone }"
                       valid='vtext'/>
            </td>
            <td>
                <input type="text" class="table-form-control" name="customerInvoiceInfoList[${i.index }].accountNumber"
                       value="${item.accountNumber }"
                       valid='vtext'/>
            </td>
            <td>
                <input type="text" class="table-form-control" name="customerInvoiceInfoList[${i.index }].dutyParagraph"
                       value="${item.dutyParagraph }"
                       valid='vtext'/>
            </td>
            <td>
                <input type="hidden" id="nameImagefront${i.index }"
                       name="customerInvoiceInfoList[${i.index }].proxyBookImgBook" value="${item.invoicePath }"/>
                <sys:ckfinder input="nameImagefront${i.index }" type="images" uploadPath="/photo/customer/proxy"
                              selectMultiple="false" maxWidth="100" maxHeight="100"/>
            </td>
            <td>
                <select class="table-form-control" name="customerInvoiceInfoList[${i.index }].sex">
                    <c:forEach items="${fns:getDictList('stop_flag')}" var="dict" varStatus="idx">
                        <option value="${dict.value}"
                                <c:if test="${dict.value == item.status }">selected='true'</c:if> >${dict.label}</option>
                    </c:forEach>
                </select>
            </td>
            <td>
                <input type="text" class="table-form-control" name="customerInvoiceInfoList[${i.index }].contactPhone"
                       value="${item.remarks }"
                       valid='vnum'/>
            </td>
            <td>
                <a href="javascript:void(0)" class="btnDel"
                   onclick="oper.invoice.del('${i.index}','${item.id }');">删除</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
    <tfoot>
    <tr>
        <td colspan="10"><a href="javascript:" onclick="oper.invoice.add();" class="btn">新增</a></td>
    </tr>
    </tfoot>
</table>