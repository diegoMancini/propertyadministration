<%@ page import="propertyAdmin.structure.property.Property" %>
<%@ page import="java.util.List" %>
<%@ page import="propertyAdmin.operations.DatabaseOps" %>
<%@ page import="propertyAdmin.structure.persons.Account" %>
<%@ page import="propertyAdmin.structure.property.FunctionalUnit" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %><%--
  Created by IntelliJ IDEA.
  User: DiegoMancini
  Date: 21/5/18
  Time: 20:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    DatabaseOps databaseOps = DatabaseOps.getInstance();
    String username = request.getRemoteUser();
    List<Property> propertyList = databaseOps.getAccountProperties(username);
    List<String> result = new ArrayList<>();
    for (Property property : propertyList) {
        result.add(property.getName());
        for (FunctionalUnit functionalUnit: property.getFunctionalUnits()) {
            result.add(functionalUnit.getName());
            if (functionalUnit.hasContract()) {
                result.add(functionalUnit.getContract().getTenant().getName());
            }
        }
    }
    for (String output : result) {
        out.println(output);
    }
%>
