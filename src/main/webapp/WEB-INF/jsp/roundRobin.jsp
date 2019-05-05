<%--
  Created by IntelliJ IDEA.
  User: tillu
  Date: 2019-05-05
  Time: 02:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;tcharset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container-fluid">
    <div class="row">
        <form name="poolSelectForm" class="form-group" action="/stage/roundrobin" method="get">
            <c:if test="${!bracketLocked}">
                <p>Click on # to illustrate a Tie</p>
                <p>Click on Player to indicate that he/she is the winner of that match</p>
            </c:if>
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
    </div>
        <div class="row">
            <c:forEach items="${pool.matches}" var="match" varStatus="matchIndex">
            <div class="col-md-3 col-sm-4 col-xs-6">
                <table class="table table-dark table-match" id="match-${matchIndex.index}">
                    <thead>
                        <tr>
                            <td class="click-to-win hash-class" rowspan="2" onclick="selectWin(${matchIndex.index}, 0)">#</td>
                            <th class="click-to-win" onclick="selectWin(${matchIndex.index}, 1)">${match.player1.name == null ? "Player " : match.player1.name}${match.player1.name == null ? match.player1.id : ""}
                                <c:choose>
                                    <c:when test="${match.outcome != null}">
                                        <c:choose>
                                            <c:when test="${match.outcome eq 'TIE'}">
                                                <div id="player1-match-${matchIndex.index}" class="trend-tie">T</div>
                                            </c:when>
                                            <c:when test="${match.outcome eq 'PLAYER1'}">
                                                <div id="player1-match-${matchIndex.index}" class="trend-win">W</div>
                                            </c:when>
                                            <c:otherwise>
                                                <div id="player1-match-${matchIndex.index}" class="trend-loss">L</div>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:when>
                                    <c:otherwise>
                                        <div id="player1-match-${matchIndex.index}"></div>
                                    </c:otherwise>
                                </c:choose>
                            </th>
                        </tr>
                        <tr>
                            <td class="click-to-win" onclick="selectWin(${matchIndex.index}, 2)">${match.player2.name == null ? "Player " : match.player2.name}${match.player2.name == null ? match.player2.id : ""}
                                <c:choose>
                                    <c:when test="${match.outcome != null}">
                                        <c:choose>
                                            <c:when test="${match.outcome eq 'TIE'}">
                                                <div id="player2-match-${matchIndex.index}" class="trend-tie">T</div>
                                            </c:when>
                                            <c:when test="${match.outcome eq 'PLAYER2'}">
                                                <div id="player2-match-${matchIndex.index}" class="trend-win">W</div>
                                            </c:when>
                                            <c:otherwise>
                                                <div id="player2-match-${matchIndex.index}" class="trend-loss">L</div>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:when>
                                    <c:otherwise>
                                        <div id="player2-match-${matchIndex.index}"></div>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
            </c:forEach>
        </div>
</div>

<script>
    $(document).ready(function(){
        $('#sel1').on('change', function () {
            console.log(this.value);
            $("form[name='poolSelectForm']").submit();
        })
    });

    <c:if test="${!bracketLocked}">
    function selectWin(matchIndex, player) {
        console.log("match "+matchIndex+"  player "+player);

        $.ajax({
            url: '/match/winner',
            type: 'POST',  // http method
            contentType: "application/json",
            dataType: "json",
            data: JSON.stringify({
                'pool': ${selectPool},
                'match': matchIndex,
                'player': player
            }),  // data to submit
            success: function (data) {
                //data = JSON.parse(data);
                if (player == 1) {
                    $('#player1-match-' + matchIndex).text('W');
                    $('#player1-match-' + matchIndex).addClass('trend-win');
                    $('#player1-match-' + matchIndex).removeClass('trend-loss');
                    $('#player1-match-' + matchIndex).removeClass('trend-tie');

                    $('#player2-match-' + matchIndex).text('L');
                    $('#player2-match-' + matchIndex).addClass('trend-loss');
                    $('#player2-match-' + matchIndex).removeClass('trend-win');
                    $('#player2-match-' + matchIndex).removeClass('trend-tie');
                } else if (player == 2) {
                    $('#player2-match-' + matchIndex).text('W');
                    $('#player2-match-' + matchIndex).addClass('trend-win');
                    $('#player2-match-' + matchIndex).removeClass('trend-loss');
                    $('#player2-match-' + matchIndex).removeClass('trend-tie');

                    $('#player1-match-' + matchIndex).text('L');
                    $('#player1-match-' + matchIndex).addClass('trend-loss');
                    $('#player1-match-' + matchIndex).removeClass('trend-win');
                    $('#player1-match-' + matchIndex).removeClass('trend-tie');
                } else {
                    $('#player2-match-' + matchIndex).text('T');
                    $('#player2-match-' + matchIndex).addClass('trend-tie');
                    $('#player2-match-' + matchIndex).removeClass('trend-win');
                    $('#player2-match-' + matchIndex).removeClass('trend-loss');

                    $('#player1-match-' + matchIndex).text('T');
                    $('#player1-match-' + matchIndex).addClass('trend-tie');
                    $('#player1-match-' + matchIndex).removeClass('trend-win');
                    $('#player1-match-' + matchIndex).removeClass('trend-loss');
                }
            },
            error: function (errorMessage) {
                console.error(errorMessage);
            }
        });

        }
    </c:if>
</script>

<style>
    .click-to-win {
        cursor: pointer;
    }
    .click-to-win:hover {
        -webkit-filter: brightness(60%);
        -webkit-transition: all 1s ease;
        -moz-transition: all 1s ease;
        -o-transition: all 1s ease;
        -ms-transition: all 1s ease;
        transition: all 1s ease;
    }
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
    p{
        color:#ccd223;
    }
</style>
