<%@include file="cabecalhoInicial.jsp"%>
<div class="btn-group3" style="margin: 5% 0 0 65%">
    <a href="alterarSenha.jsp" class="a">
        <button class="btnCabecalho" style="padding: 25px 15px">Alterar senha</button>
    </a>
    <a href="index.html?sair=ok" class="a">
        <button class="btnCabecalho" style="padding: 25px 50px">Sair</button>
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
            <div class="mdl-cell--12-col"> 
                <h4>Bem vindo ao Cadeira Fácil! <br> 
                    Escolha o papel desejado para a sessão:</h4>
            </div>
            <div class="btn-group btn-group2"> 
                <table>
                    <%
                        Boolean[] papeis = (Boolean[]) session.getAttribute("usuarioPapeis");
                        int count = 0;
                        
                        for (int i = 0; i < 4; ++i) {
                            if (papeis[i]) {
                                if (count == 0)
                                    out.println("<tr>");
                                else if (count == 2)
                                    out.println("</tr><tr>");
                                
                                if (i == 0)
                                    out.println("<td> <a href=\"admin/listAdmin.jsp\" class=\"a\"> <button class=\"button2\" style=\"padding: 25px 25px;\" name=\"btnAdmin\">Administrador</button> </a> </td>");
                                else if (i == 1)
                                    out.println("<td> <a href=\"organizador/orgTurmas.jsp\" class=\"a\"> <button class=\"button2\" style=\"padding: 25px 30px;\" name=\"btnOrganizador\">Organizador</button> </a> </td>");
                                else if (i == 2)
                                    out.println("<td> <a href=\"professor/profTurmas.jsp\" class=\"a\"> <button class=\"button2\" style=\"padding: 25px 40px;\" name=\"btnProfessor\">Professor</button> </a> </td>");
                                else if (i == 3)
                                    out.println("<td> <a href=\"aluno/alunoTurmas.jsp\" class=\"a\"> <button class=\"button2\" style=\"padding: 25px 55px;\" name=\"btnAluno\">Aluno</button> </a> </td>");
                                    
                                count++;
                            }
                        }
                        
                        if (count > 0)
                            out.println("</tr>");
                    %>
                </table>
            </div>
        </div>
        <%@include file="rodapeInicial.jsp"%>