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
    <a href="alunoOpcoes.jsp" class="a">
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
                    <table>
                        <thead>
                            <tr>
                                <th>Professor revisor</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="trHover">
                                <td style="padding: 10px 15px; color: #f5f5f5">Professor revisor</td>
                            </tr>
                        </tbody>

                        <thead>
                            <tr>
                                <th>Critérios Objetivos</th>
                            </tr>
                        </thead>
                        <tbody class="trHover">
                            <tr>
                                <td style="padding: 10px 15px; color: #f5f5f5">Expandir</td>
                            </tr>
                        </tbody>

                        <thead>
                            <tr>
                                <th>Critérios Dissertativos</th>
                            </tr>    
                        </thead>
                        <tbody>
                            <tr class="trHover">
                                <td style="padding: 10px 15px; color: #f5f5f5">Expandir</td>
                            </tr>
                        </tbody>

                        <thead>
                            <tr>
                                <th>Avaliação Geral</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="trHover">
                                <td style="padding: 10px 15px; color: #f5f5f5">Avaliação</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </section>
        <%@include file="../rodapeInicial.jsp"%>