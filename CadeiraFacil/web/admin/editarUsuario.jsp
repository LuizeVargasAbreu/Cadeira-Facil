<%@include file="cabecalhoAdmin.jsp"%>
<div class="btn-groupA" style="float: right; padding-top: 5%">
    <a href="listAdmin.jsp" class="a">
        <button class="btnCabecalho" style="padding: 25px 50px">Voltar</button>
    </a>
</div>
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
                                <label for="txtNome">Nome:</label>
                                <input type="text" name="txtNome" value="Pegar o nome do usuário no banco">

                                <label for="txtMatricula">Matrícula/SIAPE:</label>
                                <input type="text" name="txtMatricula" value="Pegar a matrícula do usuário no banco">

                                <label for="txtEmail">E-mail:</label>
                                <input type="email" name="txtEmail" value="Pegaroemaildousu@rionobanco.com">

                                <label for="txtSenha">Senha:</label>
                                <input type="text" name="txtSenha" value="Pegar a senha do usuário no banco">

                                <label for="papelUsuario">Papel:</label>
                                <br>
                                <select name="papelUsuario">
                                    <option value="selecionar" selected></option>
                                    <option value="professor">Professor</option>
                                    <option value="organizador">Organizador</option>
                                    <option value="aluno">Aluno</option>
                                </select>
                            </div>
                            <div class="btn-groupA" style="float: right; margin-right: 1%">
                                <button type="submit" class="btnAcoes"  style="padding: 25px 25px">Confirmar</button>
                                <button type="reset" class="btnAcoes"  style="padding: 25px 25px">Cancelar</button>
                            </div>
                        </form>                    
                    </div>
                </div>
            </div>
        </section>
<%@include file="../rodapeInicial.jsp"%>