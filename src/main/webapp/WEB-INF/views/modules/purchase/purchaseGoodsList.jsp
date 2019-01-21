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

        // jbox要获取的数据
        var goodsData = null;

        $(function () {
            $(":radio").click(function () {
                goodsData = null;
                var index = $(this).val();
                goodsData = {
                    "id": "",
                    "goodsCode": "",
                    "goodsName": "",
                    "goodsSpec": "",
                    "goodsType": "",
                    "manufacturer": "",
                    "unit": "",
                    "content": "",
                    "purchasePrice": "",
                    "number": "",
                    "wholeNumber": "",
                    "piecesNumber": "",
                    "tax": "",
                    "taxFree": "",
                    "taxAmount": "",
                    "taxRate": "",
                    "stock": "",
                    "arrivalNum": ""
                };
                goodsData.id = $("#goods_" + index + "_id").val();
                goodsData.goodsCode = $("#goods_" + index + "_goodsCode").val();
                goodsData.goodsName = $("#goods_" + index + "_goodsName").val();
                goodsData.goodsSpec = $("#goods_" + index + "_goodsSpec").val();
                goodsData.goodsType = $("#goods_" + index + "_goodsType").val();
                goodsData.manufacturer = $("#goods_" + index + "_manufacturer").val();
                goodsData.unit = $("#goods_" + index + "_unit").val();
                goodsData.content = $("#goods_" + index + "_content").val();
                goodsData.purchasePrice = $("#goods_" + index + "_purcasePrice").val();
                goodsData.number = $("#goods_" + index + "_number").val();
                goodsData.wholeNumber = $("#goods_" + index + "_wholeNumber").val();
                goodsData.piecesNumber = $("#goods_" + index + "_piecesNumber").val();
                goodsData.tax = $("#goods_" + index + "_tax").val();
                goodsData.taxFree = $("#goods_" + index + "_taxFree").val();
                goodsData.taxAmount = $("#goods_" + index + "_taxAmount").val();
                goodsData.taxRate = $("#goods_" + index + "_taxRate").val();
                goodsData.stock = $("#goods_" + index + "_stock").val();
                goodsData.arrivalNum = $("#goods_" + index + "_arrivalNum").val();
            });
        });
    </script>
</head>

<body>
<table id="contentTable" class="table table-striped table-bordered table-hover" width="100%">
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
    <tbody>
    <c:forEach items="${goodsList}" var="goods" varStatus="i">
        <tr id="goods_${i.index}_tr">
            <td>
                <input name="goodsCheck" type="radio" value="${i.index}"/>
                <input id="goods_${i.index}_id" type="hidden" value="${goods.id}"/>
            </td>
            <td>
                <input id="goods_${i.index}_goodsCode" type="hidden" value="${goods.goodsCode}"/>
                    ${goods.goodsCode }
            </td>
            <td>
                <input id="goods_${i.index}_goodsName" type="hidden" value="${goods.goodsName}"/>
                    ${goods.goodsName }
            </td>
            <td>
                <input id="goods_${i.index}_goodsSpec" type="hidden" value="${goods.goodsSpec}"/>
                    ${goods.goodsSpec }
            </td>
            <td>
                <input id="goods_${i.index}_goodsType" type="hidden" value="${goods.goodsType}"/>
                    ${goods.goodsType }
            </td>
            <td>
                <input id="goods_${i.index}_manufacturer" type="hidden" value="${goods.manufacturer}"/>
                    ${goods.manufacturer }
            </td>
            <td>
                <input id="goods_${i.index}_unit" type="hidden" value="${goods.unit}"/>
                    ${goods.unit }
            </td>
            <td>
                <input id="goods_${i.index}_content" type="hidden" value="${goods.content}"/>
                    ${goods.content }
            </td>
            <td>
                <input id="goods_${i.index}_purchasePrice" type="hidden" value="${goods.purchasePrice}"/>
                    ${goods.purchasePrice }
            </td>
            <td>
                <input id="goods_${i.index}_number" type="hidden" value="${goods.number}"/>
                    ${goods.number }
            </td>
            <td>
                <input id="goods_${i.index}_tax" type="hidden" value="${goods.tax}"/>
                    ${goods.tax }
            </td>
            <td>
                <input id="goods_${i.index}_taxFree" type="hidden" value="${goods.taxFree}"/>
                    ${goods.taxFree }
            </td>
            <td>
                <input id="goods_${i.index}_taxAmount" type="hidden" value="${goods.taxAmount}"/>
                    ${goods.taxAmount }
            </td>
            <td>
                <input id="goods_${i.index}_taxRate" type="hidden" value="${goods.taxRate}"/>
                    ${goods.taxRate }
            </td>
            <td>
                <input id="goods_${i.index}_stock" type="hidden" value="${goods.stock}"/>
                    ${goods.stock }
            </td>
            <td>
                <input id="goods_${i.index}_arrivalNum" type="hidden" value="${goods.arrivalNum}"/>
                    ${goods.arrivalNum }
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>

</html>