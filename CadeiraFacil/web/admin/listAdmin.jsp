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

<script>
let delUserEmail = "";
    
function httpGet(theUrl) {
    var xmlHttp = new XMLHttpRequest();
    xmlHttp.open( "GET", theUrl, false ); // false for synchronous request
    xmlHttp.send( null );
    return xmlHttp.responseText;
}

function EnableDivModal(_email) {
    delUserEmail = _email;
    
    document.getElementById("myModal").hidden = false;
}
function DisableDivModal() {
    document.getElementById("myModal").hidden = true;
}
function ExcluirUsuario() {
    httpGet("excluir-ok.jsp?requestEditEmail=" + delUserEmail);
    
    DisableDivModal();
    location.reload();
}
</script>

<!-- The Modal -->
<div id="myModal" class="modal" style="display: block" hidden>
    <!-- Modal content -->
    <div class="modal-content">
        <div class="infosModal">
            <div class="centro">
                <b>Deseja realmente excluir o usuário?</b>
            </div><br><br>
        </div>
        <div class="btn-groupA centro">
            <a href="javascript:ExcluirUsuario()" class="a">
                <button class="btnAcoes"  style="padding: 25px 50px">Sim</button>
            </a>
            <a href="javascript:DisableDivModal()" class="a">
                <button class="btnAcoes"  style="padding: 25px 50px; margin-left: 25px">Não</button>
            </a>
        </div>
    </div>
</div>

<div class="btn-groupA" style="float: right; padding-top: 5%">
    <a href="definirOrganizador.jsp" class="a">
        <button class="btnCabecalho" style="padding: 16px 5px">Definir professor <br> como organizador</button>
    </a>
    <a href="cadastrarUsuario.jsp" class="a">
        <button class="btnCabecalho" style="padding: 16px 35px">Cadastrar <br> usuário</button>
    </a>
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
                    <h3>Usuários Cadastrados</h3>
                    <table>
                        <thead>
                            <tr>
                                <th>Nome</th>
                                <th>Papel</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                ResultSet rs = makeQuery(String.format("SELECT * FROM Usuario"));
                                
                                while (rs.next()) {
                                    Boolean[] papeis = (Boolean[]) rs.getArray("Papeis").getArray();
                                    String papeisStr = "";
                                    
                                    for (int i = 0, count = 0; i < 4; ++i) {
                                        if (papeis[i]) {
                                            if (count++ > 0)
                                                papeisStr += ", ";
                                            
                                            if (i == 0)
                                                papeisStr += "Administrador";
                                            else if (i == 1)
                                                papeisStr += "Organizador";
                                            else if (i == 2)
                                                papeisStr += "Professor";
                                            else
                                                papeisStr += "Aluno";
                                        }
                                    }
                                    
                                    out.println(String.format("<tr class=\"trHover\"><td>%s</td><td>%s</td>", rs.getString("Nome"), papeisStr));
                                    out.println(String.format("<td style=\"background-color: white\"> <div class=\"btn-groupA\">"));
                                    
                                    out.println(String.format("<a href=\"editarUsuario.jsp?requestEditEmail=%s\" class=\"a\"><button class=\"btnAcoes\"  style=\"padding: 10px 15px\">Editar</button></a>", rs.getArray("Email")));
                                    out.println(String.format("<a href=\"#\" onclick=\"javascript:EnableDivModal('%s')\" class=\"a\"><button class=\"btnAcoes\"  style=\"padding: 10px 12px\">Excluir</button></a>", rs.getArray("Email")));
                                    
                                    out.println(String.format("</div> </td> </tr>"));
                                }
                            %>
                        </tbody>
                    </table>   
                </div>
            </div>
        </section>
        <%@include file="../rodapeInicial.jsp"%>

