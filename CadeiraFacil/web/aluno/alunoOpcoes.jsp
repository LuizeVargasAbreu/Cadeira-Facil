<%@include file="cabecalhoAluno.jsp"%>
<div class="btn-groupA" style="float: right; padding-top: 5%">
    <a href="../escolherSessao.jsp" class="a">
        <button class="btnCabecalho" style="padding: 25px 50px">Voltar</button>
    </a>
</div>
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
        <div class="mdl-grid centro separaBotao">
            <div class="btn-groupA">                 
                <a href="alterarSenha.jsp" class="a">
                    <button class="btnAcoes" style="padding: 25px 15px">Realizar submissão</button>
                </a>
                <a href="index.html?sair=ok" class="a">
                    <button class="btnAcoes" style="padding: 25px 50px; margin-left: 25px">Visualizar submissão</button>
                </a>
            </div>
        </div>
        <%@include file="../rodapeInicial.jsp"%>