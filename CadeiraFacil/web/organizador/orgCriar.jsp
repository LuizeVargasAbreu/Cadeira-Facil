<%
    String sessionLogin = (String) session.getAttribute("usuarioAdmin");
    if (sessionLogin == null)
        throw new ServletException("Invalid Login");
        
    Boolean[] sessionPapeis = (Boolean[]) session.getAttribute("usuarioPapeis");
    if (!sessionPapeis[1])
        throw new ServletException("Organizador Only");
%>

<%@include file="cabecalhoOrg.jsp"%>

<div class="btn-groupA" style="margin: 3% 0 0 63%">
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
    <a href="orgTurmas.jsp" class="a">
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
                    <h3>Criar turma</h3>
                    <div class="divCadastro">
                        <form action="../FileUploadCsv" method="post" enctype="multipart/form-data">
                            <div class="mdl-cell--12-col">
                                <label for="anoSemestre">Ano/Semestre:</label>
                                <input type="text" required name="anoSemestre" placeholder="aaaass">
                                <br>
                                <label for="prazo1">Prazo 1:</label>
                                <input type="text" required name="prazo11" placeholder="dd/mm/aaaa">
                                <input type="text" required name="prazo12" placeholder="dd/mm/aaaa">
                                <br>
                                <label for="prazo2">Prazo 2:</label>
                                <input type="text" required name="prazo21" placeholder="dd/mm/aaaa">
                                <input type="text" required name="prazo22" placeholder="dd/mm/aaaa">
                                <br>
                                <label for="csvAlunos">CSV Alunos:</label>
                                <br>
                                <input type="text" required name="organizador" value=<% out.print(sessionLogin); %> hidden>
                                <input type="file" required name="csvAlunos" accept=".csv">

                            </div>
                            <div class="btn-groupA" style="float: right; margin-right: 1%; padding-top: 5%">
                                <button type="submit" class="btnAcoes"  style="padding: 25px 25px">Confirmar</button>
                                <a href="orgTurmas.jsp" class="a">
                                    <button type="button" class="btnAcoes"  style="padding: 25px 25px; margin-left: 10px">Cancelar</button>
                                </a>
                            </div>
                        </form>                    
                    </div>
                </div>
            </div>
        </section>
<%@include file="../rodapeInicial.jsp"%>
