<%@include file="cabecalhoProf.jsp"%>
<%@include file="../DBConn.jsp"%>


<div class="btn-groupA" style="float: right; padding-top: 5%">
    <a href="../escolherSessao.jsp" class="a">
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
                    <h3>Minhas turmas</h3>
                    <div class="mdl-cell--12-col">
                        <label for="anoSemestre">Ano/Semestre</label>
                        <br>
                        <input type="text" name="anoSemestre" value="2022/2" >                              
                    </div>
                    <div class="btn-groupA" style="float: right">
                        <a href="profOpcoes.jsp" class="a">                                    
                            <button class="btnAcoes"  style="padding: 25px 25px">Abrir</button>
                        </a>                   
                    </div>
                </div>
            </div>
        </section>
        <%@include file="../rodapeInicial.jsp"%>