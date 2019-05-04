<%--
  Created by IntelliJ IDEA.
  User: tillu
  Date: 2019-05-03
  Time: 11:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="fluid-container">
    <form class="form" action="/create/tournament" method="post">
        <div class="form-group">
            <label for="tournamentName">Tournament Name</label>
            <input type="text" class="form-control" id="tournamentName" name="tournamentName" aria-describedby="tournamentHelp" placeholder="Enter name" required>
            <small id="tournamentHelp" class="form-text text-muted">This will be the name of your EPIC Tournament.</small>
        </div>
        <div class="form-group">
            <label for="playersSize">Number of players</label>
            <input type="number" min="2" step="1" class="form-control" id="playersSize" name="playersSize" placeholder="No. of players" required>
        </div>
        <label>Stage 1 - Round robin</label>
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

<style>
    body {
        background-color: #000000bf !important;
        font-family: inherit;
        background: url("https://png2.kisspng.com/sh/6369fa238484df44bb54beb9327840bf/L0KzQYm3UcI1N5l8iZH0aYP2gLBuTfJibJ5uhuZ4bj33f8b5jvFubZ95Rdtsb36wc7L5lP9wdl5nedZ2aX73f7A0VfE3QGdrT9M7OULldoq1VMMxOmM1UKo6NUG5R4q6V8IzOWc9T5D5bne=/kisspng-badminton-tournament-icon-cartoon-badminton-5a686f7a292bf9.4302208815167937221687.png");
        background-size: 1000px 800px;
        background-repeat: no-repeat;
        margin-left: 800px;
        margin-top: 20px;
        margin-right: 20px;
    }
    label {
        display: inline-block;
        margin-bottom: .5rem;
        color: white;
        font-family: inherit;
        margin-top: 20px;
        margin-left: 30px;
    }
    .text-muted {
        color: #6c757d!important;
        margin-left: 30px;
    }
    input#tournamentName, input#playersSize, input#poolSize, input#advanceSize{
        margin-left: 30px;
        max-width: 500px;
    }
    button{
        margin-top: 20px;
        margin-left: 30px;
    }
    .btn-success {
        color: #0c0c0c;
        background-color: #28a745;
        border-color: #28a745;
        font-weight: bold;
    }



</style>