
<%--
  Created by IntelliJ IDEA.
  User: tillu
  Date: 2019-05-04
  Time: 16:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach items="${tournament.roundRobinStage.pools}" var="pool" varStatus="loop">

    <table class="table table-dark">
        <h3>Pool ${loop.index + 1}</h3>
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">Player Name</th>
            <th scope="col">Wins</th>
            <th scope="col">Ties</th>
            <th scope="col">Loss</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${pool.players}" var="player">
        <tr>
            <th scope="row">${player.id}</th>
            <c:choose>
                <c:when test="${player.name == null}">
                    <td><input id="name-${player.id}" type="text" class="player-name"><button class="btn btn-primary player-name-btn" id="${player.id}" type="button">save</button></td>
                </c:when>
                <c:otherwise>
                    <td>${player.name}</td>
                </c:otherwise>
            </c:choose>
            <td>${player.roundRobinWins}</td>
            <td>${player.roundRobinTies}</td>
            <td>${player.roundRobinLoss}</td>
        </tr>
        </c:forEach>
        </tbody>
</c:forEach>

<script>
    $(document).ready(function(){

        $('.player-name-btn').on('click', function () {
            if ($('#name-'+this.id).val() != '') {
                $.ajax({
                    url: '/save/name',
                    type: 'POST',  // http method
                    contentType: "application/json",
                    dataType: "json",
                    data: JSON.stringify({
                        'id': this.id,
                        'name': $('#name-' + this.id).val()
                    }),  // data to submit
                    success: function (data) {
                        console.log(data);
                        $('#name-' + this.id).prop('disabled', true);
                        $('#' + this.id).prop('disabled', true);
                    },
                    error: function (errorMessage) {
                        console.error(errorMessage);
                    }
                });
            }
        });

    });
</script>
