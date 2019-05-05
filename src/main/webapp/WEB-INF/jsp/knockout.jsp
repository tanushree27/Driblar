<%--
  Created by IntelliJ IDEA.
  User: tillu
  Date: 2019-05-05
  Time: 17:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container-fluid">
    <div class="row">
        <div class="bracket"></div>
    </div>
</div>

<script>
    var minimalData = {
        teams : [
            ["Team 1", "Team 2"], /* first matchup */
            ["Team 3", "Team 4"]  /* second matchup */
        ],
        results : [
            [[1,2], [3,4]],       /* first round */
            [[4,6]]        /* second round */
        ]
    }

    $(function() {
        var resizeParameters = {
            teamWidth: 100,
            scoreWidth: 40,
            matchMargin: 70,
            roundMargin: 100,
            init: minimalData
        };

        $('.bracket').bracket(resizeParameters)
    });
</script>
