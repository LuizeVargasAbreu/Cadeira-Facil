<%@include file="cabecalhoAdmin.jsp"%>
<%
    String msg="";
    
    if(request.getParameter("txtNome")== null)
    {
        response.sendRedirect("listAdmin.jsp");
    }
    else
    {
        
        String nome = request.getParameter("txtNome");
        
       try
        {
            msg = "se tornou organizador!";
            
        }
        catch(Exception ex)
        {
            msg = "Erro ao definir organizador.";
        }
        
    }
    
    String nome = request.getParameter("txtNome");
%>
<!-- The Modal -->
<div id="myModal" class="modal" style="display: block">
    <!-- Modal content -->
    <div class="modal-content">
        <a href="listAdmin.jsp" class="a">
            <span class="close" onclick="fecharModal()">×</span>
        </a>
        <div class="infosModal">
            <div class="centro">
                <b><%=nome%> <br><br> <%=msg%></b>
            </div>
        </div>
    </div>
</div>
            
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
                    <h3>Definir professor como organizador</h3>
                    <div class="divCadastro">
                        <form action="definir-ok.jsp" method="post">
                            <div class="mdl-cell--12-col">
                                <label for="txtNome">Nome:</label>
                                <br>
                                <select required name="papelUsuario" style="width: 100%;">
                                    <option value="selecionar" selected></option>
                                    <option value="Lisane Brisolara de Brisolara">Lisane Brisolara de Brisolara</option>
                                    <option value="Larissa Astrogildo de Freitas">Larissa Astrogildo de Freitas</option>
                                    <option value="Nome de outros professores">Nome de outros professores</option>
                                </select>
                            </div>
                            <div class="mdl-cell--12-col">
                                <div class="btn-groupA" style="float: right; padding-top: 10%; margin-right: 1%">
                                    <h3 style="float: left; margin-right: 25px">Tornar Organizador?</h3>
                                    <button type="submit" class="btnAcoes"  style="padding: 25px 25px">Confirmar</button>
                                    <button type="reset" class="btnAcoes"  style="padding: 25px 25px; margin-left: 25px">Cancelar</button>
                                </div>
                            </div>
                        </form>                    
                    </div>
                </div>
            </div>
        </section>
<%@include file="../rodapeInicial.jsp"%>