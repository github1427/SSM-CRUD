<%--
<%@ taglib prefix="for" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: vain
  Date: 2018/5/15
  Time: 下午12:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%--引入jQuery--%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
    <%--引入样式--%>
    <link href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
<!-- 员工编辑Modal -->
<div class="modal fade" id="edit_emp_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel1">员工编辑</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="updateEmpForm">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="emp_edit_static"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10">
                            <input type="email" class="form-control" name="empEmail" id="empEmail_edit"
                                   placeholder="Email">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="empSex" id="sex_male_edit" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="empSex" id="sex_female_edit" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">部门</label>
                        <div class="col-sm-6">
                            <select name="dId" class="form-control" id="dept_select_edit">
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="update_empInfo">更新</button>
            </div>
        </div>
    </div>
</div>

<!-- 员工添加Modal -->
<div class="modal fade" id="add_emp_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">添加员工</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="newEmpForm">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <input class="form-control" name="empName" id="empName_input" placeholder="empName">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10">
                            <input type="email" class="form-control" name="empEmail" id="empEmail_input"
                                   placeholder="Email">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="empSex" id="sex_male" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="empSex" id="sex_female" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">部门</label>
                        <div class="col-sm-6">
                            <select name="dId" class="form-control" id="dept_select">
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="save_newEmpInfo">保存</button>
            </div>
        </div>
    </div>
