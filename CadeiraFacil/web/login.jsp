<%@include file="cabecalhoInicial.jsp"%>
<%@include file="DBConn.jsp"%>
</header>
<%
    String msg = "";
    if (request.getParameter("txtEmail")!=null &&
            request.getParameter("txtSenha")!=null)
    {
        msg = "Tentou fazer o login";
        String login = request.getParameter("txtEmail");
        String senha = request.getParameter("txtSenha");
        if(login.equals("Admin") && senha.equals("Admin"))
        {
           //Crio a Sess�o do usu�rio Admin
           session.setAttribute("usuarioAdmin", login);
           session.setAttribute("usuarioNome", "Admin");
           session.setAttribute("usuarioPapeis", new Boolean[] { true, true, true, true });
           //redirecionar para a p�gina onde o usu�rio ir� escolher o papel
           response.sendRedirect("escolherSessao.jsp");
        }
        else {
            ResultSet rs = makeQuery(String.format("SELECT * FROM Usuario WHERE Email='%s'", login));

            if (rs != null && rs.next() && senha.equals(rs.getString("Senha"))) {
                //Crio a Sess�o do usu�rio Admin
                session.setAttribute("usuarioAdmin", login);
                session.setAttribute("usuarioSenha", senha);
                session.setAttribute("usuarioNome", rs.getString("Nome"));
                session.setAttribute("usuarioPapeis", rs.getArray("Papeis").getArray());
                //redirecionar para a p�gina onde o usu�rio ir� escolher o papel
                response.sendRedirect("escolherSessao.jsp");
            }
            else {
                msg = "E-mail ou senha errada! Tente novamente.";
            }
        }
    }
    
    if(request.getParameter("sair") != null)
    {
        session.setAttribute("usuarioAdmin", null);
    }
%>
<main class="mdl-layout__content">
    <div class="mdl-layout__tab-panel is-active" id="overview">
        <div class="mdl-grid centro">
            <div class="mdl-cell--12-col"> 
                <h3>Fazer Login</h3>
                <%=msg%>
            </div>

            <form action="login.jsp" method="post">
                <div class="divformulario">

                    <div class="mdl-cell--12-col"> 
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                            <input class="mdl-textfield__input" type="text" required name="txtEmail" style="font-size: 20px"/>
                            <label class="mdl-textfield__label" for="txtEmail" style="font-size: 20px">E-mail</label>
                        </div>
                    </div>

                    <div class="mdl-cell--12-col"> 
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                            <input class="mdl-textfield__input" type="password" required  name="txtSenha" style="font-size: 20px"/>
                            <label class="mdl-textfield__label" for="txtSenha" style="font-size: 20px">Senha</label>
                        </div>
                    </div>

                    <div class="mdl-cell--12-col">
                        <div class="btn-group">
                            <button type="submit" class="button" style="padding: 20px 30px; display: inline-block">
                                Entrar
                            </button>
                        </div>
                    </div>

                </div>
            </form> 
        </div>
<%@include file="rodapeInicial.jsp"%>