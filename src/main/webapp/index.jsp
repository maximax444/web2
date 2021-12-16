
<%@ page import="java.util.List" %>
<%@ page import="model.Results" %>
<%@ page import="model.Shoot" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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

<!-- main section -->
<section class="main">
    <div class="container">
        <div class="main__wrap">
            <div class="main__img">
                <canvas id="canvas"></canvas>
                <div class="main__img-error">
                    Выберите R!
                </div>
            </div>
            <form class="main__form" method="post" action="${pageContext.request.contextPath}/check">
                <h1 class="main__title">2-st Lab</h1>
                <div class="main__btns">
                    <input type="hidden" class="main__input-hidden" name="coordX" value="0">
                    <div class="main__form-subtitle">Выберите X:</div>
                    <div class="main__btns-wrap">
                        <button data-value="-3">X = -3</button>
                        <button data-value="-2">X = -2</button>
                        <button data-value="-1">X = -1</button>
                        <button data-value="0">X = 0</button>
                        <button data-value="1">X = 1</button>
                        <button data-value="2">X = 2</button>
                        <button data-value="3">X = 3</button>
                        <button data-value="4">X = 4</button>
                        <button data-value="5">X = 5</button>
                    </div>
                </div>
                <div class="main__form-top">
                    <input type="text" class="main__input-text" name="coordY" placeholder="Введите Y">
                </div>
                <div class="main__radio">
                    <label class="main__radio-block">
                        <input type="radio" name="coordR" value="1">
                        <span>R=1</span>
                    </label>
                    <label class="main__radio-block">
                        <input type="radio" name="coordR" value="2">
                        <span>R=2</span>
                    </label>
                    <label class="main__radio-block">
                        <input type="radio" name="coordR" value="3">
                        <span>R=3</span>
                    </label>
                    <label class="main__radio-block">
                        <input type="radio" name="coordR" value="4">
                        <span>R=4</span>
                    </label>
                    <label class="main__radio-block">
                        <input type="radio" name="coordR" value="5">
                        <span>R=5</span>
                    </label>
                </div>
                <button class="main__form-submit">Отправить</button>
            </form>
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
                    <td class="x-point">${shoot.x}</td>
                    <td class="y-point">${shoot.y}</td>
                    <td class="r-point">${shoot.r}</td>
                    <td>${shoot.result}</td>
                    <td>${shoot.localTime}</td>
                    <td>${shoot.processingTime}</td>
                </tr>
            </c:forEach>
            <%--<%
                List resList = (List) session.getAttribute("shots");
                for(model.Shoot shoot : resList) {
                    System.out.println(( shoot).getX());
                }
            %>--%>

        </table>
        <br><br><br>
        <form action="/check" method="post">
            <input type="hidden" name="clear" value="true">
            <button class="main__form-submit" style="width: 100%;text-align:center;">Очистить таблицу</button>
        </form>
    </div>
</section>

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