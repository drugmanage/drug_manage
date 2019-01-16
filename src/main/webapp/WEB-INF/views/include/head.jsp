<%@ page contentType="text/html;charset=UTF-8" %><meta http-equiv="Content-Type" content="text/html;charset=utf-8" /><meta name="author" content="http://fast.com/"/>
<meta name="renderer" content="webkit"><meta http-equiv="X-UA-Compatible" content="IE=8,IE=9,IE=10" />
<meta http-equiv="Expires" content="0"><meta http-equiv="Cache-Control" content="no-cache"><meta http-equiv="Cache-Control" content="no-store">
<script src="${ctxStatic}/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
<link href="${ctxStatic}/bootstrap/2.3.1/css_${not empty cookie.theme.value ? cookie.theme.value : 'cerulean'}/bootstrap.min.css" type="text/css" rel="stylesheet" />
<script src="${ctxStatic}/bootstrap/2.3.1/js/bootstrap.min.js" type="text/javascript"></script>
<link href="${ctxStatic}/bootstrap/2.3.1/awesome/font-awesome.min.css" type="text/css" rel="stylesheet" />
<!--[if lte IE 7]><link href="${ctxStatic}/bootstrap/2.3.1/awesome/font-awesome-ie7.min.css" type="text/css" rel="stylesheet" /><![endif]-->
<!--[if lte IE 6]><link href="${ctxStatic}/bootstrap/bsie/css/bootstrap-ie6.min.css" type="text/css" rel="stylesheet" />
<script src="${ctxStatic}/bootstrap/bsie/js/bootstrap-ie.min.js" type="text/javascript"></script><![endif]-->
<link href="${ctxStatic}/jquery-select2/3.4/select2.min.css" rel="stylesheet" />
<script src="${ctxStatic}/jquery-select2/3.4/select2.js" type="text/javascript"></script>
<script src="${ctxStatic}/jquery-select2/3.4/pinyin.js" type="text/javascript"></script>
<script src="${ctxStatic}/jquery-select2/3.4/pinyin2.js" type="text/javascript"></script>
<link href="${ctxStatic}/jquery-validation/1.11.0/jquery.validate.min.css" type="text/css" rel="stylesheet" />
<script src="${ctxStatic}/jquery-validation/1.11.0/jquery.validate.min.js" type="text/javascript"></script>
<link href="${ctxStatic}/jquery-jbox/2.3/Skins/Bootstrap/jbox.min.css" rel="stylesheet" />
<script src="${ctxStatic}/jquery-jbox/2.3/jquery.jBox-2.3.min.js" type="text/javascript"></script>
<script src="${ctxStatic}/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
<script src="${ctxStatic}/common/mustache.min.js" type="text/javascript"></script>
<link href="${ctxStatic}/common/fast.css" type="text/css" rel="stylesheet" />
<script src="${ctxStatic}/common/fast.js" type="text/javascript"></script>
<!--获取拼音-->
<script src="${ctxStatic}/common/Mtils.js" type="text/javascript"></script>
<link href="${ctxStatic}/resizable-columns/jquery.resizableColumns.css" type="text/css" rel="stylesheet" />
<script src="${ctxStatic}/resizable-columns/jquery.resizableColumns.min.js" type="text/javascript"></script>

<script type="text/javascript">var ctx = '${ctx}', ctxStatic='${ctxStatic}';</script>

<style>
    .div-a{ float:left;width:49%;border:0px solid #F00}
    .div-b{ float:left;width:49%;border:0px solid #000}
    .div-c{ margin:150px 180px; width:400px;  vertical-align:middel; border:0px solid #F00}
    .textarea-xlarge {width: 915px;}
    .table-form-control{
        width:90%;
    }
    
    table td{word-break: keep-all;white-space:nowrap;}
	table th{word-break: keep-all;white-space:nowrap;}
</style>