<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>商品资料管理</title>
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

        function allcheck() {
            var nn = $("#allboxs").is(":checked"); //判断th中的checkbox是否被选中，如果被选中则nn为true，反之为false
            if (nn == true) {
                var namebox = $("input[name^='boxs']");  //获取name值为boxs的所有input
                for (i = 0; i < namebox.length; i++) {
                    namebox[i].checked = true;    //js操作选中checkbox
                }
            }
            if (nn == false) {
                var namebox = $("input[name^='boxs']");
                for (i = 0; i < namebox.length; i++) {
                    namebox[i].checked = false;
                }
            }
        }

        var goodsArr = [];

        function appendHtml(newMaxId, goods) {
            var trStr = '<tr id="' + this.socpName + 'tr_' + newMaxId + '">'
                + '<td>'
                + '<input type="hidden" name="itemGoodsId" value="' + newMaxId + '"/>'
                + '<input type="hidden" name="goodsList[' + newMaxId + '].goodsId" value="' + goods.id + '"/>'
                + '<input type="text" class="table-form-control" name="goodsList[' + newMaxId + '].goodsCode"'
                + 'value="' + goods.goodsCode + '" valid="vtext"/>'
                + '</td>'
                + '<td>'
                + '<input type="text" class="table-form-control" name="goodsList[' + newMaxId + '].goodsName"'
                + 'value="' + goods.goodsName + '" valid="vtext"/>'
                + '</td>'
                + '<td>'
                + '<input type="text" class="table-form-control" name="goodsList[' + newMaxId + '].goodsSpec"'
                + 'value="" valid="vtext"/>'
                + '</td>'
                + '<td>'
                + '<input type="text" class="table-form-control" name="goodsList[' + newMaxId + '].goodsType"'
                + 'value="" valid="vtext"/>'
                + '</td>'
                + '<td>'
                + '<input type="text" class="table-form-control" name="goodsList[' + newMaxId + '].manufacturer"'
                + 'value="" valid="vtext"/>'
                + '</td>'
                + '<td>'
                + '<input type="text" class="table-form-control" name="goodsList[' + newMaxId + '].unit"'
                + 'value="" valid="vtext"/>'
                + '</td>'
                + '<td>'
                + '<input type="text" class="table-form-control" name="goodsList[' + newMaxId + '].content"'
                + 'value="" valid="vtext"/>'
                + '</td>'
                + '<td>'
                + '<input type="text" class="table-form-control" name="goodsList[' + newMaxId + '].retailPrice"'
                + 'value="" valid="vtext"/>'
                + '</td>'
                + '<td>'
                + '<input type="text" class="table-form-control" name="goodsList[' + newMaxId + '].number"'
                + 'value="" valid="vtext"/>'
                + '</td>'
                + '<td>'
                + '<input type="text" class="table-form-control" name="goodsList[' + newMaxId + '].tax"'
                + 'value="" valid="vtext"/>'
                + '</td>'
                + '<td>'
                + '<input type="text" class="table-form-control" name="goodsList[' + newMaxId + '].stock"'
                + 'value="" valid="vtext"/>'
                + '</td>'
                + '<td>'
                + '<input type="text" class="table-form-control" name="goodsList[' + newMaxId + '].arrivalNum"'
                + 'value="" valid="vtext"/>'
                + '</td>'
                + '<td>'
                + '<a href="javascript:void(0)" class="btnDel" onclick="oper.goods.del(' + newMaxId + ');">删除</a>'
                + '</td>'
                + '</tr>';
            var html = trStr;
            return html;
        }


        function boxClick(goods) {
            goodsArr.push(goods);
        }

    </script>
</head>
<body>
<form:form id="searchForm" modelAttribute="goods" action="${ctx}/purchase/purchaseGoods/getGoodsList" method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
        <li><label>商品分类：</label>
            <form:select path="goodsCategory" class="input-medium">
                <form:option value="" label=""/>
                <form:options items="${fns:getDictList('goods_category')}" itemLabel="label" itemValue="value"
                              htmlEscape="false"/>
            </form:select>
        </li>
        <li><label>档案号：</label>
            <form:input path="fileNumber" htmlEscape="false" maxlength="20" class="input-medium"/>
        </li>
        <li><label>商品编码：</label>
            <form:input path="goodsCode" htmlEscape="false" maxlength="32" class="input-medium"/>
        </li>
        <li><label>商品名：</label>
            <form:input path="goodsName" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
        <li class="clearfix"></li>
    </ul>
</form:form>
<sys:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>选择</th>
        <th>商品分类</th>
        <th>商品编码</th>
        <th>商品名</th>
        <th>拼音简码</th>
        <th>商品剂型</th>
        <th>商品描述</th>
        <th>进项税率</th>
        <th>批文有效期</th>
        <th>生产厂家</th>
        <th>批件号</th>
        <th>核心属性</th>
        <th>零售属性</th>
        <th>零售价</th>
        <th>含税零售价</th>
        <th>商品条形码编码</th>
        <th>商品电子监管码</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="goods">
        <tr>
            <td>
                <input name="boxs" type="checkbox" value="${goods}" onclick="boxClick(this.value)"/>
            </td>
            <td>
                    ${fns:getDictLabel(goods.goodsCategory, 'goods_category', '')}
            </td>
            <td>
                    ${goods.goodsCode}
            </td>
            <td>
                    ${goods.goodsName}
            </td>
            <td>
                    ${goods.logogram}
            </td>
            <td>
                    ${fns:getDictLabel(goods.goodsType, 'goods_type', '')}
            </td>
            <td>
                    ${goods.goodsDesc}
            </td>
            <td>
                    ${goods.entryTaxRate}
            </td>
            <td>
                    ${goods.approvalValidity}
            </td>
            <td>
                    ${goods.manufacturer}
            </td>
            <td>
                    ${goods.certificateNo}
            </td>
            <td>
                    ${fns:getDictLabel(goods.coreType, 'core_type', '')}
            </td>
            <td>
                    ${goods.retailType}
            </td>
            <td>
                    ${goods.retailPrice}
            </td>
            <td>
                    ${goods.taxRetailPrice}
            </td>
            <td>
                    ${goods.barCode}
            </td>
            <td>
                    ${goods.supervisionCode}
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>