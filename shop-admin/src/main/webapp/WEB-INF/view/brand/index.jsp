<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/10/7 0007
  Time: 上午 10:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/common/head.jsp"></jsp:include>
    <title>品牌管理</title>
</head>
<body>
<jsp:include page="/common/nav-static.jsp"></jsp:include>

<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-success">
                <div class="panel-heading">品牌查询</div>
                <div class="panel-body">
                    <form class="form-horizontal" id="brandForm">
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">品牌名：</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" name="brandName" id="brandName" placeholder="请输入品牌名...">
                            </div>
                        </div>
                        <div style="text-align: center">
                            <button class="btn btn-primary" type="button" onclick="search();"><i class="glyphicon glyphicon-search"></i>查询</button>
                            <button class="btn btn-default" type="reset"><i class="glyphicon glyphicon-refresh"></i>重置</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div style="background-color: #ebcccc;width: 100%;">
        <button class="btn btn-primary" type="button" onclick="showAddBrandDlg();"><i class="glyphicon glyphicon-plus"></i>添加</button>
        <button class="btn btn-danger" type="button" onclick="deleteProducts();"><i class="glyphicon glyphicon-trash"></i>批量删除</button>
        <button class="btn btn-info" type="button" onclick="exportExcel();"><i class="glyphicon glyphicon-download-alt"></i>导出excel</button>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-info">
                <div class="panel-heading">品牌列表</div>
                <div class="panel-body">
                    <table id="brandTable" class="table table-striped table-bordered" style="width:100%">
                    <thead>
                    <tr>
                        <th>选择</th>
                        <th>品牌名</th>
                        <th>Logo</th>
                        <th>热销</th>
                        <th>排序</th>
                        <th>操作</th>
                    </tr>
                    </thead>

                    <tfoot>
                    <tr >
                        <th>选择</th>
                        <th>品牌名</th>
                        <th>Logo</th>
                        <th>热销</th>
                        <th>排序</th>
                        <th>操作</th>
                    </tr>
                    </tfoot>
                </table>
                </div>

            </div>
        </div>
    </div>
</div>

<div id="brandAddDiv" style="display:none;">
    <form class="form-horizontal" >
        <div class="form-group">
            <label  class="col-sm-2 control-label">品牌名</label>
            <div class="col-sm-4">
                <input type="text" class="form-control"   id="add_brandName" placeholder="请输入品牌名...">
            </div>
        </div>

        <div class="form-group"  >
            <label  class="col-sm-2 control-label">Logo</label>
            <div style="height:300px;">
                <div class="col-sm-6">
                    <input type="file" name="imageInfo" id="brandLogo">
                    <input type="text"  id="add_logoPath">
                </div>
            </div>
        </div>

        <div class="form-group">
            <label  class="col-sm-2 control-label">热销</label>
            <div class="col-sm-4">
                <input type="radio"   name="add_hot" value="1">是
                <input type="radio"   name="add_hot" value="0">否
            </div>
        </div>


        <div class="form-group">
            <label  class="col-sm-2 control-label">排序</label>
            <div class="col-sm-4">
                <input type="text" class="form-control"  id="add_sort" placeholder="请输入位置...">
            </div>
        </div>

    </form>
</div>


