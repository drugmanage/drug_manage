<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<table class="table table-striped table-bordered table-hover" width="100%">
    <thead>
    <tr>
        <th style="width:14%;">开始时间</th>
        <th style="width:15%;">结束时间</th>
        <th style="width:15%;">公司名称</th>
        <th style="width:15%;">工作地点</th>
        <th style="width:15%;">职务</th>
        <th style="width:15%;">证明人电话</th>
        <th width="60">操作</th>
    </tr>
    </thead>
    <tbody id="work_contentField">
    <c:forEach items="${hrmUser.hrmWorkExperList }" var="item" varStatus="i">
        <tr id="work_tr_${i.index}">
            <td>
                <input type="hidden" name="itemWorkId" value="${i.index}"/>
                <input type="hidden" name="hrmWorkExperList[${i.index }].id" value="${item.id}"/>
                <input type="text" name="hrmWorkExperList[${i.index }].startDate" class="input-medium Wdate "
                       value="<fmt:formatDate value="${item.startDate}" pattern="yyyy-MM-dd"/>"
                       onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
            </td>
            <td>
                <input type="text" name="hrmWorkExperList[${i.index }].endDate" class="input-medium Wdate "
                       value="<fmt:formatDate value="${item.endDate}" pattern="yyyy-MM-dd"/>"
                       onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
            </td>
            <td>
                <input type="text" class="table-form-control" name="hrmWorkExperList[${i.index }].companyName"
                       value="${item.companyName }"
                       valid='vtext'/>
            </td>
            <td>
                <input type="text" class="table-form-control" name="hrmWorkExperList[${i.index }].companyAddress"
                       value="${item.companyAddress }" valid='vtext'/>
            </td>
            <td>
                <input type="text" class="table-form-control" name="hrmWorkExperList[${i.index }].post"
                       value="${item.post }"
                       valid='vtext'/>
            </td>
            <td>
                <input type="text" class="table-form-control" name="hrmWorkExperList[${i.index }].phone"
                       value="${item.phone }"
                       valid='vtext'/>
            </td>
            <td>
                <a href="javascript:void(0)" class="btnDel" onclick="oper.work.del('${i.index}','${item.id }');">删除</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
    <tfoot>
    <tr>
        <td colspan="10"><a href="javascript:" onclick="oper.work.add();" class="btn">新增</a></td>
    </tr>
    </tfoot>
</table>