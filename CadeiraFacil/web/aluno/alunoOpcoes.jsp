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
        <div class="mdl-grid centro">
            <div class="btn-groupA">                 
                <a href="alunoRealizar.jsp" class="a">
                    <button class="btnOpcoes" style="padding: 50px 50px">Realizar submissão</button>
                </a>
                <a href="alunoSub.jsp" class="a">
                    <button class="btnOpcoes" style="padding: 50px 41px">Visualizar submissão</button>
                </a>
            </div>
        </div>
        <%@include file="../rodapeInicial.jsp"%>