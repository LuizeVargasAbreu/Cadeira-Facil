<%
    String sessionLogin = (String) session.getAttribute("usuarioAdmin");
    if (sessionLogin == null)
        throw new ServletException("Invalid Login");
        
    Boolean[] sessionPapeis = (Boolean[]) session.getAttribute("usuarioPapeis");
    if (!sessionPapeis[3])
        throw new ServletException("Aluno Only");
        
    String sessionNome = (String) session.getAttribute("usuarioNome");
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
    <a href="alunoOpcoes.jsp?turmaAno=<% out.print(request.getParameter("turmaAno")); %>" class="a">
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
                    <h3>Realizar ressubmissão</h3>
                    <div class="divCadastro">
                        <form action="../FileUploadSubmissao" method="post" enctype="multipart/form-data">
                            <div class="mdl-cell--12-col">
                                <%
                                    ResultSet rs = makeQuery(String.format("SELECT * FROM Submissao WHERE fk_Aluno_Email='%s' AND fk_Turma_AnoSemestre='%s'", sessionLogin, request.getParameter("turmaAno")));

                                    if (rs != null && rs.next()) {
                                    
                                        out.println(String.format("<label for=\"titulo\">Título:</label><br>"));
                                        out.println(String.format("<input type=\"text\" name=\"titulo\" value=\"%s\">", rs.getString("Titulo")));

                                        out.println(String.format("<label for=\"orientador\">Orientador:</label>"));
                                        out.println(String.format("<input type=\"text\" name=\"orientador\" value=\"%s\" readonly>", rs.getString("fk_Orientador_Email")));

                                        out.println(String.format("<label for=\"coorientador\">Coorientador:</label><br>"));
                                        out.println(String.format("<input type=\"text\" name=\"coorientador\" value=\"%s\">", rs.getString("Coorientador")));

                                        out.println(String.format("<label for=\"resumo\">Resumo:</label><br>"));
                                        out.println(String.format("<input type=\"text\" name=\"resumo\" value=\"%s\">", rs.getString("Resumo")));

                                        out.println(String.format("<label for=\"arquivo\">Arquivo:</label><br>"));
                                        out.println(String.format("<input type=\"text\" name=\"fileName\" value=\"%s\">", rs.getString("Arquivo")));
                                    }
                                %>
                                
                                <input type="file" required name="arquivo" style="width: auto" accept=".pdf">
                                <input type="text" required name="aluno" value=<% out.print(sessionLogin); %> hidden>
                                <input type="text" required name="alunoNome" value=<% out.print(sessionNome); %> hidden>
                                <input type="text" required name="turmaAno" value=<% out.print(request.getParameter("turmaAno")); %> hidden>
                                <input type="text" required name="alterar" value="0" hidden>
                                <input type="text" required name="resub" value="1" hidden>

                            </div>
                            <div class="btn-groupA" style="float: right; margin-right: 1%">
                                <button type="submit" class="btnAcoes"  style="padding: 25px 25px">Confirmar</button>
                                <a href="alunoSubRep.jsp?turmaAno=<% out.print(request.getParameter("turmaAno")); %>" class="a">
                                    <button type="button" class="btnAcoes"  style="padding: 25px 25px">Cancelar</button>
                                </a>
                            </div>
                        </form>                    
                    </div>
                </div>
            </div>
        </section>
<%@include file="../rodapeInicial.jsp"%>