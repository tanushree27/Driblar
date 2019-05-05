
<%--
  Created by IntelliJ IDEA.
  User: tillu
  Date: 2019-05-04
  Time: 16:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container-fluid">
<div class="row">
<c:forEach items="${tournament.roundRobinStage.pools}" var="pool" varStatus="loop">
    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
    <table class="table table-dark">
        <h3 class="text-white">Pool ${loop.index + 1}</h3>
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">Player Name</th>
            <th scope="col">Wins</th>
            <th scope="col">Ties</th>
            <th scope="col">Loss</th>
            <th scope="col">Points</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${pool.players}" var="player">
        <tr>
            <th scope="row">${player.id}</th>
            <c:choose>
                <c:when test="${player.name == null}">
                    <td id="td-${player.id}">
                        <div class="row">
                            <div class="col-sm-8">
                                <input id="name-${player.id}" type="text" class="form-control form-control-sm player-name">
                            </div>
                            <div class="col-sm-4">
                                <button class="btn btn-primary player-name-btn btn-sm" id="${player.id}" type="button">save</button>
                            </div>
                        </div>
                    </td>
                </c:when>
                <c:otherwise>
                    <td>${player.name}</td>
                </c:otherwise>
            </c:choose>
            <td>${player.roundRobinWins}</td>
            <td>${player.roundRobinTies}</td>
            <td>${player.roundRobinLoss}</td>
            <td>${player.points}
                <c:if test="${player.qualified}">
                    <div class="trend-qualified">Q</div>
                </c:if>
            </td>
        </tr>
        </c:forEach>
        </tbody>
    </table>
    </div>
</c:forEach>
</div>
</div>
<script>
    $(document).ready(function(){

        $('.player-name-btn').on('click', function () {
            if ($('#name-'+this.id).val() != '') {
                var name = '#name-' + this.id;
                var id = this.id;
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
                        //data = JSON.parse(data);
                        console.log('#td-'+this.id+"  "+data.text);
                        $('#td-'+id).html(data.text);
                    },
                    error: function (errorMessage) {
                        console.error(errorMessage);
                    }
                });
            }
        });

    });
</script>

<style>
    .player-name-btn {
        margin-left: 10px;
    }
</style>