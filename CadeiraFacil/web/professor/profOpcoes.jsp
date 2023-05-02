<%@include file="cabecalhoProf.jsp"%>
<div class="btn-groupA" style="margin: 3% 0 0 67%">
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
    <a href="profTurmas.jsp" class="a">
        <button class="btnCabecalho" style="padding: 25px 50px">Voltar</button>
    </a>
</div>
</div>
</header>
<%
    String sessionLogin = (String) session.getAttribute("usuarioAdmin");
    if (sessionLogin == null)
        throw new ServletException("Invalid Login");
    
    if(request.getParameter("sair") != null) {
        session.setAttribute("usuarioAdmin", null);
    }
%>
<main class="mdl-layout__content">
    <div class="mdl-layout__tab-panel is-active" id="overview">
        <div class="mdl-grid centro">
            <div class="btn-groupA">                 
                <a href="profOrientacoes.jsp" class="a">
                    <button class="btnOpcoes" style="padding: 50px 50px;">Submissões orientadas</button>
                </a>             
                <a href="index.html?sair=ok" class="a">
                    <button class="btnOpcoes" style="padding: 50px 120px;">Revisões</button>
                </a>
            </div>
        </div>
<%@include file="../rodapeInicial.jsp"%>