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

<%
    String msg="";
    
    if(request.getParameter("txtNome")== null || request.getParameter("txtMatricula") == null 
        || request.getParameter("txtEmail") == null || request.getParameter("txtSenha") == null 
        || request.getParameter("papelUsuario") == null)
    {
        response.sendRedirect("listAdmin.jsp");
    }
    else
    {
        
        String nome = request.getParameter("txtNome");
        String matricula = request.getParameter("txtMatricula");
        String email = request.getParameter("txtEmail");
        String senha = request.getParameter("txtSenha");
        String papel = request.getParameter("papelUsuario");
        
       try
        {
            msg = "Usuário cadastrado com sucesso!";
            String papelStr = "";
        
            if (papel.equals("administrador"))
                papelStr = "{true,false,false,false}";
            else if (papel.equals("organizador"))
                papelStr = "{false,true,false,false}";
            else if (papel.equals("professor"))
                papelStr = "{false,false,true,false}";
            else
                papelStr = "{false,false,false,true}";
            
            makeQuery(String.format("INSERT INTO Usuario VALUES ('%s','%s','%s','%s','%s', %d)", matricula, nome, email, senha, papelStr, 0));
        }
        catch(Exception ex)
        {
            msg = "Erro ao cadastrar usuário.";
        }
        
    }
    
        String nome = request.getParameter("txtNome");
        String matricula = request.getParameter("txtMatricula");
        String email = request.getParameter("txtEmail");
        String senha = request.getParameter("txtSenha");
        String papel = request.getParameter("papelUsuario");
%>
<!-- The Modal -->
<div id="myModal" class="modal" style="display: block">
    <!-- Modal content -->
    <div class="modal-content">
        <a href="listAdmin.jsp" class="a">
            <span class="close" onclick="fecharModal()">&times;</span>
        </a>
        <div class="infosModal">
            <div class="centro">
                <b><%=msg%></b>
            </div><br><br>
            <b>Nome:</b> <%=nome%><br><br>
            <b>Matrícula/SIAPE:</b> <%=matricula%><br><br>
            <b>E-mail:</b> <%=email%><br><br>
            <b>Papel:</b> <%=papel%><br><br>
        </div>
    </div>
</div>

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
                    <h3>Cadastrar usuário</h3>
                    <div class="divCadastro">
                        <form action="cadastrar-ok.jsp" method="post">
                            <div class="mdl-cell--12-col">
                                <label for="txtNome">Nome:</label>
                                <input type="text" name="txtNome" value="<%=nome%>">

                                <label for="txtMatricula">Matrícula/SIAPE:</label>
                                <input type="text" name="txtMatricula" value="<%=matricula%>">

                                <label for="txtEmail">E-mail:</label>
                                <input type="email" name="txtEmail" value="<%=email%>">

                                <label for="txtSenha">Senha:</label>
                                <input type="text" name="txtSenha" value="<%=senha%>">

                                <label for="papelUsuario">Papel:</label>
                                <br>
                                <select name="papelUsuario" selected value="<%=papel%>">  <!-- ARRUMAR PARA QUE FIQUE SELECIONADO O PAPEL ATUAL -->
                                    <option value="administrador">Administrador</option>
                                    <option value="professor">Professor</option>
                                    <option value="organizador">Organizador</option>
                                    <option value="aluno">Aluno</option>
                                </select>
                            </div>
                            <div class="btn-groupA" style="float: right; margin-right: 1%">
                                <button type="submit" class="btnAcoes"  style="padding: 25px 25px">Confirmar</button>
                                <button type="reset" class="btnAcoes"  style="padding: 25px 25px">Cancelar</button>
                            </div>
                        </form>                    
                    </div>
                </div>
            </div>
        </section>
<%@include file="../rodapeInicial.jsp"%>