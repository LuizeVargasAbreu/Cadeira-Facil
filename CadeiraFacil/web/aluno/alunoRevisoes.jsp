<%
    String sessionLogin = (String) session.getAttribute("usuarioAdmin");
    if (sessionLogin == null)
        throw new ServletException("Invalid Login");
        
    Boolean[] sessionPapeis = (Boolean[]) session.getAttribute("usuarioPapeis");
    if (!sessionPapeis[3])
        throw new ServletException("Aluno Only");
%>

<%@include file="cabecalhoAluno.jsp"%>
<%@include file="../DBConn.jsp"%>

<div class="btn-groupA" style="margin: 3% 0 0 72%">
    <div class="btn-groupA" style="margin-left: 85%">
        <a href="../index.html?sair=ok" class="a">
            <button class="btnAcoes">
                <div id="logout" class="icon material-icons">logout</div>
                <div class="mdl-tooltip mdl-tooltip--large" for="logout">
                    Sair
                </div>
            </button>
        </a>
    </div>
    <a href="../escolherSessao.jsp" class="a">
        <button class="btnCabecalho" style="padding: 25px 50px">Voltar</button>
    </a>
</div>
</div>
</header>
<main class="mdl-layout__content">
    <div class="mdl-layout__tab-panel is-active" id="overview">
        <section class="mdl-grid mdl-grid--no-spacing">
            <div class="mdl-card mdl-cell mdl-cell--12-col">
                <div class="mdl-card__supporting-text">
                    <h3>Revisões</h3>
                    <table>
                        <thead>
                            <tr>
                                <th>Professor revisor</th>
                                <th>Avaliação Geral</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                ResultSet rs = makeQuery(String.format("SELECT * FROM Aluno_Turma WHERE fk_Aluno_Email='%s'", sessionLogin));
                                
                                while (rs != null && rs.next()) {
                                               
                                    out.println(String.format("<tr class=\"trHover\"><td>AQUI VAI O NOME DO REVISOR</td>"));
                                    out.println(String.format("<td>AQUI VAI A AVALIAÇÃO DO REVISOR</td>"));
                                    out.println(String.format("<td style=\"background-color: white\"> <div class=\"btn-groupA\">"));                                   
                                   
                                    out.println(String.format("<a href=\"alunoRevisao.jsp?turmaAno=%s\" class=\"a\"><button class=\"btnAcoes\"  style=\"padding: 10px 15px\">Abrir</button></a>", rs.getString("fk_Turma_AnoSemestre")));
                                                   
                                    out.println(String.format("</div> </td> </tr>"));
                                }
                            %>
                        </tbody>
                    </table>   
                </div>
            </div>
        </section>
<%@include file="../rodapeInicial.jsp"%>