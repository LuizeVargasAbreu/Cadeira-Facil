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
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>

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
    <%
        ResultSet rsPrz = makeQuery(String.format("SELECT prazorev,prazosub FROM Turma WHERE AnoSemestre='%s'", turmaAno));

        if (rsPrz != null && rsPrz.next()) {
            java.sql.Date[] rev = (java.sql.Date[])rsPrz.getArray("prazorev").getArray();
            java.sql.Date[] sub = (java.sql.Date[])rsPrz.getArray("prazosub").getArray();

            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            Date now = new Date();

            Date p11 = df.parse(rev[0].toString());
            Date p12 = df.parse(rev[1].toString());
            Date p21 = df.parse(sub[0].toString());
            Date p22 = df.parse(sub[1].toString());
            
            if ((p11.compareTo(now) < 0 && p12.compareTo(now) > 0) || (p21.compareTo(now) < 0 && p22.compareTo(now) > 0)) {
                out.print("<a class=\"a\" onclick=\"document.getElementById('myform').submit();\">");
                out.print("<button class=\"btnCabecalho\" style=\"padding: 25px 20px; background-color:#808080\" disabled  title=\"Somente após o prazo terminar.\">Distr. Automática</button></a>");
            }
            else {
                out.print("<a class=\"a\" onclick=\"document.getElementById('myform').submit();\">");
                out.print("<button class=\"btnCabecalho\"  style=\"padding: 25px 20px\">Distr. Automática</button></a>");
            }
        }
    %>
    <a href="orgTurmas.jsp" class="a">
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
                                        int count = 0;
                                        
                                        while (rs3 != null && rs3.next()) {
                                            count++;
                                            
                                            ResultSet rs4 = makeQuery(String.format("SELECT Nome FROM Usuario WHERE Email='%s'", rs3.getString("fk_revisor_email")));
                                            String revisores = "";
                                            
                                            if (rs4 != null && rs4.next())
                                                revisores += String.format("%s ", rs4.getString("Nome").split(" ")[0]);
                                            
                                            out.println(String.format("<td>%s</td>", revisores));
                                        }
                                        
                                        if (count == 0)
                                            out.println(String.format("<td>Revisores não definidos</td>"));
                                        
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