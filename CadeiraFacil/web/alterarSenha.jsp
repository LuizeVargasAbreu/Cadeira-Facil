<%@include file="cabecalhoInicial.jsp"%>
<div class="btn-group3" style="float: right; padding-top: 5%">
    <a href="escolherSessao.jsp" class="a">
        <button class="btnCabecalho" style="padding: 25px 50px">Voltar</button>
    </a>
</div>
</div>
</div>
</header>
<%
    String msg = "";
    if (request.getParameter("txtSenhaAntiga")!= null &&
            request.getParameter("txtSenhaNova")!= null && 
            request.getParameter("txtConfirmarSenha")!= null)
    {
        String senhaAntiga = request.getParameter("txtSenhaAntiga");
        String senhaNova = request.getParameter("txtSenhaNova");
        String confirmarSenha = request.getParameter("txtConfirmarSenha");
        
        if(senhaAntiga.equals(senhaNova))   //verificar se a senha antiga é a mesma que está cadastrada
        {
            msg = "A senha nova é parecida com a senha antiga.<br>Por favor, tente novamente.";
        }
        else
        {
           if(senhaNova.equals(confirmarSenha))
            {
                msg = "Senha alterado com sucesso!";
                response.sendRedirect("escolherSessao.jsp");
            }
           else
               {
                   msg = "Senha nova não é igual a confirmação.\n Tente novamente.";
               }
        }    
    }
%>
<main class="mdl-layout__content">
    <div class="mdl-layout__tab-panel is-active" id="overview">
        <div class="mdl-grid centro">
            <div class="mdl-cell--12-col"> 
                <h3>Alterar Senha</h3>
                <%=msg%>            
            </div>

            <form action="alterarSenha.jsp" method="post">
                <div class="divformulario">

                    <div class="mdl-cell--12-col"> 
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                            <input class="mdl-textfield__input" type="password" required name="txtSenhaAntiga" style="font-size: 20px"/>
                            <label class="mdl-textfield__label" for="txtSenhaAntiga" style="font-size: 20px">Senha antiga</label>
                        </div>
                    </div>

                    <div class="mdl-cell--12-col"> 
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                            <input class="mdl-textfield__input" type="password" required name="txtSenhaNova" style="font-size: 20px"/>
                            <label class="mdl-textfield__label" for="txtSenhaNova" style="font-size: 20px">Senha nova</label>
                        </div>
                    </div>

                    <div class="mdl-cell--12-col"> 
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                            <input class="mdl-textfield__input" type="password" required name="txtConfirmarSenha" style="font-size: 20px"/>
                            <label class="mdl-textfield__label" for="txtConfirmarSenha" style="font-size: 20px">Confirmar senha</label>
                        </div>
                    </div>

                    <div class="btn-group btn-group2"> 
                        <table>
                            <tr>
                                <td>
                                    <button type="submit" class="button2" style="padding: 20px 30px;">Confirmar</button>
                                </td>
                                <td>
                                    <button type="reset" class="button" style="padding: 20px 30px;">Cancelar</button>
                                </td>
                            </tr>
                        </table>
                    </div>

                </div>
            </form> 
        </div>

<%@include file="rodapeInicial.jsp"%>