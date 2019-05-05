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

    var singleElimination = {
        "teams": [                                          // Matchups
            ["${players[i].name}", "${players[i+1].name}"], // First match
            ["${players[2].name}", "${players[3].name}"]  // Second match
        ],
        "results": [            // List of brackets (single elimination, so only one bracket)
            [                     // List of rounds in bracket
                [                   // First round in this bracket
                               // Team 3 vs Team 4
                ],
                [                   // Second (final) round in single elimination bracket
                                // Match for 3rd place
                ]
            ]
        ]
    }

    $(function() {
        var resizeParameters = {
            teamWidth: 100,
            scoreWidth: 40,
            matchMargin: 70,
            roundMargin: 100,
            init: singleElimination
        };

        $('.bracket').bracket(resizeParameters)
    });
</script>
