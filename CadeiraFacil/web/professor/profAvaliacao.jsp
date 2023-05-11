<%
    String sessionLogin = (String) session.getAttribute("usuarioAdmin");
    if (sessionLogin == null)
        throw new ServletException("Invalid Login");
        
    Boolean[] sessionPapeis = (Boolean[]) session.getAttribute("usuarioPapeis");
    if (!sessionPapeis[2])
        throw new ServletException("Prof Only");
    
    if(request.getParameter("sair") != null) {
        session.setAttribute("usuarioAdmin", null);
    }
%>

<%@include file="cabecalhoProf.jsp"%>

<script>
    let repSubAluno = "";

    function httpGet(theUrl) {
        var xmlHttp = new XMLHttpRequest();
        xmlHttp.open("GET", theUrl, false); // false for synchronous request
        xmlHttp.send(null);
        return xmlHttp.responseText;
    }

    function EnableDivModal(_email) {
        repSubAluno = _email;

        document.getElementById("myModal").hidden = false;
    }
    function DisableDivModal() {
        document.getElementById("myModal").hidden = true;
    }
</script>

<!-- The Modal -->
<div id="myModal" class="modal" style="display: block" hidden>
    <!-- Modal content -->
    <div class="modal-content">
        <div class="infosModal">
            <div class="centro">
                <b>Tem certeza que deseja reprovar essa submissão?</b>
            </div><br><br>
        </div>
        <div class="btn-groupA centro">
            <a href="#" class="a">
                <button class="btnAcoes"  style="padding: 25px 50px">Sim</button>
            </a>
            <a href="#" class="a">
                <button class="btnAcoes"  style="padding: 25px 50px; margin-left: 25px">Não</button>
            </a>
        </div>
    </div>
</div>

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
    <a href="profRevDis.jsp?turmaAno=<% out.print(request.getParameter("turmaAno"));%>" class="a">
        <button class="btnCabecalho" style="padding: 25px 50px">Voltar</button>
    </a>
</div>
</div>
</header>
<main class="mdl-layout__content">
    <div class="mdl-layout__tab-panel is-active" id="overview">
        <div class="mdl-grid centro">
            <div class="mdl-cell--12-col"> 
                <h3 style="font-size: 50px">Avaliação geral:</h3>
            </div>
            <div class="btn-groupA">                 
                <a href="#" class="a">
                    <button class="btnOpcoes" style="padding: 50px 100px; background-color: #04CE00">Aprovar</button>
                </a>             
                    <a href="#" onclick="javascript:EnableDivModal('%s')" class="a">
                    <button class="btnOpcoes" style="padding: 50px 100px; background-color: #FF0000">Reprovar</button>
                </a>
            </div>
        </div>
<%@include file="../rodapeInicial.jsp"%>