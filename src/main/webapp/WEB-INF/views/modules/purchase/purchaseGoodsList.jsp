<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>采购订单商品展示</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {

        });

        function page(n, s) {
            $("#pageNo").val(n);
            $("#pageSize").val(s);
            $("#searchForm").submit();
            return false;
        }
    </script>
</head>
<body>
<table class="table table-striped table-bordered table-hover" width="100%">
    <thead>
    <tr>
        <th>药品编码</th>
        <th>品名</th>
        <th>规格</th>
        <th>剂型</th>
        <th>生产企业</th>
        <th>单位</th>
        <th>内装数</th>
        <th>采购价格</th>
        <th>采购数量</th>
        <th>含税金额</th>
        <th>不含税金额</th>
        <th>税额</th>
        <th>税率</th>
        <th>当前库存</th>
        <th>已到货数</th>
    </tr>
    </thead>
    <tbody id="goods_contentField">
    <c:forEach items="${purchaseOrder.goodsList}" var="item" varStatus="i">
        <tr id="goods_tr_${i.index}">
            <td>
                <input type="hidden" name="itemGoodsId" value="${i.index}"/>
                <input type="hidden" name="goodsList[${i.index }].goodsId" value="${item.goodsId}"/>
                <input type="text" class="table-form-control" name="goodsList[${i.index }].goodsCode"
                       value="${item.goodsCode }" valid='vtext'/>
            </td>
            <td>
                <input type="text" class="table-form-control" name="goodsList[${i.index }].goodsName"
                       value="${item.goodsName }" valid='vtext'/>
            </td>
            <td>
                <input type="text" class="table-form-control" name="goodsList[${i.index }].goodsSpec"
                       value="${item.goodsSpec }" valid='vtext'/>
            </td>
            <td>
                <input type="text" class="table-form-control" name="goodsList[${i.index }].goodsType"
                       value="${item.goodsType }" valid='vtext'/>
            </td>
            <td>
                <input type="text" class="table-form-control" name="goodsList[${i.index }].manufacturer"
                       value="${item.manufacturer }" valid='vtext'/>
            </td>
            <td>
                <input type="text" class="table-form-control" name="goodsList[${i.index }].unit"
                       value="${item.unit }" valid='vtext'/>
            </td>
            <td>
                <input type="text" class="table-form-control" name="goodsList[${i.index }].content"
                       value="${item.content }" valid='vtext'/>
            </td>
            <td>
                <input type="text" class="table-form-control" name="goodsList[${i.index }].purchasePrice"
                       value="${item.purchasePrice }" valid='vtext'/>
            </td>
            <td>
                <input type="text" class="table-form-control" name="goodsList[${i.index }].number"
                       value="${item.number }" valid='vtext'/>
            </td>
            <td>
                <input type="text" class="table-form-control" name="goodsList[${i.index }].tax"
                       value="${item.tax }" valid='vtext'/>
            </td>
            <td>
                <input type="text" class="table-form-control" name="goodsList[${i.index }].tax"
                       value="${item.taxFree }" valid='vtext'/>
            </td>
            <td>
                <input type="text" class="table-form-control" name="goodsList[${i.index }].tax"
                       value="${item.taxAmount }" valid='vtext'/>
            </td>
            <td>
                <input type="text" class="table-form-control" name="goodsList[${i.index }].tax"
                       value="${item.taxRate }" valid='vtext'/>
            </td>
            <td>
                <input type="text" class="table-form-control" name="goodsList[${i.index }].stock"
                       value="${item.stock }" valid='vtext'/>
            </td>
            <td>
                <input type="text" class="table-form-control" name="goodsList[${i.index }].arrivalNum"
                       value="${item.arrivalNum }" valid='vtext'/>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>