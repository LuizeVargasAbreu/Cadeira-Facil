<%
    String sessionLogin = (String) session.getAttribute("usuarioAdmin");
    if (sessionLogin == null)
        throw new ServletException("Invalid Login");
        
    Boolean[] sessionPapeis = (Boolean[]) session.getAttribute("usuarioPapeis");
    if (!sessionPapeis[0])
        throw new ServletException("Admin Only");
%>

<%@include file="cabecalhoAdmin.jsp"%>

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
                    <h3>Cadastrar usuário</h3>
                    <div class="divCadastro">
                        <form action="cadastrar-ok.jsp" method="post">
                            <div class="mdl-cell--12-col">
                                <label for="txtNome">Nome:</label>
                                <input type="text" required name="txtNome">

                                <label for="txtMatricula">Matrícula/SIAPE:</label>
                                <input type="text" required name="txtMatricula">

                                <label for="txtEmail">E-mail:</label>
                                <input type="email" required name="txtEmail">

                                <label for="txtSenha">Senha:</label>
                                <input type="text" required name="txtSenha"> <!-- Como a senha é o admin que está cadastrando, precisa ser tipo "password" ou pode ser tipo "text"? -->

                                <label for="papelUsuario">Papel:</label>
                                <br>
                                <select required name="papelUsuario">
                                    <option value="administrador" selected>Administrador</option>
                                    <option value="organizador">Organizador</option>
                                    <option value="professor">Professor</option>
                                    <option value="aluno">Aluno</option>
                                </select>
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