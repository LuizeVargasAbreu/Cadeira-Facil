<%
    String sessionLogin = (String) session.getAttribute("usuarioAdmin");
    if (sessionLogin == null)
        throw new ServletException("Invalid Login");
        
    Boolean[] sessionPapeis = (Boolean[]) session.getAttribute("usuarioPapeis");
    if (!sessionPapeis[2])
        throw new ServletException("Prof Only");
%>

<%@include file="cabecalhoProf.jsp"%>
<%@include file="../DBConn.jsp"%>

<div class="btn-groupA" style="margin: 3% 0 0 67%">
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
    <a href="profOpcoes.jsp?turmaAno=<% out.print(request.getParameter("turmaAno")); %>" class="a">
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
                    <h3>Revis�es</h3>
                    <table>
                        <thead>
                            <tr>
                                <th>Nome do aluno</th>
                                <th>T�tulo</th>
                                <th>Status</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                ResultSet rs = makeQuery(String.format("SELECT fk_aluno_email FROM revisor_submissao WHERE fk_Revisor_Email='%s' AND fk_turma_anosemestre='%s'", sessionLogin, request.getParameter("turmaAno")));
                                
                                while (rs != null && rs.next()) {
                                    
                                    ResultSet rs2 = makeQuery(String.format("SELECT Titulo, Status FROM Submissao WHERE fk_turma_anosemestre='%s' AND fk_aluno_email='%s'", request.getParameter("turmaAno"), rs.getString("fk_aluno_email")));

                                    while (rs2 != null && rs2.next()) {

                                        ResultSet rs3 = makeQuery(String.format("SELECT Nome FROM Usuario WHERE Email='%s'", rs.getString("fk_aluno_email")));

                                        if (rs3 != null && rs3.next()) {
                                        
                                            out.println(String.format("<tr class=\"trHover\"><td>%s</td><td>%s</td><td>%s</td>", rs3.getString("Nome"), rs2.getString("Titulo"), rs2.getString("Status")));
                                            out.println(String.format("<td style=\"background-color: white\"> <div class=\"btn-groupA\">"));
        
                                            ResultSet rs4 = makeQuery(String.format("SELECT status FROM Submissao WHERE fk_turma_anosemestre='%s' AND fk_aluno_email='%s'", request.getParameter("turmaAno"), rs.getString("fk_aluno_email")));
                    
                                            int count = 0;
                                            boolean aprov = true;
                                            boolean wait = false;

                                            while (rs4 != null && rs4.next()) {
                                                if (rs4.getString("status").equals("wait")) {
                                                    wait = true;
                                                }
                                                else if (rs4.getString("status").equals("repr")) {
                                                    aprov = false;
                                                }

                                                count++;
                                            }

                                            if (count == 0 || wait)
                                                out.println(String.format("<a href=\"profSubRev.jsp?turmaAno=%s&alunoEmail=%s\" class=\"a\"><button class=\"btnAcoes\"  style=\"padding: 10px 15px\">Abrir</button></a>", request.getParameter("turmaAno"), rs.getArray("fk_Aluno_Email")));
                                            else if (!aprov)
                                                out.println(String.format("<a href=\"profSubRevRep.jsp?turmaAno=%s&alunoEmail=%s\" class=\"a\"><button class=\"btnAcoes\"  style=\"padding: 10px 15px\">Abrir</button></a>", request.getParameter("turmaAno"), rs.getArray("fk_Aluno_Email")));
                                            else
                                                out.println(String.format("<a href=\"profSubRevApr.jsp?turmaAno=%s&alunoEmail=%s\" class=\"btnAcoes\"  style=\"padding: 10px 15px\">Abrir</button></a>", request.getParameter("turmaAno"), rs.getArray("fk_Aluno_Email")));
                                            
                                            out.println(String.format("</div> </td> </tr>"));
                                        
                                        }
                                    }
                                }
                            %>
                        </tbody>
                    </table>   
                </div>
            </div>
        </section>
<%@include file="../rodapeInicial.jsp"%>