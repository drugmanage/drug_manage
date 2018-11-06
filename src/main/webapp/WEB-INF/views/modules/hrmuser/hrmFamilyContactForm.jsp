<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<table class="table table-striped table-bordered table-hover" width="100%">
	<thead>
	<tr>
		<th style="width:17%;">姓名</th>
		<th style="width:17%;">亲属关系</th>
		<th style="width:17%;">工作单位</th>
		<th style="width:17%;">职务</th>
		<th style="width:17%;">联系电话</th>
		<th width="60">操作</th>
	</tr>
	</thead>
	<tbody id="family_contentField">
	<c:forEach items="${hrmUser.hrmFamilyList }" var="item" varStatus="i">
		<tr id="family_tr_${i.index}">
			<td>
				<input type="hidden" name="itemFamilyId" value="${i.index}"/>
				<input type="hidden" name="hrmFamilyList[${i.index }].id" value="${item.id}"/>
				<input type="text" class="table-form-control" name="hrmFamilyList[${i.index }].name"
					   value="${item.name }"
					   valid='vtext'/>
			</td>
			<td>
				<input type="text" class="table-form-control" name="hrmFamilyList[${i.index }].relationship"
					   value="${item.relationship }" valid='vtext'/>
			</td>
			<td>
				<input type="text" class="table-form-control" name="hrmFamilyList[${i.index }].workUnit"
					   value="${item.workUnit }"
					   valid='vtext'/>
			</td>
			<td>
				<input type="text" class="table-form-control" name="hrmFamilyList[${i.index }].post"
					   value="${item.post }"
					   valid='vtext'/>
			</td>
			<td>
				<input type="text" class="table-form-control" name="hrmFamilyList[${i.index }].phone"
					   value="${item.phone }"
					   valid='vnmu'/>
			</td>
			<td>
				<a href="javascript:void(0)" class="btnDel" onclick="oper.family.del('${i.index}','${item.id }');">删除</a>
			</td>
		</tr>
	</c:forEach>
	</tbody>
	<tfoot>
	<tr>
		<td colspan="10"><a href="javascript:" onclick="oper.family.add();" class="btn">新增</a></td>
	</tr>
	</tfoot>
</table>