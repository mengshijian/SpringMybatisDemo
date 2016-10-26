<%--
  Created by IntelliJ IDEA.
  User: fanyafeng
  Date: 16/10/18
  Time: 下午12:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>商品列表</title>
    <script type="text/javascript">
        function deleteItems() {
//            提交form
            document.itemsForm.action = "${pageContext.request.contextPath}/items/deleteItems";
            document.itemsForm.submit();
        }

        function queryItems() {
//            提交form
            document.itemsForm.action = "${pageContext.request.contextPath}/items/itemsList";
            document.itemsForm.submit();
        }
    </script>
</head>
<body>
当前用户:${username}
<c:if test="${username!=null}">
    <a href="${pageContext.request.contextPath}/logout">退出</a>
</c:if>
<form name="itemsForm" action="${pageContext.request.contextPath}/items/itemsList" method="post">
    查询条件:
    <table width="100%" border="1">
        <tr>
            <td>商品名称:<input name="itemsCustomModel.name"></td>
            <td>
                <input type="button" value="查询" onclick="queryItems()">
                <input type="button" value="批量删除" onclick="deleteItems()">
            <td><a href="${pageContext.request.contextPath}/items/editItemsQuery">批量修改</a></td>
            </td>
        </tr>
    </table>

    商品列表:
    <table width="100%" border="1">
        <tr>
            <td>选择</td>
            <td>商品名称</td>
            <td>商品价格</td>
            <td>生产日期</td>
            <td>商品描述</td>
            <td>操作</td>
        </tr>
        <c:forEach items="${itemsList}" var="item">
            <tr>
                <td><input type="checkbox" name="itemId" value="${item.id}"/></td>
                <td>${item.name}</td>
                <td>${item.price}</td>
                <td><fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <td>${item.detail}</td>

                <td><a href="${pageContext.request.contextPath}/items/editItems?id=${item.id}">修改</a></td>
            </tr>
        </c:forEach>
    </table>


</form>
</body>
</html>
