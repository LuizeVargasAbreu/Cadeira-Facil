<%@include file="cabecalhoAluno.jsp"%>
<div class="btn-groupA" style="float: right; padding-top: 5%">
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
                    <h3>Realizar submissão</h3>
                    <div class="divCadastro">
                        <form action="#" method="post">
                            <div class="mdl-cell--12-col">
                                <label for="titulo">Título:</label><br>
                                <input type="text" required name="titulo">

                                <label for="orientador">Orientador:</label>
                                <select required name="orientador" style="width: 100%;">
                                    <option value="" selected>Lisane Brisolara de Brisolara</option>
                                    <option value="">Larissa Astrogildo de Freitas</option>
                                </select>

                                <label for="coorientador">Coorientador:</label>
                                <input type="text" required name="coorientador">

                                <label for="resumo">Resumo:</label>
                                <input type="text" required name="resumo">

                                <label for="arquivo">Arquivo:</label>
                                <br>
                                <input type="file" required name="arquivo" style="width: auto">
                                
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