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
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.4.4.min.js"></script>
    <%--引入样式--%>
    <link href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
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
                <button class="btn btn-primary">
                    <span class="glyphicon glyphicon-plus"></span>
                    新增
                </button>
                <button class="btn btn-danger">
                    <span class="glyphicon glyphicon-trash"></span>
                    删除
                </button>
            </div>
        </div>
        <%--显示表格数据--%>
        <div class="row">
            <div class="col-md-12">
                <table class="table table-hover">
                    <tr>
                        <th>#</th>
                        <th>empName</th>
                        <th>gender</th>
                        <th>email</th>
                        <th>deptName</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach items="${pageInfo.list}" var="emp">
                        <tr>
                            <th>${emp.empId}</th>
                            <th>${emp.empName}</th>
                            <th>${emp.empSex}</th>
                            <th>${emp.empEmail}</th>
                            <th>${emp.dept.deptName}</th>
                            <th>
                                <button class="btn btn-primary">
                                    <span class="glyphicon glyphicon-pencil btn-group-xs"></span>
                                    编辑
                                </button>
                                <button class="btn btn-danger">
                                    <span class="glyphicon glyphicon-trash btn-group-xs"></span>
                                    删除
                                </button>
                            </th>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
        <%--显示分页信息--%>
        <div class="row">
            <%--记录信息--%>
            <div class="col-md-6">
                当前页：${pageInfo.pageNum} 总页数:${pageInfo.pages} 总记录数：${pageInfo.total}
            </div>
            <%--分页条--%>
            <div class="col-md-6">
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <li><a href="${pageContext.request.contextPath}/allEmps?pn=1">首页</a></li>
                        <for:choose>
                            <for:when test="${pageInfo.pageNum>1}">
                                <li>
                                    <a href="${pageContext.request.contextPath}/allEmps?pn=${pageInfo.pageNum-1}" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                            </for:when>
                            <for:otherwise>
                                <li class="disabled">
                                    <a href="#" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                            </for:otherwise>
                        </for:choose>
                        <for:forEach items="${pageInfo.navigatepageNums}" var="pNum">
                            <for:if test="${pageInfo.pageNum==pNum}">
                                <li class="active"><a href="${pageContext.request.contextPath}/allEmps?pn=${pNum}">${pNum}</a></li>
                            </for:if>
                            <for:if test="${pageInfo.pageNum!=pNum}">
                                <li><a href="${pageContext.request.contextPath}/allEmps?pn=${pNum}">${pNum}</a></li>
                            </for:if>
                        </for:forEach>
                        <for:choose>
                            <for:when test="${pageInfo.pageNum<pageInfo.pages}">
                                <li>
                                    <a href="${pageContext.request.contextPath}/allEmps?pn=${pageInfo.pageNum+1}" aria-label="Next">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                            </for:when>
                            <for:otherwise>
                                <li class="disabled">
                                    <a href="#" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </for:otherwise>
                        </for:choose>
                        <li><a href="${pageContext.request.contextPath}/allEmps?pn=${pageInfo.pages}">尾页</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</body>
</html>
