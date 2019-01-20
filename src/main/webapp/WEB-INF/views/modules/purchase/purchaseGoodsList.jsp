<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>

<head>
        <title>采购订单商品展示</title>
        <meta name="decorator" content="default" />
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
                                <th>选择</th>
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
                                                <input name="goodsCheck" type="radio" value="${item}" onclick="goodsOnclick(this.value)" />
                                        </td>
                                        <td>
                                                ${item.goodsCode }
                                        </td>
                                        <td>
                                                ${item.goodsName }
                                        </td>
                                        <td>
                                                ${item.goodsSpec }
                                        </td>
                                        <td>
                                                ${item.goodsType }
                                        </td>
                                        <td>
                                                ${item.manufacturer }
                                        </td>
                                        <td>
                                                ${item.unit }
                                        </td>
                                        <td>
                                                ${item.content }
                                        </td>
                                        <td>
                                                ${item.purchasePrice }
                                        </td>
                                        <td>
                                                ${item.number }
                                        </td>
                                        <td>
                                                ${item.tax }
                                        </td>
                                        <td>
                                                ${item.taxFree }
                                        </td>
                                        <td>
                                                ${item.taxAmount }
                                        </td>
                                        <td>
                                                ${item.taxRate }
                                        </td>
                                        <td>
                                                ${item.stock }
                                        </td>
                                        <td>
                                                ${item.arrivalNum }
                                        </td>
                                </tr>
                        </c:forEach>
                </tbody>
        </table>
        <div class="pagination">${page}</div>
</body>

</html>