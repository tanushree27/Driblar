<%--
  Created by IntelliJ IDEA.
  User: tillu
  Date: 2019-05-05
  Time: 02:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container-fluid">
    <div class="row">
        <form name="poolSelectForm" class="form-group" action="/stage/roundrobin" method="get">
            <div class="form-group">
                <label for="sel1">Select Pool:</label>
                <select class="form-control" id="sel1" name="poolNum">
                    <c:forEach varStatus="loop" begin="1" end="${poolsSize}">
                        <option value="${loop.index}" ${selectPool == loop.index ? "selected" : ""}>Pool ${loop.index}</option>
                    </c:forEach>
                </select>
                <small id="tournamentHelp" class="text-light form-text" style="margin-left: 30px;">Select Pool to display matches.</small>
            </div>
        </form>

        <div class="row">
            <c:forEach items="${pool.matches}" var="match">
            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                <table class="table table-dark table-match">
                    <h3 class="text-white">Pool ${loop.index + 1}</h3>
                    <thead>
                        <tr>
                            <td class="hash-class" rowspan="2">#</td>
                            <th>${match.player1.name == null ? "Player " : match.player1.name}${match.player1.name == null ? match.player1.id : ""}</th>
                        </tr>

                        <tr>
                            <td>${match.player2.name == null ? "Player " : match.player2.name}${match.player2.name == null ? match.player2.id : ""}</td>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
            </c:forEach>
        </div>
    </div>
</div>

<script>
    $(document).ready(function(){
        $('#sel1').on('change', function () {
            console.log(this.value);
            $("form[name='poolSelectForm']").submit();
        })
    });
</script>

<style>
    td, th {
        border-top: 0px !important;
    }
    .table-match {
        border-radius: 20px;
    }
    .hash-class {
        vertical-align: middle !important;
        width: 20%;
    }
</style>
