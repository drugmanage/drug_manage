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
                goodsData.id = $("goods_" + index + "_id").val();
                goodsData.goodsCode = $("goods_" + index + "_goodsCode").val();
                    document.getElementById("goods_" + index + "_goodsCode").innerText;
                goodsData.goodsName = document.getElementById("goods_" + index + "_goodsName").innerText;
                goodsData.goodsSpec = document.getElementById("goods_" + index + "_goodsSpec").innerText;
                goodsData.goodsType = document.getElementById("goods_" + index + "_goodsType").innerText;
                goodsData.manufacturer = document.getElementById("goods_" + index + "_manufacturer").innerText;
                goodsData.unit = document.getElementById("goods_" + index + "_unit").innerText;
                goodsData.content = document.getElementById("goods_" + index + "_content");
                goodsData.purchasePrice = document.getElementById("goods_" + index + "_purcasePrice").innerText;
                goodsData.number = document.getElementById("goods_" + index + "_number").innerText;
                goodsData.wholeNumber = document.getElementById("goods_" + index + "_wholeNumber").innerText;
                goodsData.piecesNumber = document.getElementById("goods_" + index + "_piecesNumber").innerText;
                goodsData.tax = document.getElementById("goods_" + index + "_tax").innerText;
                goodsData.taxFree = document.getElementById("goods_" + index + "_taxFree");
                goodsData.taxAmount = document.getElementById("goods_" + index + "_taxAmount").innerText;
                goodsData.taxRate = document.getElementById("goods_" + index + "_taxRate").innerText;
                goodsData.stock = document.getElementById("goods_" + index + "_stock").innerText;
                goodsData.arrivalNum = document.getElementById("goods_" + index + "_arrivalNum").innerText;

            });
        });

        function goodsOnclick(index) {
            goodsData = null;
            var goodsRadio = document.getElementsByName("goodsCheck");
            for (var element in goodsRadio) {
                if (goodsRadio[element].checked) {
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
                    goodsData.id = document.getElementById("goods_" + index + "_id").value;
                    goodsData.goodsCode = document.getElementById("goods_" + index + "_goodsCode").innerText;
                    goodsData.goodsName = document.getElementById("goods_" + index + "_goodsName").innerText;
                    goodsData.goodsSpec = document.getElementById("goods_" + index + "_goodsSpec").innerText;
                    goodsData.goodsType = document.getElementById("goods_" + index + "_goodsType").innerText;
                    goodsData.manufacturer = document.getElementById("goods_" + index + "_manufacturer").innerText;
                    goodsData.unit = document.getElementById("goods_" + index + "_unit").innerText;
                    goodsData.content = document.getElementById("goods_" + index + "_content");
                    goodsData.purchasePrice = document.getElementById("goods_" + index + "_purcasePrice").innerText;
                    goodsData.number = document.getElementById("goods_" + index + "_number").innerText;
                    goodsData.wholeNumber = document.getElementById("goods_" + index + "_wholeNumber").innerText;
                    goodsData.piecesNumber = document.getElementById("goods_" + index + "_piecesNumber").innerText;
                    goodsData.tax = document.getElementById("goods_" + index + "_tax").innerText;
                    goodsData.taxFree = document.getElementById("goods_" + index + "_taxFree");
                    goodsData.taxAmount = document.getElementById("goods_" + index + "_taxAmount").innerText;
                    goodsData.taxRate = document.getElementById("goods_" + index + "_taxRate").innerText;
                    goodsData.stock = document.getElementById("goods_" + index + "_stock").innerText;
                    goodsData.arrivalNum = document.getElementById("goods_" + index + "_arrivalNum").innerText;
                }
            }

        }
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
        <tr>
            <td>
                <input name="goodsCheck" type="radio" value="${i.index}" onclick="goodsOnclick(this.value)"/>
                <input id="goods_${i.index}_id" type="hidden" value="${goods.id}"/>
            </td>
            <td id="goods_${i.index}_goodsCode">
                    ${goods.goodsCode }
            </td>
            <td id="goods_${i.index}_goodsName">
                    ${goods.goodsName }
            </td>
            <td id="goods_${i.index}_goodsSpec">
                    ${goods.goodsSpec }
            </td>
            <td id="goods_${i.index}_goodsType">
                    ${goods.goodsType }
            </td>
            <td id="goods_${i.index}_manufacturer">
                    ${goods.manufacturer }
            </td>
            <td id="goods_${i.index}_unit">
                    ${goods.unit }
            </td>
            <td id="goods_${i.index}_content">
                    ${goods.content }
            </td>
            <td id="goods_${i.index}_purchasePrice">
                    ${goods.purchasePrice }
            </td>
            <td id="goods_${i.index}_number">
                    ${goods.number }
            </td>
            <td id="goods_${i.index}_tax">
                    ${goods.tax }
            </td>
            <td id="goods_${i.index}_taxFree">
                    ${goods.taxFree }
            </td>
            <td id="goods_${i.index}_taxAmount">
                    ${goods.taxAmount }
            </td>
            <td id="goods_${i.index}_taxRate">
                    ${goods.taxRate }
            </td>
            <td id="goods_${i.index}_stock">
                    ${goods.stock }
            </td>
            <td id="goods_${i.index}_arrivalNum">
                    ${goods.arrivalNum }
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>

</html>