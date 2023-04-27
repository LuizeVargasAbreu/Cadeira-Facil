<%@include file="cabecalhoAluno.jsp"%>
<div class="btn-groupA" style="float: right; padding-top: 5%">
    <a href="listAdmin.jsp" class="a">
        <button class="btnCabecalho" style="padding: 25px 50px">Alterar</button>
    </a>
    <a href="alunoOpcoes.jsp" class="a">
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
                    <h3>Minha submissão</h3>
                    <div class="divCadastro">
                        <form action="cadastrar-ok.jsp" method="post">
                            <div class="mdl-cell--12-col">
                                <label for="txtNome">Título:</label><br>
                                <input type="text" required name="txtNome">

                                <label for="papelUsuario">Orientador</label>
                                <br>
                                <input type="email" required name="txtEmail">
                                <br>
                                <label for="txtMatricula">Coorientador:</label>
                                <input type="text" required name="txtMatricula">

                                <label for="txtEmail">Resumo:</label>
                                <input type="email" required name="txtEmail">

                                <label for="txtEmail">Arquivo:</label>
                                <input type="file" required name=".pdf">

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