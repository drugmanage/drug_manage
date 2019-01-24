<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>

<head>
    <title>销售订单商品展示</title>
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
                    "salesPrice": "",
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
                goodsData.id = $("#sales_" + index + "_id").val();
                goodsData.goodsCode = $("#sales_" + index + "_goodsCode").val();
                goodsData.goodsName = $("#sales_" + index + "_goodsName").val();
                goodsData.goodsSpec = $("#sales_" + index + "_goodsSpec").val();
                goodsData.goodsType = $("#sales_" + index + "_goodsType").val();
                goodsData.manufacturer = $("#sales_" + index + "_manufacturer").val();
                goodsData.unit = $("#sales_" + index + "_unit").val();
                goodsData.content = $("#sales_" + index + "_content").val();
                goodsData.salesPrice = $("#sales_" + index + "_purcasePrice").val();
                goodsData.number = $("#sales_" + index + "_number").val();
                goodsData.wholeNumber = $("#sales_" + index + "_wholeNumber").val();
                goodsData.piecesNumber = $("#sales_" + index + "_piecesNumber").val();
                goodsData.tax = $("#sales_" + index + "_tax").val();
                goodsData.taxFree = $("#sales_" + index + "_taxFree").val();
                goodsData.taxAmount = $("#sales_" + index + "_taxAmount").val();
                goodsData.taxRate = $("#sales_" + index + "_taxRate").val();
                goodsData.stock = $("#sales_" + index + "_stock").val();
                goodsData.arrivalNum = $("#sales_" + index + "_arrivalNum").val();
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
        <th>仓库</th>
        <th>货位号</th>
        <th>批号</th>
        <th>有效期至</th>
        <th>销售数量</th>
        <th>开票价格</th>
        <th>结算价</th>
        <th>高开价</th>
        <th>含税金额</th>
        <th>不含税金额</th>
        <th>税额</th>
        <th>税率</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${goodsList}" var="goods" varStatus="i">
        <tr id="sales_${i.index}_tr">
            <td>
                <input name="goodsCheck" type="radio" value="${i.index}"/>
                <input id="sales_${i.index}_id" type="hidden" value="${goods.id}"/>
            </td>
            <td>
                <input id="sales_${i.index}_goodsCode" type="hidden" value="${goods.goodsCode}"/>
                    ${goods.goodsCode }
            </td>
            <td>
                <input id="sales_${i.index}_goodsName" type="hidden" value="${goods.goodsName}"/>
                    ${goods.goodsName }
            </td>
            <td>
                <input id="sales_${i.index}_goodsSpec" type="hidden" value="${goods.goodsSpec}"/>
                    ${goods.goodsSpec }
            </td>
            <td>
                <input id="sales_${i.index}_goodsType" type="hidden" value="${goods.goodsType}"/>
                    ${goods.goodsType }
            </td>
            <td>
                <input id="sales_${i.index}_manufacturer" type="hidden" value="${goods.manufacturer}"/>
                    ${goods.manufacturer }
            </td>
            <td>
                <input id="sales_${i.index}_unit" type="hidden" value="${goods.unit}"/>
                    ${goods.unit }
            </td>
            <td>
                <input id="sales_${i.index}_content" type="hidden" value="${goods.content}"/>
                    ${goods.content }
            </td>
            <td>
                <input id="sales_${i.index}_salesPrice" type="hidden" value="${goods.repoId}"/>
                    ${goods.repoId }
            </td>
            <td>
                <input id="sales_${i.index}_number" type="hidden" value="${goods.cargoNumber}"/>
                    ${goods.cargoNumber }
            </td>
            <td>
                <input id="sales_${i.index}_tax" type="hidden" value="${goods.lotNumber}"/>
                    ${goods.lotNumber }
            </td>
            <td>
                <input id="sales_${i.index}_taxFree" type="hidden" value="${goods.validDateUntil}"/>
                    ${goods.validDateUntil }
            </td>
            <td>
                <input id="sales_${i.index}_taxFree" type="hidden" value="${goods.number}"/>
                    ${goods.number }
            </td>
            <td>
                <input id="sales_${i.index}_taxAmount" type="hidden" value="${goods.billingPrice}"/>
                    ${goods.billingPrice }
            </td>
            <td>
                <input id="sales_${i.index}_taxRate" type="hidden" value="${goods.settlementPrice}"/>
                    ${goods.settlementPrice }
            </td>
            <td>
                <input id="sales_${i.index}_stock" type="hidden" value="${goods.highPrice}"/>
                    ${goods.highPrice }
            </td>
            <td>
                <input id="sales_${i.index}_arrivalNum" type="hidden" value="${goods.tax}"/>
                    ${goods.tax }
            </td>
            <td>
                <input id="sales_${i.index}_arrivalNum" type="hidden" value="${goods.taxFree}"/>
                    ${goods.taxFree }
            </td>
            <td>
                <input id="sales_${i.index}_arrivalNum" type="hidden" value="${goods.taxAmount}"/>
                    ${goods.taxAmount }
            </td>
            <td>
                <input id="sales_${i.index}_arrivalNum" type="hidden" value="${goods.taxRate}"/>
                    ${goods.taxRate }
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>

</html>