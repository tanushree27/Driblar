<%--
  Created by IntelliJ IDEA.
  User: tillu
  Date: 2019-05-03
  Time: 11:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="container-fluid">
    <form class="form" action="/create/tournament" method="post">
        <div class="form-group">
            <label for="tournamentName">Tournament Name</label>
            <input type="text" class="form-control" id="tournamentName" name="tournamentName" aria-describedby="tournamentHelp" placeholder="Enter name" required>
            <small id="tournamentHelp" class="text-light form-text" style="margin-left: 30px;">This will be the name of your EPIC Tournament.</small>
        </div>
        <div class="form-group">
            <label for="playersSize">Number of players</label>
            <input type="number" min="2" step="1" class="form-control" id="playersSize" name="playersSize" placeholder="No. of players" required>
        </div>
        <h3 class="text-white" style="margin-top: 50px;">Stage 1 - Round robin</h3>
        <div class="form-group">
            <label for="poolSize">Pool size</label>
            <input type="number" min="2" step="1" class="form-control" id="poolSize" name="poolSize" placeholder="pool size" required>
        </div>
        <div class="form-group">
            <label for="advanceSize">Number of players advance</label>
            <input type="number" min="1" step="1" class="form-control" id="advanceSize" name="advanceSize" placeholder="players that advance" required>
        </div>
        <button type="submit" class="btn btn-success">Create Tournament</button>
    </form>
</div>
