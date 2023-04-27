<%@include file="cabecalhoOrg.jsp"%>
<div class="btn-groupA" style="float: right; padding-top: 5%">
    <a href="orgTurmas.jsp" class="a">
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
                    <h3>Criar turma</h3>
                    <div class="divCadastro">
                        <form action="#" method="post">
                            <div class="mdl-cell--12-col">
                                <label for="anoSemestre">Ano/Semestre:</label>
                                <input type="text" required name="anoSemestre">
                                <br>
                                <label for="csvAlunos">CSV Alunos:</label>
                                <br>
                                <input type="file" required name="csvAlunos">
                                
                            </div>
                            <div class="btn-groupA" style="float: right; margin-right: 1%; padding-top: 5%">
                                <button type="submit" class="btnAcoes"  style="padding: 25px 25px">Confirmar</button>
                                <button type="reset" class="btnAcoes"  style="padding: 25px 25px; margin-left: 10px">Cancelar</button>
                            </div>
                        </form>                    
                    </div>
                </div>
            </div>
        </section>
<%@include file="../rodapeInicial.jsp"%>
