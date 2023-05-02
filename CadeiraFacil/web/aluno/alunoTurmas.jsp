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
                                ResultSet rs = makeQuery(String.format("SELECT * FROM Aluno_Turma"));
                                while (rs.next()) {
                                               
                                    out.println(String.format("<tr class=\"trHover\"><td>%s</td>", rs.getArray("fk_Turma_AnoSemestre")));
                                    out.println(String.format("<td style=\"background-color: white\"> <div class=\"btn-groupA\">"));
                                    
                                    out.println(String.format("<a href=\"alunoOpcoes.jsp\" class=\"a\"><button class=\"btnAcoes\"  style=\"padding: 10px 15px\">Abrir</button></a>"));
                                                   
                                    out.println(String.format("</div> </td> </tr>"));
                                }
                            %>
                        </tbody>
                    </table>   
                </div>
            </div>
        </section>
        <%@include file="../rodapeInicial.jsp"%>