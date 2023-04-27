<%@include file="cabecalhoProf.jsp"%>
<%@include file="../DBConn.jsp"%>


<div class="btn-groupA" style="float: right; padding-top: 5%">
    <a href="profOpcoes.jsp" class="a">
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
                    <h3>Submiss�es orientadas</h3>
                    <table>
                        <thead>
                            <tr>
                                <th>Nome do aluno</th>
                                <th>T�tulo</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                ResultSet rs = makeQuery(String.format("SELECT * FROM Submissao"));
                                
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
                                    
                                    out.println(String.format("<a href=\"profSubOrient.jsp?requestEditEmail=%s\" class=\"a\"><button class=\"btnAcoes\"  style=\"padding: 10px 15px\">Abrir</button></a>", rs.getArray("Email")));
                                    out.println(String.format("</div> </td> </tr>"));
                                }
                            %>
                        </tbody>
                    </table>   
                </div>
            </div>
        </section>
        <%@include file="../rodapeInicial.jsp"%>

