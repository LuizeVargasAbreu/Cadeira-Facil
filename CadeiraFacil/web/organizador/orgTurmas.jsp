<%
    String sessionLogin = (String) session.getAttribute("usuarioAdmin");
    if (sessionLogin == null)
        throw new ServletException("Invalid Login");
        
    Boolean[] sessionPapeis = (Boolean[]) session.getAttribute("usuarioPapeis");
    if (!sessionPapeis[0])
        throw new ServletException("Admin Only");
%>

<%@include file="cabecalhoOrg.jsp"%>
<%@include file="../DBConn.jsp"%>


<div class="btn-groupA" style="float: right; padding-top: 5%">
    <a href="orgCriar.jsp" class="a">
        <button class="btnCabecalho" style="padding: 25px 30px">Criar turma</button>
    </a>
    <a href="../escolherSessao.jsp" class="a">
        <button class="btnCabecalho" style="padding: 25px 50px">Voltar</button>
    </a>
</div>
</div>
</div>
</header>
<main class="mdl-layout__content">
    <div class="mdl-layout__tab-panel is-active" id="overview">
        <section class="mdl-grid mdl-grid--no-spacing">
            <div class="mdl-card mdl-cell mdl-cell--12-col">
                <div class="mdl-card__supporting-text">
                    <h3>Minhas turmas</h3>
                    <table style="width: 130%">
                        <thead>
                            <tr>
                                <th>Ano/Semestre</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                ResultSet rs = makeQuery(String.format("SELECT * FROM Turma WHERE fk_organizador_email='%s'", sessionLogin));
                                while (rs.next()) {
                                               
                                    out.println(String.format("<tr class=\"trHover\"><td>%s</td>", rs.getString("AnoSemestre")));
                                    out.println(String.format("<td style=\"background-color: white\"> <div class=\"btn-groupA\">"));
                                    
                                    out.println(String.format("<a href=\"orgOpcoes.jsp?turmaAno=%s\" class=\"a\"><button class=\"btnAcoes\"  style=\"padding: 10px 15px\">Abrir</button></a>", rs.getString("AnoSemestre")));
                                    out.println(String.format("</div> </td> </tr>"));
                                }
                            %>
                        </tbody>
                    </table> 
                </div>
            </div>
        </section>
        <%@include file="../rodapeInicial.jsp"%>