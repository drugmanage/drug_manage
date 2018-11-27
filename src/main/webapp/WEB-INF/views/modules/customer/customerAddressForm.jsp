<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<table class="table table-striped table-bordered table-hover" width="100%">
	<thead>
	<tr>
		<th style="width:18%;">收货人</th>
		<th style="width:18%;">区域</th>
		<th style="width:18%;">街道门牌号</th>
		<th style="width:18%;">联系人电话</th>
		<th style="width:18%;">备注</th>
		<th width="60">操作</th>
	</tr>
	</thead>
	<tbody id="address_contentField">
	<c:forEach items="${customer.customerAddressList }" var="item" varStatus="i">
		<tr id="address_tr_${i.index}">
			<td>
				<input type="hidden" name="itemAddressId" value="${i.index}"/>
				<input type="hidden" name="customerAddressList[${i.index }].id" value="${item.id }"/>
				<input type="text" class="table-form-control" name="customerAddressList[${i.index }].receivingName"
					   value="${item.receivingName }" valid='vtext'/>
			</td>
			<td>
				<div class="controls">
					<sys:treeselect id="area${i.index }" name="customerAddressList[${i.index }].area.id" value="${item.area.id}" labelName="area.name" labelValue="${item.area.name}"
									title="区域" url="/sys/area/treeData" cssClass="" allowClear="true" notAllowSelectParent="true"/>
				</div>
			</td>
			<td>
				<input type="text" class="table-form-control" name="customerAddressList[${i.index }].receivingAddress"
					   value="${item.receivingAddress }"
					   valid='vtext'/>
			</td>
			<td>
				<input type="text" class="table-form-control" name="customerAddressList[${i.index }].contactPhone"
					   value="${item.contactPhone }"
					   valid='vnum'/>
			</td>
			<td>
				<input type="text" class="table-form-control" name="customerAddressList[${i.index }].contactPhone"
					   value="${item.remarks }"
					   valid='vnum'/>
			</td>
			<td>
				<a href="javascript:void(0)" class="btnDel" onclick="oper.address.del('${i.index}','${item.id }');">删除</a>
			</td>
		</tr>
	</c:forEach>
	</tbody>
	<tfoot>
	<tr>
		<td colspan="10"><a href="javascript:" onclick="oper.address.add();" class="btn">新增</a></td>
	</tr>
	</tfoot>
</table>