<jsp:include page="/common/script.jsp"></jsp:include>
<script>
    var v_brandAddDivHtml;
    $(function() {
        initBrandTable();
        v_brandAddDivHtml = $("#brandAddDiv").html();
    })
    
    
    function exportExcel() {
        var v_brandForm = document.getElementById("brandForm");
        v_brandForm.action = "/brand/exportExcel.jhtml";
        v_brandForm.method = "post";
        v_brandForm.submit();
    }
    
    
    
    function initBrandLogo() {
        var settings = {
            language: 'zh',
            uploadUrl: "/file/uploadImage.jhtml",
            showUpload : false,
            showRemove : false,
            allowedFileExtensions : [ 'jpg', 'png', 'jpeg', 'gif'] //上传的文件的后缀名
        };
        $("#brandLogo").fileinput(settings).on("fileuploaded", function (event, t, previewId, index) {
            var v_result = t.response;
            if (v_result.code == 200) {
                $("#add_logoPath", v_brandAddDlg).val(v_result.data);
            }
        });
    }
    
    var v_brandAddDlg;
    function showAddBrandDlg() {
        initBrandLogo();
        v_brandAddDlg = bootbox.dialog({
            title: '添加品牌',
            message: $("#brandAddDiv form"),
            size:"large",
            buttons: {
                confirm: {
                    label: '<span class="glyphicon glyphicon-ok"></span>确认',
                    className: 'btn-primary',
                    callback: function(){
                        // 点击确定按钮，发送ajax请求，插入数据
                        var v_param = {};
                        v_param.brandName = $("#add_brandName", v_brandAddDlg).val();
                        v_param.logo = $("#add_logoPath", v_brandAddDlg).val();
                        v_param.sort = $("#add_sort", v_brandAddDlg).val();
                        v_param.hot =  $("input[name='add_hot']:checked", v_brandAddDlg).val();
                        $.ajax({
                            type:"post",
                            url:"/brand/add.jhtml",
                            data:v_param,
                            success:function (result) {
                                if (result.code == 200) {
                                    search();
                                }
                            }
                        })

                    }
                },
                cancel: {
                    label: '<span class="glyphicon glyphicon-remove"></span>取消',
                    className: 'btn-danger'
                }
            }
        });
        // 还原
        $("#brandAddDiv").html(v_brandAddDivHtml);
    }
    
    function search() {
        var v_param = {};
        v_param.brandName = $("#brandName").val();

        v_brandTable.settings()[0].ajax.data = v_param;
        v_brandTable.ajax.reload();
    }
    
    
    function updateBrandSort(brandId) {
        bootbox.confirm({
            message: "你确定修改品牌顺序?",
            size: 'small',
            title: "提示信息",
            buttons: {
                confirm: {
                    label: '<span class="glyphicon glyphicon-ok"></span>确定',
                    className: 'btn-success'
                },
                cancel: {
                    label: '<span class="glyphicon glyphicon-remove"></span>取消',
                    className: 'btn-danger'
                }
            },
            callback: function (result) {
                if (result) {
                    // 发送ajax进行删除
                    var v_sort = $("#sort_"+brandId).val();
                    $.ajax({
                        type:"post",
                        url:"/brand/updateBrandSort.jhtml",
                        data:{"id":brandId, "sort":v_sort},
                        success:function (result) {
                            if (result.code == 200) {
                                search();
                            }
                        }
                    })
                }
            }
        })
    }
    
    function updateBrandHot(brandId, hot) {
        bootbox.confirm({
            message: "你确定修改品牌状态?",
            size: 'small',
            title: "提示信息",
            buttons: {
                confirm: {
                    label: '<span class="glyphicon glyphicon-ok"></span>确定',
                    className: 'btn-success'
                },
                cancel: {
                    label: '<span class="glyphicon glyphicon-remove"></span>取消',
                    className: 'btn-danger'
                }
            },
            callback: function (result) {
                if (result) {
                    // 发送ajax进行删除
                    $.ajax({
                        type:"post",
                        url:"/brand/updateBrandHot.jhtml",
                        data:{"id":brandId, "hot":hot},
                        success:function (result) {
                            if (result.code == 200) {
                                search();
                            }
                        }
                    })
                }
            }
        })
    }
    
    var v_brandTable;
    function initBrandTable() {
        v_brandTable =  $('#brandTable').DataTable( {
            "language": {
                "url": "/js/DataTables/Chinese.json"
            },
            "processing": true,
            // 是否允许检索
            "searching": false,
            "serverSide": true,
            "lengthMenu": [5, 10, 15, 20, 30],
            "ajax": {
                "url": "/brand/list.jhtml",
                "type": "POST",
                "dataSrc":function (result) {
                    if (result.code == 200) {
                        result.draw = result.data.draw;
                        result.recordsFiltered = result.data.recordsFiltered;
                        result.recordsTotal = result.data.recordsTotal;
                        return result.data.data;
                    }
                }
            },

            "columns": [
                {
                    "data": "id",
                    "render": function (data, type, row, meta) {
                        return "<input type='checkbox' value='"+data+"'>";
                    }
                },
                { "data": "brandName" },
                { "data": "logo" ,
                    "render": function (data, type, row, meta) {
                        return "<img src='"+data+"' width='100px' height='100px'/>";
                    }
                },
                {
                    "data": "hot",
                    "render": function (data, type, row, meta) {
                        return data==1?"热销<i class='glyphicon glyphicon-fire'></i>":"非热销";
                    }
                },
                {
                    "data": "sort",
                    "render": function (data, type, row, meta) {
                        var v_id = row.id;
                        return '<input type="text" class="form-control" value="'+data+'" id="sort_'+v_id+'">' +
                            '<button class="btn btn-primary" onclick="updateBrandSort(\''+v_id+'\')"><i class="glyphicon glyphicon-refresh"></i>更新</button>';
                    }
                },
                {
                    "data": "id",
                    "render": function (data, type, row, meta) {

                        var v_icon = "";
                        var v_text = "";
                        var v_color = "";
                        var v_hot = 0;

                        if (row.hot == 1) {
                            v_text = "非热销";
                            v_icon = "glyphicon glyphicon-thumbs-down";
                            v_color = "btn btn-warning";
                            v_hot = 0;
                        } else {
                            v_text = "热销";
                            v_icon = "glyphicon glyphicon-thumbs-up";
                            v_color = "btn btn-success";
                            v_hot = 1;
                        }

                        return "<div class=\"btn-group\" role=\"group\" >\n" +
                            "  <button type=\"button\" class=\"btn btn-info\" onclick=\"showUpdateProductDlg('"+data+"')\"><i class='glyphicon glyphicon-pencil'></i> 修改</button>\n" +
                            "  <button type=\"button\" class=\"btn btn-danger\" onclick=\"deleteProduct('"+data+"')\"><i class='glyphicon glyphicon-trash'></i> 删除</button>\n" +
                            "  <button type=\"button\" class=\""+v_color+"\" onclick=\"updateBrandHot('"+data+"','"+v_hot+"')\"><i class='"+v_icon+"'></i> "+v_text+"</button>\n" +
                            "</div>";
                    }
                }
            ]
        } );
    }
</script>
</body>
</html>
