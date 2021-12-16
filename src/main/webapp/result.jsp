<%--
  Created by IntelliJ IDEA.
  User: maxku
  Date: 07.12.2021
  Time: 1:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Web2</title>
    <link rel="stylesheet" href="css/style.min.css">
</head>
<body>
<!-- header -->
<header class="header">
    <div class="container">
        <div class="header__wrap">
            <a href="" class="header__logo">Web2</a>
            <div class="header__info">
                <a href="https://vk.me/maxim_kuzn" class="header__info-name">Кузнецов Максим Андреевич P3211</a>
                <a href="https://github.com/maximax444" class="header__info-link">GitHub</a>
            </div>
        </div>
    </div>
</header>
<br><br>
<div class="container">
    <div>
        <a href="/" class="main__form-submit" style="display:inline-block;text-decoration:none;">На страницу с формой</a>
    </div>

    <table class="main__table">
        <tr>
            <th>Значение X</th>
            <th>Значение Y</th>
            <th>Значение R</th>
            <th>Результат</th>
            <th>Текущее время</th>
            <th>Время работы скрипта</th>
        </tr>
        <jsp:useBean id="shots" scope="session" class="model.Results"/>
        <c:forEach var="shoot" items="${shots.shootsList}">
            <tr>
                <td>${shoot.x}</td>
                <td>${shoot.y}</td>
                <td>${shoot.r}</td>
                <td>${shoot.result}</td>
                <td>${shoot.localTime}</td>
                <td>${shoot.processingTime}</td>
            </tr>
        </c:forEach>

    </table>
</div>
<br><br>
<!-- footer -->
<footer class="footer">
    <div class="container">
        <div class="footer__wrap">
            <a href="" class="header__logo">Web2</a>
            <div class="header__info">
                <a href="https://vk.me/maxim_kuzn" class="header__info-name">Кузнецов Максим Андреевич P3211</a>
                <a href="https://github.com/maximax444" class="header__info-link">GitHub</a>
            </div>
        </div>
    </div>
</footer>

<!-- add scripts -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="js/main.js"></script>

</body>
</html>