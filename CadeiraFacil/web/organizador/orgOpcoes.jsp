<%
    String sessionLogin = (String) session.getAttribute("usuarioAdmin");
    if (sessionLogin == null)
        throw new ServletException("Invalid Login");
        
    Boolean[] sessionPapeis = (Boolean[]) session.getAttribute("usuarioPapeis");
    if (!sessionPapeis[1])
        throw new ServletException("Organizador Only");
    
    String turmaAno = request.getParameter("turmaAno");
%>

<%@include file="cabecalhoOrg.jsp"%>
<%@include file="../DBConn.jsp"%>

<form id="myform" action="../DistribSubmissoesRandom" method="get" enctype="multipart/form-data" hidden>
    <input type="text" name="turmaAno" value=<% out.print(turmaAno); %> hidden>
</form>

<div class="btn-groupA" style="margin: 6% 0 5% 52%">
    <div class="btn-groupA" style="margin-top: 10%; margin-left: 95%">
        <a href="../index.html?sair=ok" class="a">
            <button class="btnAcoes">
                <div id="logout" class="icon material-icons">logout</div>
                <div class="mdl-tooltip mdl-tooltip--large" for="logout">
                    Sair
                </div>
            </button>
        </a>
    </div>
    <a class="a">
        <button class="btnCabecalho"  style="padding: 25px 20px; background-color:#808080" disabled>Distr. Manual</button>
    </a>
    <a class="a" onclick="document.getElementById('myform').submit();">
        <button class="btnCabecalho"  style="padding: 25px 20px">Distr. Autom�tica</button>
    </a>
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
                    <h3>Alunos</h3>
                    <table style="width: 130%">
                        <thead>
                            <tr>
                                <th>Nomes</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                ResultSet rs = makeQuery(String.format("SELECT fk_aluno_email FROM Aluno_Turma WHERE fk_turma_anosemestre='%s'", turmaAno));
                                
                                while (rs != null && rs.next()) {
                                    
                                    ResultSet rs2 = makeQuery(String.format("SELECT Nome FROM Usuario WHERE Email='%s'", rs.getString("fk_aluno_email")));
                                    
                                    if (rs2 != null && rs2.next()) {
                                        out.println(String.format("<tr class=\"trHover\">"));
                                        out.println(String.format("<td>%s</td>", rs2.getString("Nome")));
                                        
                                        ResultSet rs3 = makeQuery(String.format("SELECT fk_revisor_email FROM Revisor_Submissao WHERE fk_aluno_email='%s'", rs.getString("fk_aluno_email")));
                                    
                                        if (rs3 != null && rs3.next()) {
                                            ResultSet rs4 = makeQuery(String.format("SELECT Nome FROM Usuario WHERE Email='%s'", rs3.getString("fk_revisor_email")));
                                            String revisores = "";
                                            
                                            while (rs4 != null && rs4.next())
                                                revisores += String.format("%s ", rs4.getString("Nome").split(" ")[0]);
                                            
                                            out.println(String.format("<td>%s</td>", revisores));
                                        }
                                        else
                                            out.println(String.format("<td>Revisores n�o definidos</td>"));
                                        
                                        out.println(String.format("</tr>"));
                                    }
                                }
                            %>
                        </tbody>
                    </table> 
                </div>
            </div>
        </section>
        <%@include file="../rodapeInicial.jsp"%>