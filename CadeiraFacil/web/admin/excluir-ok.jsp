<%
    String sessionLogin = (String) session.getAttribute("usuarioAdmin");
    if (sessionLogin == null)
        throw new ServletException("Invalid Login");
        
    Boolean[] sessionPapeis = (Boolean[]) session.getAttribute("usuarioPapeis");
    if (!sessionPapeis[0])
        throw new ServletException("Admin Only");
        
    String requestEditEmail = request.getParameter("requestEditEmail");
    if (sessionLogin == null)
        throw new ServletException("Invalid Request Email");
%>

<%@include file="../DBConn.jsp"%>

<%
    makeQuery(String.format("DELETE FROM Usuario WHERE Email='%s'", requestEditEmail));
%>

