<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
    <table class="table table-striped table-bordered table-hover" width="100%">
        <thead>
        <tr>
            <th style="width:13%;">开始时间</th>
            <th style="width:13%;">结束时间</th>
            <th style="width:13%;">阶段</th>
            <th style="width:13%;">学校</th>
            <th style="width:13%;">专业</th>
            <th style="width:13%;">证明人</th>
            <th style="width:13%;">联系电话</th>
            <th width="60">操作</th>
        </tr>
        </thead>
        <tbody id="edu_contentField">
        <c:forEach items="${hrmUser.hrmEduList }" var="item" varStatus="i">
            <tr id="edu_tr_${i.index}">
                <td>
                    <input type="hidden" name="itemEduId" value="${i.index}"/>
                    <input type="hidden" name="hrmEduList[${i.index }].id" value="${item.id}"/>
                    <input type="text" name="hrmEduList[${i.index }].startDate"  class="input-medium Wdate "
                           value="<fmt:formatDate value="${item.startDate}" pattern="yyyy-MM-dd"/>"
                           onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
                </td>
                <td>
                    <input type="text" name="hrmEduList[${i.index }].endDate" class="input-medium Wdate "
                           value="<fmt:formatDate value="${item.endDate}" pattern="yyyy-MM-dd"/>"
                           onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
                </td>
                <td>
                    <select class="table-form-control" name="hrmEduList[${i.index }].stage">
                        <c:forEach items="${fns:getDictList('edu_type')}" var="dict" varStatus="idx">
                            <option value="${dict.value}"
                                    <c:if test="${dict.value == item.stage }">selected='true'</c:if> >${dict.label}</option>
                        </c:forEach>

                    </select>
                </td>
                <td>
                    <input type="text" class="table-form-control" name="hrmEduList[${i.index }].schoolName"
                           value="${item.schoolName }" valid='vtext'/>
                </td>
                <td>
                    <input type="text" class="table-form-control" name="hrmEduList[${i.index }].major"
                           value="${item.major }"
                           valid='vtext'/>
                </td>
                <td>
                    <input type="text" class="table-form-control" name="hrmEduList[${i.index }].witness"
                           value="${item.witness }"
                           valid='vtext'/>
                </td>
                <td>
                    <input type="text" class="table-form-control" name="hrmEduList[${i.index }].phone"
                           value="${item.phone }"
                           valid='vnum'/>
                </td>
                <td>
                    <a href="javascript:void(0)" class="btnDel" onclick="oper.edu.del('${i.index}','${item.id }');">删除</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
        <tfoot>
        <tr>
            <td colspan="10"><a href="javascript:" onclick="oper.edu.add();" class="btn">新增</a></td>
        </tr>
        </tfoot>
    </table>