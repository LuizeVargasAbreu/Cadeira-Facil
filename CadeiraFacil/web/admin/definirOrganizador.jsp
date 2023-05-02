<%
    String sessionLogin = (String) session.getAttribute("usuarioAdmin");
    if (sessionLogin == null)
        throw new ServletException("Invalid Login");
        
    Boolean[] sessionPapeis = (Boolean[]) session.getAttribute("usuarioPapeis");
    if (!sessionPapeis[0])
        throw new ServletException("Admin Only");
%>

<%@include file="cabecalhoAdmin.jsp"%>
<%@include file="../DBConn.jsp"%>

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
                    <h3>Definir professor como organizador</h3>
                    <div class="divCadastro">
                        <form action="definir-ok.jsp" method="post">
                            <div class="mdl-cell--12-col">
                                <label for="txtNome">Nome:</label>
                                <br>
                                <select required name="txtNome" style="width: 100%;">
                                    <%
                                        ResultSet rs = makeQuery(String.format("SELECT * FROM Usuario WHERE Papeis[3]=true AND Papeis[2]=false"));
                                        
                                        while (rs.next()) {
                                            out.println(String.format("<option value=\"%s\">%s</option>", (rs.getString("Email") + "#" + rs.getString("Nome")), rs.getString("Nome")));
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="mdl-cell--12-col" style="margin-top: 5%">
                                <div class="btn-groupA" style="float: right; padding-top: 10%; margin-right: 1%">
                                    <h3 style="float: left; margin-right: 25px">Tornar Organizador?</h3>
                                    <button type="submit" class="btnAcoes"  style="padding: 25px 25px">Confirmar</button>
                                    <a href="listAdmin.jsp" class="a">
                                        <button type="button" class="btnAcoes"  style="padding: 25px 25px; margin-left: 25px">Cancelar</button>
                                    </a>
                                </div>
                            </div>
                        </form>                    
                    </div>
                </div>
            </div>
        </section>
<%@include file="../rodapeInicial.jsp"%>