
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
    <a href="alunoTurmas.jsp" class="a">
        <button class="btnCabecalho" style="padding: 25px 50px">Voltar</button>
    </a>
</div>
</div>
</header>
<%
    String sessionLogin = (String) session.getAttribute("usuarioAdmin");
    if (sessionLogin == null)
        throw new ServletException("Invalid Login");
    
    if(request.getParameter("sair") != null) {
        session.setAttribute("usuarioAdmin", null);
    }
%>
<main class="mdl-layout__content">
    <div class="mdl-layout__tab-panel is-active" id="overview">
        <div class="mdl-grid centro">
            <div class="btn-groupA">                 
                <a href="alunoRealizar.jsp?turmaAno=<% out.print(request.getParameter("turmaAno")); %>" class="a">
                    <button class="btnOpcoes" style="padding: 50px 50px">Realizar submissão</button>
                </a>
                <%
                    ResultSet rs = makeQuery(String.format("SELECT status FROM Submissao WHERE fk_turma_anosemestre='%s' AND fk_aluno_email='%s'", request.getParameter("turmaAno"), sessionLogin));
                    
                    int count = 0;
                    boolean aprov = true;
                    boolean wait = false;
                    
                    while (rs != null && rs.next()) {
                        if (rs.getString("status").equals("wait")) {
                            wait = true;
                        }
                        else if (rs.getString("status").equals("repr")) {
                            aprov = false;
                        }
                        
                        count++;
                    }
                    
                    if (count == 0 || wait)
                        out.println(String.format("<a href=\"alunoSub.jsp?turmaAno=%s\" class=\"a\"><button class=\"btnOpcoes\" style=\"padding: 50px 41px\">Visualizar submissão</button></a>", request.getParameter("turmaAno")));
                    else if (!aprov)
                        out.println(String.format("<a href=\"alunoSubRep.jsp?turmaAno=%s\" class=\"a\"><button class=\"btnOpcoes\" style=\"padding: 50px 41px\">Visualizar submissão</button></a>", request.getParameter("turmaAno")));
                    else
                        out.println(String.format("<a href=\"alunoSubApr.jsp?turmaAno=%s\" class=\"a\"><button class=\"btnOpcoes\" style=\"padding: 50px 41px\">Visualizar submissão</button></a>", request.getParameter("turmaAno")));
                %>
            </div>
        </div>
<%@include file="../rodapeInicial.jsp"%>