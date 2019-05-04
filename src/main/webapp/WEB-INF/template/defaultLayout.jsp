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
        <title><tiles:getAsString name="title" /></title>
    </head>
    <body>
        <tiles:insertAttribute name="body" />
    </body>
</html>