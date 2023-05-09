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
    <a href="profOrientacoes.jsp?turmaAno=<% out.print(request.getParameter("turmaAno")); %>" class="a">
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
                    <h3>Submiss�o orientada</h3>
                    <div class="mdl-cell--12-col">
                        <input type="text" name="status" value="Status" style="width: 150px; color: #fefefe; float: right; text-align: center; padding: 10px 30px" readonly>
                    </div>
                    <br>
                    <div class="mdl-cell--12-col">
                        <%
                            ResultSet rs = makeQuery(String.format("SELECT * FROM Submissao WHERE fk_Aluno_Email='%s' AND fk_Turma_AnoSemestre='%s'", sessionLogin, request.getParameter("turmaAno")));

                            if (rs != null && rs.next()) {
                                out.println(String.format("<label for=\"titulo\">T�tulo:</label><br>"));
                                out.println(String.format("<input type=\"text\" name=\"titulo\" value=\"%s\" style=\"color: #fefefe\" readonly>", rs.getString("Titulo")));

                                out.println(String.format("<label for=\"orientador\">Orientador:</label>"));
                                out.println(String.format("<input type=\"text\" name=\"orientador\" value=\"%s\" style=\"color: #fefefe\" readonly>", rs.getString("fk_Orientador_Email")));

                                out.println(String.format("<label for=\"coorientador\">Coorientador:</label><br>"));
                                out.println(String.format("<input type=\"text\" name=\"coorientador\" value=\"%s\" style=\"color: #fefefe\" readonly>", rs.getString("Coorientador")));

                                out.println(String.format("<label for=\"resumo\">Resumo:</label><br>"));
                                out.println(String.format("<input type=\"text\" name=\"resumo\" value=\"%s\" style=\"color: #fefefe\" readonly>", rs.getString("Resumo")));

                                out.println(String.format("<label for=\"arquivo\">Arquivo:</label><br>"));
                                out.println(String.format("<input type=\"text\" name=\"fileName\" value=\"%s\" style=\"color: #fefefe\" readonly>", rs.getString("Arquivo")));
                                
                                out.println(String.format("<form action=\"../FileUploadSubmissao\" method=\"get\" enctype=\"multipart/form-data\">"));
                                out.println(String.format("<input type=\"text\" name=\"turmaAno\" value=\"%s\" hidden>", request.getParameter("turmaAno")));
                                out.println(String.format("<input type=\"text\" name=\"fileName\" value=\"%s\" hidden>", rs.getString("Arquivo")));
                                out.println(String.format("<button type=\"submit\" class=\"btnAcoes\"  style=\"padding: 25px 25px\">Baixar</button></form>"));
                            }
                        %>
                    </div>
                </div>
            </div>
    </div>
</section>
<%@include file="../rodapeInicial.jsp"%>