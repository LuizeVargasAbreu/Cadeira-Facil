<%
    String sessionLogin = (String) session.getAttribute("usuarioAdmin");
    if (sessionLogin == null)
        throw new ServletException("Invalid Login");
        
    Boolean[] sessionPapeis = (Boolean[]) session.getAttribute("usuarioPapeis");
    if (!sessionPapeis[1])
        throw new ServletException("Organizador Only");
%>

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
                        <form action="../FileUploadCsv" method="post" enctype="multipart/form-data">
                            <div class="mdl-cell--12-col">
                                <label for="anoSemestre">Ano/Semestre:</label>
                                <input type="text" required name="anoSemestre">
                                <br>
                                <label for="csvAlunos">CSV Alunos:</label>
                                <br>
                                <input type="text" required name="organizador" value=<% out.print(sessionLogin); %> hidden>
                                <input type="file" required name="csvAlunos" accept=".csv">
                                
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
