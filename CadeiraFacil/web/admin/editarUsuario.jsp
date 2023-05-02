<%
    String sessionLogin = (String) session.getAttribute("usuarioAdmin");
    if (sessionLogin == null)
        throw new ServletException("Invalid Login");
        
    Boolean[] sessionPapeis = (Boolean[]) session.getAttribute("usuarioPapeis");
    if (!sessionPapeis[0])
        throw new ServletException("Admin Only");
        
    String requestEditEmail = request.getParameter("requestEditEmail");
    if (sessionLogin == null)
        throw new ServletException("Invalid Request Email");
%>

<%@include file="cabecalhoAdmin.jsp"%>
<%@include file="../DBConn.jsp"%>

<div class="btn-groupA" style="margin: 3% 0 0 64%">
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
    <a href="listAdmin.jsp" class="a">
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
                    <h3>Editar usuário</h3>
                    <div class="divCadastro">
                        <form action="editar-ok.jsp" method="post">
                            <div class="mdl-cell--12-col">
                                <%
                                    ResultSet rs = makeQuery(String.format("SELECT * FROM Usuario WHERE Email='%s'", requestEditEmail));
                                    if (rs.next()) {
                                        out.println("<label for=\"txtNome\">Nome:</label>");
                                        out.println(String.format("<input type=\"text\" name=\"txtNome\" value=\"%s\">", rs.getString("Nome")));
                                        
                                        out.println("<label for=\"txtMatricula\">Matrícula/SIAPE:</label>");
                                        out.println(String.format("<input type=\"text\" name=\"txtMatricula\" value=\"%s\">", rs.getString("Matricula")));
                                        
                                        out.println("<label for=\"txtEmail\">E-mail:</label>");
                                        out.println(String.format("<input type=\"email\" name=\"txtEmail\" value=\"%s\" readonly>", rs.getString("Email")));
                                        
                                        out.println("<label for=\"txtSenha\">Senha:</label>");
                                        out.println(String.format("<input type=\"text\" name=\"txtSenha\" value=\"%s\">", rs.getString("Senha")));
                                        
                                        out.println("<label for=\"papelUsuario\">Papel:</label><br><select name=\"papelUsuario\">");
                                        
                                        Boolean selected = false;
                                        Boolean[] papeis = (Boolean[]) rs.getArray("Papeis").getArray();
                                        
                                        for (int i = 0; i < 4; ++i) {
                                            String papelStr = "Administrador";
                                            
                                            if (i == 1)
                                                papelStr = "Organizador";
                                            else if (i == 2)
                                                papelStr = "Professor";
                                            else if (i == 3)
                                                papelStr = "Aluno";
                                                
                                            if (papeis[i] && !selected) {
                                                selected = true;
                                                out.println(String.format("<option value=\"%s\" selected>%s</option>", papelStr.toLowerCase(), papelStr));
                                            }
                                            else
                                                out.println(String.format("<option value=\"%s\">%s</option>", papelStr.toLowerCase(), papelStr));
                                        }
                                        
                                        out.println("</select>");
                                    }
                                %>
                            </div>
                            <div class="btn-groupA" style="float: right; margin-right: 1%">
                                <button type="submit" class="btnAcoes"  style="padding: 25px 25px">Confirmar</button>
                                <a href="listAdmin.jsp" class="a">
                                    <button type="button" class="btnAcoes"  style="padding: 25px 25px">Cancelar</button>
                                </a>
                            </div>
                        </form>                    
                    </div>
                </div>
            </div>
        </section>
<%@include file="../rodapeInicial.jsp"%>