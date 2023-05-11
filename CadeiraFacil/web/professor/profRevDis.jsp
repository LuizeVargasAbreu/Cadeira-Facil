<%
    String sessionLogin = (String) session.getAttribute("usuarioAdmin");
    if (sessionLogin == null) {
        throw new ServletException("Invalid Login");
    }

    Boolean[] sessionPapeis = (Boolean[]) session.getAttribute("usuarioPapeis");
    if (!sessionPapeis[2]) {
        throw new ServletException("Prof Only");
    }
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
    <a href="profRevObj.jsp?turmaAno=<% out.print(request.getParameter("turmaAno"));%>" class="a">
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
                    <h3>Revisão - Critérios dissertativos</h3>
                    <div class="divCadastro">
                        <form action="#" method="post">                    
                            <div class="mdl-cell--12-col">

                                <!-- PERGUNTA 1 -->
                                <div class="mdl-cell--12-col" style="margin-bottom: 15px"> 
                                    <p style="font-size: 25px">
                                        <label for="pergDis1">Resumo da proposta:</label>
                                    </p>
                                    <legend>Destaque brevemente os objetivos e as contribuições da proposta</legend>
                                    <textarea rows="4" cols="175" id="pergDis1" ></textarea>
                                </div>

                                <!-- PERGUNTA 2 -->
                                <div class="mdl-cell--12-col" style="margin-bottom: 15px"> 
                                    <p style="font-size: 25px">
                                        <label for="pergDis2">Pontos fortes da proposta:</label>
                                    </p>
                                    <legend>Destaque os pontos relevantes da proposta</legend>
                                    <textarea rows="4" cols="175" id="pergDis2" ></textarea>
                                </div>

                                <!-- PERGUNTA 3 -->
                                <div class="mdl-cell--12-col" style="margin-bottom: 15px"> 
                                    <p style="font-size: 25px">
                                        <label for="pergDis3">Pontos fracos da proposta:</label>
                                    </p>
                                    <legend>Destaque os pontos deficientes da proposta</legend>
                                    <textarea rows="4" cols="175" id="pergDis3" ></textarea>
                                </div>

                                <!-- PERGUNTA 4 -->
                                <div class="mdl-cell--12-col" style="margin-bottom: 15px"> 
                                    <p style="font-size: 25px">
                                        <label for="pergDis4">Detalhamento da avaliação:</label>
                                    </p>
                                    <legend>Comente aqui os motivos que levaram a escolha de sua avaliação (especialmente em caso de parecer negativo)</legend>
                                    <textarea rows="4" cols="175" id="pergDis4" ></textarea>
                                </div>                             
                                <%
//                                    ResultSet rs = makeQuery(String.format("SELECT * FROM Revisao WHERE fk_Revisor_Email='%s' AND fk_Turma_AnoSemestre='%s'", sessionLogin, request.getParameter("turmaAno")));
//
//                                    if (rs != null && rs.next()) {
//                                        out.println(String.format("<label for=\"pergunta1\">Apresentação e consistência:</label><br>"));
//                                        out.println(String.format("<label style=\"color: #BABABA\">Observar se a proposta se mostra bem estruturada e coerente</label><br>"));
//                                        out.println(String.format("<input type=\"text\" name=\"pergunta1\" value=\"%s\" readonly>", rs.getString("criteriosObjetivos")));
//
//                                        out.println(String.format("<label for=\"pergunta2\">Relevância e contribuição:</label>"));
//                                        out.println(String.format("<label style=\"color: #BABABA\">Observar se o tema é relevante e se o projeto tem contribuições para ensino, pesquisa e extensão</label><br>"));
//                                        out.println(String.format("<input type=\"text\" name=\"pergunta2\" value=\"%s\" readonly>", rs.getString("criteriosObjetivos")));
//
//                                        out.println(String.format("<label for=\"pergunta3\">Metodologia:</label><br>"));
//                                        out.println(String.format("<label style=\"color: #BABABA\">Observar se a metodologia é adequada ao tipo de projeto, tornando o projeto exequível</label><br>"));
//                                        out.println(String.format("<input type=\"text\" name=\"pergunta3\" value=\"%s\" readonly>", rs.getString("criteriosObjetivos")));
//
//                                        out.println(String.format("<label for=\"pergunta4\">Adequação ao curso:</label><br>"));
//                                        out.println(String.format("<label style=\"color: #BABABA\">Avaliar se o projeto é relevante a formação do aluno</label><br>"));
//                                        out.println(String.format("<input type=\"text\" name=\"pergunta4\" value=\"%s\" readonly>", rs.getString("criteriosObjetivos")));
//
//                                        out.println(String.format("<label for=\"pergunta5\">Plano de trabalho a ser desenvolvido:</label><br>"));
//                                        out.println(String.format("<label style=\"color: #BABABA\">Atividades e cronograma propostos</label><br>"));
//                                        out.println(String.format("<input type=\"text\" name=\"pergunta5\" value=\"%s\" readonly>", rs.getString("criteriosObjetivos")));

                                    //out.println(String.format("<button type=\"submit\" class=\"btnAcoes\"  style=\"padding: 25px 25px\">Baixar</button></form>"));
                                    //}
                                %>
                            </div>
                            <div class="btn-groupA" style="float: right; margin-right: 1%">
                                <a href="profAvaliacao.jsp?turmaAno=<% out.print(request.getParameter("turmaAno"));%>" class="a">
                                    <button type="button" class="btnAcoes"  style="padding: 25px 40px">Avançar</button>
                                </a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <%@include file="../rodapeInicial.jsp"%>