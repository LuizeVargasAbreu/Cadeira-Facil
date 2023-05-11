<%
    String sessionLogin = (String) session.getAttribute("usuarioAdmin");
    if (sessionLogin == null)
        throw new ServletException("Invalid Login");
        
    Boolean[] sessionPapeis = (Boolean[]) session.getAttribute("usuarioPapeis");
    if (!sessionPapeis[3])
        throw new ServletException("Aluno Only");
        
    String turmaAno = request.getParameter("turmaAno");
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
    <a href="alunoSubRep.jsp?turmaAno=<% out.print(request.getParameter("turmaAno")); %>" class="a">
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
                                ResultSet rs = makeQuery(String.format("SELECT * FROM Revisao WHERE fk_Aluno_Email='%s' AND fk_turma_anosemestre='%s'", sessionLogin, turmaAno));
                                
                                while (rs != null && rs.next()) {
                                               
                                    ResultSet rs2 = makeQuery(String.format("SELECT Nome FROM Usuario WHERE Email='%s'", rs.getString("fk_revisor_email")));
                                
                                    if (rs2 != null && rs2.next()) {
                                    
                                        Integer[] notas = (Integer[])rs.getArray("CriteriosObjetivos").getArray();
                                        
                                        out.println(String.format("<tr class=\"trHover\"><td>%s</td>", rs2.getString("Nome")));
                                        out.println(String.format("<td>Notas: %d %d %d %d</td>", notas[0], notas[1], notas[2], notas[3]));
                                        out.println(String.format("<td style=\"background-color: white\"> <div class=\"btn-groupA\">"));                                   

                                        out.println(String.format("<a href=\"alunoRevisao.jsp?turmaAno=%s\" class=\"a\"><button class=\"btnAcoes\"  style=\"padding: 10px 15px\">Abrir</button></a>", rs.getString("fk_Turma_AnoSemestre")));

                                        out.println(String.format("</div> </td> </tr>"));
                                    }
                                }
                            %>
                        </tbody>
                    </table>   
                </div>
            </div>
        </section>
<%@include file="../rodapeInicial.jsp"%>