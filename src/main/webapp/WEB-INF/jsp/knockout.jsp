<%--
  Created by IntelliJ IDEA.
  User: tillu
  Date: 2019-05-05
  Time: 17:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container-fluid">
    <c:if test="${lockable == 1}">
    <div class="row">
            <button type="button" class="btn btn-primary" id="lock-button">Lock Bracket</button>
    </div>
    </c:if>
    <div class="row">
        <div class="bracket"></div>
    </div>
</div>

<script>

    $(document).ready(function () {

        function saveFn(data, userData) {
            console.log(data);
            $.ajax({
                url: '/update/bracket',
                type: 'POST',  // http method
                contentType: "application/json",
                dataType: "json",
                data: JSON.stringify(data),
                success: function (data) {
                    console.log(data);
                },
                error: function (errorMessage) {
                    console.error(errorMessage);
                }
            });
        }

        var singleElimination;

        $.ajax({
            url: '/get/knockout/data',
            type: 'GET',  // http method,  // data to submit
            async: false,
            success: function (data) {
                //data = JSON.parse(data);
               singleElimination = data
            },
            error: function (errorMessage) {
                console.error(errorMessage);
            }
        });

        console.log(singleElimination);

        var resizeParameters = {
            teamWidth: 100,
            scoreWidth: 40,
            matchMargin: 70,
            roundMargin: 100,
            disableTeamEdit: true,
            disableToolbar: true,
            save: saveFn,
            init: singleElimination
        };

        var container =  $('.bracket')
        container.bracket(resizeParameters)


        $('#lock-button').on('click', function () {

            $.ajax({
                url: '/lock/bracket',
                type: 'POST',  // http method
                contentType: "application/json",
                dataType: "json",
                data: JSON.stringify({
                    'lock': true
                }),
                success: function (data) {
                    console.log(data);
                },
                error: function (errorMessage) {
                    console.error(errorMessage);
                }
            });
        })

    });

</script>
