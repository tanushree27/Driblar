<%--
  Created by IntelliJ IDEA.
  User: tillu
  Date: 2019-05-04
  Time: 13:01
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title><tiles:getAsString name="title" /></title>
    </head>
    <body>
        <tiles:insertAttribute name="header" />
        <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <div class="body container-fluid">
            <tiles:insertAttribute name="body" />
        </div>

        <style>
            body {
                font-family: 'Lato';
                background-color: #000000bf !important;
                background: url("https://png2.kisspng.com/sh/6369fa238484df44bb54beb9327840bf/L0KzQYm3UcI1N5l8iZH0aYP2gLBuTfJibJ5uhuZ4bj33f8b5jvFubZ95Rdtsb36wc7L5lP9wdl5nedZ2aX73f7A0VfE3QGdrT9M7OULldoq1VMMxOmM1UKo6NUG5R4q6V8IzOWc9T5D5bne=/kisspng-badminton-tournament-icon-cartoon-badminton-5a686f7a292bf9.4302208815167937221687.png") no-repeat center right fixed;
                -webkit-background-size: cover;
                -moz-background-size: cover;
                -o-background-size: cover;
                background-size: auto;
            }
            /*.body {
                background-color: #000000bf !important;
                font-family: inherit;
                background: url("https://png2.kisspng.com/sh/6369fa238484df44bb54beb9327840bf/L0KzQYm3UcI1N5l8iZH0aYP2gLBuTfJibJ5uhuZ4bj33f8b5jvFubZ95Rdtsb36wc7L5lP9wdl5nedZ2aX73f7A0VfE3QGdrT9M7OULldoq1VMMxOmM1UKo6NUG5R4q6V8IzOWc9T5D5bne=/kisspng-badminton-tournament-icon-cartoon-badminton-5a686f7a292bf9.4302208815167937221687.png");
                !*background-size: 1000px 800px;*!
                background-repeat: no-repeat;
                !*margin-left: 800px;*!
                !*margin-top: 20px;*!
                !*margin-right: 20px;*!
            }*/
            .table-dark{
                background-color: rgba(52, 58, 64, 0.9);
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
            .btn-success {
                margin-left: 30px;
                margin-top: 80px;
                color: #0c0c0c;
                background-color: #28a745;
                border-color: #28a745;
                font-weight: bold;
            }



        </style>
    </body>
</html>