</div>
<%--搭建显示页面--%>
<div class="container">
    <%--标题--%>
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>
    <%--按钮--%>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary" id="add_emp_btn">
                <span class="glyphicon glyphicon-plus"></span>
                新增
            </button>
            <button class="btn btn-danger" id="delete_emp_batch">
                <span class="glyphicon glyphicon-trash"></span>
                删除
            </button>
        </div>
    </div>
    <%--显示表格数据--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="emps_tbl">
                <thead>
                <tr>
                    <th><input type="checkbox"  id="check_all"></th>
                    <th>#</th>
                    <th>empName</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>deptName</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
    <%--显示分页信息--%>
    <div class="row">
        <%--记录信息--%>
        <div class="col-md-6" id="page_info">
        </div>
        <%--分页条--%>
        <div class="col-md-6">
            <nav aria-label="Page navigation">
                <ul class="pagination" id="page_nav">
                </ul>
            </nav>
        </div>
    </div>
    <script type="text/javascript">
        //全局变量：总记录数
        var totalRecord;

        $(function () {
            to_Page(1);
        });

        function to_Page(pn) {
            $.ajax({
                url: "${pageContext.request.contextPath}/emps",
                data: "pn=" + pn,
                type: "GET",
                success: function (result) {
                    //解析并显示员工信息
                    build_emps_tbl(result);
                    //解析并显示分页信息
                    build_page_info(result);
                    //解析并显示分页条信息
                    build_page_nav(result);
                }
            });
        }

        function build_emps_tbl(result) {
            page_num=result.extend.pageInfo.pageNum;
            $("#emps_tbl tbody").empty();
            var emps = result.extend.pageInfo.list;
            $.each(emps, function (index, item) {
                var empId = $("<td></td>").append(item.empId);
                var empName = $("<td></td>").append(item.empName);
                var empSex = $("<td></td>").append(item.empSex);
                var empEmail = $("<td></td>").append(item.empEmail);
                var deptName = $("<td></td>").append(item.dept.deptName);
                var empBtn = $("<td></td>").append($("<button></button>").addClass("btn btn-primary edit_btn").attr("emp_id", item.empId).attr("page_num", result.extend.pageInfo.pageNum)
                    .append($("<span></span>").addClass("glyphicon glyphicon-pencil btn-group-xs")).append("编辑"))
                    .append(" ").append($("<button></button>").addClass("btn btn-danger delete_btn").attr("emp_id", item.empId).attr("page_num", result.extend.pageInfo.pageNum)
                        .append($("<span></span>").addClass("glyphicon glyphicon-trash btn-group-xs ")).append("删除"));
                var checkBox=$("<td></td>").append($("<input type=\"checkbox\"  class=\"check_ele\">"));
                $("<tr></tr>").append(checkBox).append(empId)
                    .append(empName)
                    .append(empSex)
                    .append(empEmail)
                    .append(deptName)
                    .append(empBtn)
                    .appendTo("#emps_tbl tbody");
            });
        }

        function build_page_info(result) {
            $("#page_info").empty();
            $("#page_info").append("当前页：" + result.extend.pageInfo.pageNum +
                " 总页数:" + result.extend.pageInfo.pages +
                " 总记录数：" + result.extend.pageInfo.total);
            totalRecord = result.extend.pageInfo.total;
        }

        function build_page_nav(result) {
            $("#page_nav").empty();
            var firstPage = $("<li></li>").append($("<a></a>").attr("href", "#").append("首页"));
            firstPage.click(function () {
                to_Page(1);
            });
            var lastPage = $("<li></li>").append($("<a></a>").attr("href", "#").append("尾页"));
            lastPage.click(function () {
                to_Page(result.extend.pageInfo.pages);
            });
            var prePage = $("<li></li>").append($("<a></a>").attr("href", "#").attr("aria-label", "Previous").append($("<span></span>").append("&laquo;")));
            if (result.extend.pageInfo.hasPreviousPage) {
                prePage.click(function () {
                    to_Page(result.extend.pageInfo.prePage);
                });
            } else {
                prePage.addClass("disabled");
            }
            var nextPage = $("<li></li>").append($("<a></a>").attr("href", "#").attr("aria-label", "Next").append($("<span></span>").append("&raquo;")));
            if (result.extend.pageInfo.hasNextPage) {
                nextPage.click(function () {
                    to_Page(result.extend.pageInfo.nextPage);
                });
            } else {
                nextPage.addClass("disabled");
            }
            $("#page_nav").append(firstPage).append(prePage);
            $.each(result.extend.pageInfo.navigatepageNums, function (index, item) {
                var midPage = $("<li></li>").append($("<a></a>").attr("href", "#").append(item));
                if (item === result.extend.pageInfo.pageNum) {
                    midPage.addClass("active");
                }
                midPage.click(function () {
                    to_Page(item);
                });
                $("#page_nav").append(midPage);
            });
            $("#page_nav").append(nextPage).append(lastPage);
        }

        $("#add_emp_btn").click(function () {
            ClearForm("newEmpForm");
            //发送一个ajax请求，获取部门名称信息
            getDeptNames("#dept_select");
            //弹出模态框
            $("#add_emp_modal").modal({
                backdrop: "static"
            });
        });

        //表单清除
        function ClearForm(id) {
            var objId = document.getElementById(id);
            if (objId == undefined) {
                return;
            }
            for (var i = 0; i < objId.elements.length; i++) {
                if (objId.elements[i].type == "text") {
                    objId.elements[i].value = "";
                }
                else if (objId.elements[i].type == "password") {
                    objId.elements[i].value = "";
                }
                else if (objId.elements[i].type == "checkbox") {
                    objId.elements[i].checked = false;
                } else if (objId.elements[i].type == "email") {
                    objId.elements[i].value = "";
                }
                else if (objId.elements[i].type == "select-multiple") {
                    for (var j = 0; j < objId.elements[i].options.length; j++) {
                        objId.elements[i].options[j].selected = false;
                    }
                }
                else if (objId.elements[i].type == "textarea") {
                    objId.elements[i].value = "";
                }

            }
            $("#" + id).find("*").removeClass("has-error has-success");
            $("#" + id).find(".help-block").text("");
        }

        //获取部门名称信息
        function getDeptNames(ele) {
            $(ele).empty();
            $.ajax({
                url: "${pageContext.request.contextPath}/depts",
                type: "GET",
                success: function (result) {
                    $.each(result.extend.depts, function (index, dept) {
                        $(ele).append($("<option></option>").attr("value", dept.deptId).append(dept.deptName));
                    })
                }
            });
        }


        //保存添加的员工信息
        $("#save_newEmpInfo").click(function () {
            if (validate_empInfo()) {
                $.ajax({
                    url: "${pageContext.request.contextPath}/emps",
                    type: "POST",
                    data: $("#newEmpForm").serialize(),
                    success: function (result) {
                        if (result.code === 100) {
                            alert(result.message);
                            $("#add_emp_modal").modal("hide");
                            to_Page(totalRecord);
                        } else {
                            if (result.extend.error.empName != undefined) {
                                show_errorMsg("#empName_input", "error", result.extend.error.empName);
                            }
                            if (result.extend.error.empEmail != undefined) {
                                show_errorMsg("#empEmail_input", "error", result.extend.error.empEmail);
                            }
                        }
                    }
                });
            }
        });

        //校验员工表单信息。
        $("#empName_input").blur(function () {
            var empName = $("#empName_input").val();
            var reg = /(^[a-zA-Z0-9_-]{3,16}$)|(^[\u2E80-\u9FFF]{2,4}$)/;
            if (!reg.test(empName)) {
                show_errorMsg("#empName_input", "error", "姓名英文字符3-10或中文2-4");
                return;
            } else {
                show_errorMsg("#empName_input", "success", "");
            }
            judgeEmpName(empName);
        });
        $("#empName_input").focus(function () {
            $("#empName_input").parent().removeClass("has-success has-error");
            $("#empName_input").next("span").text("");
        });
        $("#empEmail_input").blur(function () {
            var empEmail = $("#empEmail_input").val();
            var reg = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
            if (!reg.test(empEmail)) {
                show_errorMsg("#empEmail_input", "error", "邮箱格式不合法");
            } else {
                show_errorMsg("#empEmail_input", "success", "");
            }
        });
        $("#empEmail_edit").blur(function () {
            var empEmail = $("#empEmail_edit").val();
            var reg = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
            if (!reg.test(empEmail)) {
                show_errorMsg("#empEmail_edit", "error", "邮箱格式不合法");
            } else {
                show_errorMsg("#empEmail_edit", "success", "");
            }
        });
        $("#empEmail_input").focus(function () {
            $("#empEmail_input").parent().removeClass("has-success has-error");
            $("#empEmail_input").next("span").text("");
        });

        function show_errorMsg(id, status, msg) {
            $(id).parent().removeClass("has-success has-error");
            if ("success" === status) {
                $(id).parent().addClass("has-success");
                $(id).next("span").text(msg);
            } else if ("error" === status) {
                $(id).parent().addClass("has-error");
                $(id).next("span").text(msg);
            }
        }

        //判断是否重名 （其实没必要，就当用户名好了）
        function judgeEmpName(empName) {
            $.ajax({
                url: "${pageContext.request.contextPath}/judgeEmpName",
                data: "empName=" + empName,
                type: "POST",
                success: function (result) {
                    if (result.extend.emp != null) {
                        show_errorMsg("#empName_input", "error", "姓名重复");
                    } else {
                        show_errorMsg("#empName_input", "success", "");
                    }
                }
            });
        }

        function validate_empInfo() {
            if ($("#empName_input").val() === "") {
                show_errorMsg("#empName_input", "error", "姓名不能为空");
            }
            if ($("#empEmail_input").val() === "") {
                show_errorMsg("#empEmail_input", "error", "邮箱不能为空");
            }
            if ($("#empName_input").next("span").text() != "" || $("#empEmail_input").next("span").text() != "") {
                return false;
            } else {
                return true;
            }
        }

        //给编辑按钮添加事件
        var page_num;
        $(document).on("click", ".edit_btn", function () {
            //获取部门名称信息
            getDeptNames("#dept_select_edit");
            //模态框中显示所编辑人员的信息
            getEmpById($(this).attr("emp_id"));
            //将员工Id传给更新按钮
            $("#update_empInfo").attr("edit_id", $(this).attr("emp_id"));
            //将当前页传给全局变量page_num
            page_num = $(this).attr("page_num");
            //弹出模态框
            $("#edit_emp_modal").modal({
                backdrop: "static"
            });
        });

        //根据员工id获取员工信息
        function getEmpById(empId) {
            $.ajax({
                url: "${pageContext.request.contextPath}/emps/" + empId,
                type: "GET",
                success: function (result) {
                    $("#emp_edit_static").text(result.extend.emp.empName);
                    $("#empEmail_edit").val(result.extend.emp.empEmail);
                    $("#edit_emp_modal input[name=empSex]").val([result.extend.emp.empSex]);
                    $("#edit_emp_modal select").val([result.extend.emp.dId]);
                }
            });
        }

        //更新员工信息
        $("#update_empInfo").click(function () {
            if ($("#empEmail_input").next("span").text() != "") {
                return false;
            }
            $.ajax({
                url: "${pageContext.request.contextPath}/emps/" + $(this).attr("edit_id"),
                data: $("#updateEmpForm").serialize(),
                type: "PUT",
                success: function (result) {
                    if (result.code === 100) {
                        alert(result.message);
                        $("#edit_emp_modal").modal("hide");
                        to_Page(page_num);
                    } else {
                        if (result.extend.error.empEmail != undefined) {
                            show_errorMsg("#empEmail_edit", "error", result.extend.error.empEmail);
                        }
                    }
                }
            });
        });

        //给删除按钮添加事件
        $(document).on("click", ".delete_btn", function () {
            page_num = $(this).attr("page_num");
            var empName = $(this).parents("tr").find("td:eq(2)").text();
            var editId=$(this).attr("emp_id");
            if (confirm("确定要删除" + empName + "吗？")) {
                $.ajax({
                    url: "${pageContext.request.contextPath}/emps/"+editId,
                    type:"DELETE",
                    success:function (result) {
                        alert(result.message);
                        to_Page(page_num);
                    }
                });
            }
        });

        //全选/全不选实现
        $("#check_all").click(function () {
            $(".check_ele").prop("checked",$(this).prop("checked"));
        });

        //所有check_ele选上时候check_all也选上
        $(document).on("click",".check_ele",function () {
           var flag=$(".check_ele:checked").length===$(".check_ele").length;
            $("#check_all").prop("checked",flag);
        });

        //批量删除按钮添加事件
        $("#delete_emp_batch").click(function () {
            if($(".check_ele:checked").length==0){
                alert("请选中要删除的员工");
                return;
            }
            var empNames="";
            var ids="";
            $.each($(".check_ele:checked"),function () {
                empNames+=$(this).parents("tr").find("td:eq(2)").text()+",";
                ids+=$(this).parents("tr").find("td:eq(1)").text()+"-";
            });
            empNames=empNames.substring(0,empNames.length-1);
            ids=ids.substring(0,ids.length-1);
            if(confirm("确定要删除 "+empNames+"吗？")){
                $.ajax({
                    url:"${pageContext.request.contextPath}/emps/"+ids,
                    type:"DELETE",
                    success:function (result) {
                        alert(result.message);
                        to_Page(page_num);
                    }
                });
            }
        });
    </script>
</div>
</body>
</html>