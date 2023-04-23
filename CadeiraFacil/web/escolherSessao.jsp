<%@include file="cabecalhoInicial.jsp"%>
<div class="btn-group3" style="float: right; padding-top: 5%">
    <a href="alterarSenha.jsp" class="a">
        <button class="btnCabecalho" style="padding: 25px 15px">Alterar senha</button>
    </a>
    <a href="index.html?sair=ok" class="a">
        <button class="btnCabecalho" style="padding: 25px 50px">Sair</button>
    </a>
</div>
</div>
</div>
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
           //Crio a Sessão do usuário Admin
           session.setAttribute("usuarioAdmin", login);
           //redirecionar para a página inicial
           response.sendRedirect("index.jsp");
        }
        else
        {
           msg = "Errou";
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
                <h4>Bem vindo ao Cadeira Fácil! <br> 
                    Escolha o papel desejado para a sessão:</h4>
            </div>
            <div class="btn-group btn-group2"> 
                <table>
                    <tr>
                        <td>
                            <a href="admin/listAdmin.jsp" class="a">
                                <button class="button2" style="padding: 25px 25px;" name="btnAdmin">Administrador</button>
                            </a>
                        </td>
                        <td>
                            <a href="professor/listProfessor.jsp" class="a">
                                <button class="button" style="padding: 25px 40px;" name="btnProfessor">Professor</button>
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a href="organizador/listOrganizador.jsp" class="a">
                                <button class="button2" style="padding: 25px 30px;" name="btnOrganizador">Organizador</button>
                            </a>
                        </td>
                        <td>
                            <a href="aluno/listAluno.jsp" class="a">
                                <button class="button" style="padding: 25px 55px;" name="btnAluno">Aluno</button>
                            </a>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <%@include file="rodapeInicial.jsp"%>