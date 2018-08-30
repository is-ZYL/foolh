<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <base href="<%=basePath%>">
    <!-- jsp文件头和头部 -->
    <%@ include file="../system/index/top.jsp" %>
    <style>
        <!-- 防止vue在网络慢的情况下 加载时闪现模板的解决方法 -->
        [v-cloak]{ display: none; }
        nav li:hover{
            cursor: pointer;
        }
    </style>
</head>
<body class="no-skin">

<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
    <!-- /section:basics/sidebar -->
    <div class="main-content">
        <div class="main-content-inner">
            <div class="page-content">
                <div class="row" id="zhongxingss">
                    <div class="col-xs-12">
                        <table id="dynamic-table"
                               class="table table-striped table-bordered table-hover">
                            <thead>
                            <tr>
                                <th class="center" style="width: 35px;">
                                    <label class="pos-rel">
                                        <input type="checkbox" class="ace" id="zcheckbox" @click="chooseAll()"/><span
                                            class="lbl"></span>
                                    </label>
                                </th>
                                <th class="center" style="width: 50px;">序号</th>
                                <th class='center'>类型</th>
                                <th class='center' style="width: 120px;">操作</th>
                            </tr>
                            </thead>
                            <tbody id="foolTypeList">
                            <!-- 开始循环 -->
                            <tr v-cloak v-for="ser in list">
                                <td class='center' style="width: 30px;">
                                    <label><input type='checkbox' name='ids' :value="ser.id" class="ace"/>
                                        <span class="lbl"></span>
                                    </label>
                                </td>
                                <td class='center'>{{ser.id }}</td>
                                <td >{{ser.type }}</td>
                                <td class='center'>
                                    <div class="hidden-sm hidden-xs action-buttons">
                                      <a class="red" @click="delmenu(ser.id)"> <i
                                            class="ace-icon fa fa-trash-o bigger-130" title="删除"></i>
                                    </a>
                                    </div>
                                    <div class="hidden-md hidden-lg">
                                        <div class="inline pos-rel">
                                            <button class="btn btn-minier btn-yellow dropdown-toggle"
                                                    data-toggle="dropdown" data-position="auto">
                                                <i class="ace-icon fa fa-caret-down icon-only bigger-120"></i>
                                            </button>

                                            <ul
                                                    class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
                                                <li><a @click="delmenu(ser.id)"
                                                       class="tooltip-error" data-rel="tooltip" title="Delete">
																	<span class="red"> <i
                                                                            class="ace-icon fa fa-trash-o bigger-120"
                                                                            title="删除"></i>
																</span>
                                                </a></li>

                                            </ul>
                                        </div>
                                    </div>
                                </td>
                            </tr>


                            </tbody>
                        </table>

                        <div>
                            &nbsp;&nbsp;<a class="btn btn-sm btn-success" onclick="addRole();">新增类型</a>
                        </div>

                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.page-content -->
        </div>
    </div>
    <!-- /.main-content -->


    <!-- 返回顶部 -->
    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
    </a>

</div>
<!-- /.main-container -->
<!-- basic scripts -->
<!-- 页面底部js¨ -->
<%@ include file="../system/index/foot.jsp" %>
<!-- 删除时确认窗口 -->
<script src="static/ace/js/bootbox.js"></script>
<!-- ace scripts -->
<script src="static/ace/js/ace/ace.js"></script>
<!-- 删除时确认窗口 -->
<script src="static/vue.js"></script>
<script src="static/vue-resource.js"></script>
<!-- ace scripts -->
<script src="static/ace/js/ace/ace.js"></script>
<!-- 下拉框 -->
<script src="static/ace/js/chosen.jquery.js"></script>
<script src="https://cdn.bootcss.com/moment.js/2.18.1/moment-with-locales.min.js"></script>
<!-- 日期框 -->
<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
<!--提示框-->
<script type="text/javascript" src="static/js/jquery.tips.js"></script>
<script type="text/javascript">
    $(top.hangge());
    // 截取，得到项目名称
    var pathName=window.document.location.pathname;
    var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);

    //新增组
    function addRole() {
        layer.prompt({
            formType: 0,
            value: '',
            title: '请输入类型名',
            area: ['200px', '100px'] //自定义文本域宽高
        }, function (value, index, elem) {
            var isOk = false;
            $.each(menuList.list, function (a, b) {
                if (b.type == value) {
                    layer.msg(value+"已存在，不能重复添加！", {icon: 5});
                    isOk = false;
                    return;
                } else if (b.type != value){
                    isOk = true;
                }
            });
            if (isOk) {
             menuList.addType(value);
            }
            layer.close(index);
        })
    }

    var menuList = new Vue({
        el: '#zhongxingss',
        data: {
            list: []
        },
        created: function () {
            var _this = this;
            $.ajax({
                url: "<%=basePath%>fool/getFoolType",
                type: "get",
                success: function (data) {
                    _this.list = data;
                }, error: function () {
                    layer.msg("获取菜品类型失败！！！", {icon: 5});
                }

            })
        },
        methods: {
            getTypeList:function(){
                var _this = this;
                $.ajax({
                    url: "<%=basePath%>fool/getFoolType",
                    type: "get",
                    success: function (data) {
                        _this.list = data;
                    }, error: function () {
                        layer.msg("获取菜品类型失败！！！", {icon: 5});
                    }
                })
            },addType:function(value){
                var _this = this;
                $.ajax({
                    url: "<%=basePath%>fool/addFoolType",
                    type: "post",
                    data:{"type":value},
                    success: function (data) {
                        layer.msg("添加成功",{icon:6});
                        menuList.getTypeList();
                    }, error: function () {
                        layer.msg("获取菜品类型失败！！！", {icon: 5});
                    }

                })
            },
            delmenu: function (id) {
                layer.confirm("确定要删除此菜品类型吗?", function (result) {
                    if (result) {
                        var url = projectName + "/fool/DeleteFoolType";
                        $.ajax({
                            url: url,
                            data: {"id":id},
                            type: "post",
                            success: function (data) {
                            	layer.closeAll('dialog');
                                //成功，刷新当前页面
                                menuList.getTypeList();
                            },
                            error: function () {
                            	layer.closeAll('dialog');
                                layer.msg("服务器异常，请稍后再试",{icon:5});
                                menuList.getTypeList();
                            }
                        });
                    }
                });
            },
            chooseAll: function () {
                if ($("#zcheckbox").is(":checked")) {
                    $("input[name='ids']:checkbox").each(function () {
                        $(this).prop("checked", true);
                    });
                } else {
                    $("input[name='ids']:checkbox").each(function () {
                        $(this).prop("checked", false);
                    });
                }
            }
        }

    })

</script>


</body>
</html>