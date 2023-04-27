<%@include file="cabecalhoAluno.jsp"%>
<div class="btn-groupA" style="float: right; padding-top: 5%">
    <!--    <a href="listAdmin.jsp" class="a">
            <button class="btnCabecalho" style="padding: 25px 22px">Ressubmeter</button>
        </a>
        <a href="listAdmin.jsp" class="a">
            <button class="btnCabecalho" style="padding: 16px 36px">Visualizar <br> revisões</button>
        </a>-->
    <a href="alunoOpcoes.jsp" class="a">
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
                    <div class="mdl-cell--12-col">
                        <input type="text" name="status" value="Status" style="width: 150px; color: #fefefe; float: right; text-align: center; padding: 10px 30px" readonly>
                    </div>
                    <br>
                    <div class="mdl-cell--12-col">
                        <label for="titulo">Título:</label><br>
                        <input type="text" name="titulo" value="Título" style="color: #fefefe">

                        <label for="orientador">Orientador:</label>
                        <input type="text" name="orientador" value="Orientador" style="color: #fefefe">

                        <label for="coorientador">Coorientador:</label>
                        <input type="text" name="coorientador" value="Coorientador" style="color: #fefefe">

                        <label for="resumo">Resumo:</label>
                        <input type="text" name="resumo" value="Resumo" style="color: #fefefe">

                        <label for="arquivo">Arquivo:</label>
                        <br>
                        <input type="text" name="arquivo" value="Arquivo.pdf" style="width: auto; color: #fefefe">

                    </div>
                </div>
            </div>
    </div>
</section>
<%@include file="../rodapeInicial.jsp"%>