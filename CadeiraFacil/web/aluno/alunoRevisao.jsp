<%
    String sessionLogin = (String) session.getAttribute("usuarioAdmin");
    if (sessionLogin == null) {
        throw new ServletException("Invalid Login");
    }

    Boolean[] sessionPapeis = (Boolean[]) session.getAttribute("usuarioPapeis");
    if (!sessionPapeis[3]) {
        throw new ServletException("Aluno Only");
    }

    String sessionNome = (String) session.getAttribute("usuarioNome");
    String turmaAno = request.getParameter("turmaAno");
%>

<%@include file="cabecalhoAluno.jsp"%>
<%@include file="../DBConn.jsp"%>

<div class="btn-groupA" style="margin: 3% 0 0 68%">
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
    <a href="alunoRevisoes.jsp?turmaAno=<% out.print(turmaAno); %>" class="a">
        <button class="btnCabecalho" style="padding: 25px 50px">Voltar</button>
    </a>
</div>
</div>
</header>
<main class="mdl-layout__content">
    <div class="mdl-layout__tab-panel is-active" id="overview">
        <section class="mdl-grid mdl-grid--no-spacing">
            <div class="mdl-card mdl-cell mdl-cell--12-col">
                <div class="mdl-card__supporting-text" style="margin: -30px 40px 40px 20px">
                    <h3>Revisão</h3>
                        <%
                            ResultSet rs = makeQuery(String.format("SELECT * FROM Revisao WHERE fk_Aluno_Email='%s' AND fk_turma_anosemestre='%s'", sessionLogin, turmaAno));

                            if (rs != null && rs.next()) {

                                ResultSet rs2 = makeQuery(String.format("SELECT Nome FROM Usuario WHERE Email='%s'", rs.getString("fk_revisor_email")));

                                if (rs2 != null && rs2.next()) {

                                    Integer[] notas = (Integer[])rs.getArray("CriteriosObjetivos").getArray();
                                    String[] notasDiss = (String[])rs.getArray("CriteriosDissertivos").getArray();
                                    String avaliacao = "Reprovado";
                                    
                                    int ii;
                                    for (ii = 0; ii < 5; ++ii)
                                        if (notas[ii] < 3)
                                            break;
                                            
                                    if (ii == 5)
                                        avaliacao = "Aprovado";
                                        
                                    out.print(String.format("<table><thead><tr><th>Professor revisor</th></tr></thead>"));
                                    out.print(String.format("<tbody><tr class=\"trHover\"><td style=\"padding: 10px 15px\">%s</td></tr></tbody>", rs2.getString("Nome")));

                                    out.print(String.format("<thead><tr><th>Critérios Objetivos</th></tr></thead>"));
                                    out.print(String.format("<tbody class=\"trHover\"><tr><td style=\"padding: 10px 15px\">%d %d %d %d %d</td></tr></tbody>", notas[0], notas[1], notas[2], notas[3], notas[4]));

                                    out.print(String.format("<thead><tr><th>Critérios Dissertativos</th></tr></thead>"));
                                    out.print(String.format("<tbody><tr class=\"trHover\"><td style=\"padding: 10px 15px\">%s; %s; %s; %s</td></tr></tbody>", notasDiss[0], notasDiss[1], notasDiss[2], notasDiss[3]));

                                    out.print(String.format("<thead><tr><th>Avaliação Geral</th></tr></thead>"));
                                    out.print(String.format("<tbody><tr class=\"trHover\"><td style=\"padding: 10px 15px\">%s</td></tr></tbody>", avaliacao));
                                
                                    out.print("</table><br><br>");
                                }
                            }
                        %>
                </div>
            </div>
        </section>
        <%@include file="../rodapeInicial.jsp"%>