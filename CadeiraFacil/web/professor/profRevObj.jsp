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
    <a href="profRevisoes.jsp?turmaAno=<% out.print(request.getParameter("turmaAno"));%>" class="a">
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
                    <h3>Revisão - Critérios objetivos</h3>
                    <div class="divCadastro">
                        <form action="#" method="post">                    
                            <div class="mdl-cell--12-col">

                                <!-- PERGUNTA 1 -->
                                <div class="mdl-cell--12-col" style="margin-bottom: 15px"> 
                                    <p style="font-size: 25px">Apresentação e consistência:</p>
                                    <legend>Observar se a proposta se mostra bem estruturada e coerente</legend>
                                    <fieldset>
                                        <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="p1_1" style="margin-right: 15%">
                                            <input type="radio" id="p1_1" class="mdl-radio__button" name="pergunta1" value="1" checked>
                                            <span class="mdl-radio__label">1. Insuficiente</span>
                                        </label>
                                        <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="p1_2" style="margin-right: 15%">
                                            <input type="radio" id="p1_2" class="mdl-radio__button" name="pergunta1" value="2">
                                            <span class="mdl-radio__label">2. Regular</span>
                                        </label>
                                        <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="p1_3" style="margin-right: 15%">
                                            <input type="radio" id="p1_3" class="mdl-radio__button" name="pergunta1" value="3">
                                            <span class="mdl-radio__label">3. Bom</span>
                                        </label>
                                        <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="p1_4">
                                            <input type="radio" id="p1_4" class="mdl-radio__button" name="pergunta1" value="4">
                                            <span class="mdl-radio__label">4. Excelente</span>
                                        </label>
                                    </fieldset>
                                </div>

                                <!-- PERGUNTA 2 -->
                                <div class="mdl-cell--12-col" style="margin-bottom: 15px"> 
                                    <p style="font-size: 25px">Relevância e contribuição:</p>
                                    <legend>Observar se o tema é relevante e se o projeto tem contribuições para ensino, pesquisa e extensão</legend>
                                    <fieldset>
                                        <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="p2_1" style="margin-right: 15%">
                                            <input type="radio" id="p2_1" class="mdl-radio__button" name="pergunta2" value="1" checked>
                                            <span class="mdl-radio__label">1. Insuficiente</span>
                                        </label>
                                        <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="p2_2" style="margin-right: 15%">
                                            <input type="radio" id="p2_2" class="mdl-radio__button" name="pergunta2" value="2">
                                            <span class="mdl-radio__label">2. Regular</span>
                                        </label>
                                        <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="p2_3" style="margin-right: 15%">
                                            <input type="radio" id="p2_3" class="mdl-radio__button" name="pergunta2" value="3">
                                            <span class="mdl-radio__label">3. Bom</span>
                                        </label>
                                        <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="p2_4">
                                            <input type="radio" id="p2_4" class="mdl-radio__button" name="pergunta2" value="4">
                                            <span class="mdl-radio__label">4. Excelente</span>
                                        </label>
                                    </fieldset>
                                </div>

                                <!-- PERGUNTA 3 -->
                                <div class="mdl-cell--12-col" style="margin-bottom: 15px"> 
                                    <p style="font-size: 25px">Metodologia:</p>
                                    <legend>Observar se a metodologia é adequada ao tipo de projeto, tornando o projeto exequível</legend>
                                    <fieldset>
                                        <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="p3_1" style="margin-right: 15%">
                                            <input type="radio" id="p3_1" class="mdl-radio__button" name="pergunta3" value="1" checked>
                                            <span class="mdl-radio__label">1. Insuficiente</span>
                                        </label>
                                        <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="p3_2" style="margin-right: 15%">
                                            <input type="radio" id="p3_2" class="mdl-radio__button" name="pergunta3" value="2">
                                            <span class="mdl-radio__label">2. Regular</span>
                                        </label>
                                        <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="p3_3" style="margin-right: 15%">
                                            <input type="radio" id="p3_3" class="mdl-radio__button" name="pergunta3" value="3">
                                            <span class="mdl-radio__label">3. Bom</span>
                                        </label>
                                        <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="p3_4">
                                            <input type="radio" id="p3_4" class="mdl-radio__button" name="pergunta3" value="4">
                                            <span class="mdl-radio__label">4. Excelente</span>
                                        </label>
                                    </fieldset>
                                </div>

                                <!-- PERGUNTA 4 -->
                                <div class="mdl-cell--12-col" style="margin-bottom: 15px"> 
                                    <p style="font-size: 25px">Adequação ao curso:</p>
                                    <legend>Avaliar se o projeto é relevante a formação do aluno</legend>
                                    <fieldset>
                                        <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="p4_1" style="margin-right: 15%">
                                            <input type="radio" id="p4_1" class="mdl-radio__button" name="pergunta4" value="1" checked>
                                            <span class="mdl-radio__label">1. Sim</span>
                                        </label>
                                        <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="p4_2">
                                            <input type="radio" id="p4_2" class="mdl-radio__button" name="pergunta4" value="2">
                                            <span class="mdl-radio__label">2. Não</span>
                                        </label>
                                    </fieldset>
                                </div>

                                <!-- PERGUNTA 5 -->
                                <div class="mdl-cell--12-col" style="margin-bottom: 15px"> 
                                    <p style="font-size: 25px">Plano de trabalho a ser desenvolvido:</p>
                                    <legend>Atividades e cronograma propostos</legend>
                                    <fieldset>
                                        <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="p5_1" style="margin-right: 10%">
                                            <input type="radio" id="p5_1" class="mdl-radio__button" name="pergunta5" value="1" checked>
                                            <span class="mdl-radio__label">1. Mal especificado e/ou não exequível</span>
                                        </label>
                                        <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="p5_2" style="margin-right: 10%">
                                            <input type="radio" id="p5_2" class="mdl-radio__button" name="pergunta5" value="2">
                                            <span class="mdl-radio__label">2. Exequível</span>
                                        </label>
                                        <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="p5_3">
                                            <input type="radio" id="p5_3" class="mdl-radio__button" name="pergunta5" value="3">
                                            <span class="mdl-radio__label">3. Muito bem especificado e exequível</span>
                                        </label>
                                    </fieldset>
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
                            <div class="btn-groupA" style="float: right; margin-right: 2%">
                                <a href="profRevDis.jsp?turmaAno=<% out.print(request.getParameter("turmaAno")); %>" class="a">
                                    <button type="button" class="btnAcoes"  style="padding: 25px 40px">Avançar</button>
                                </a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <%@include file="../rodapeInicial.jsp"%>