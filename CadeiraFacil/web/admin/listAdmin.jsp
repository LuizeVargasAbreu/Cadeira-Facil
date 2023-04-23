<%@include file="cabecalhoAdmin.jsp"%>
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
                            <tr class="trHover">
                                <td>Lisane Brisolara de Brisolara</td>
                                <td>Professor</td>
                                <td style="background-color: white">
                                    <div class="btn-groupA">
                                        <a href="editarUsuario.jsp" class="a">
                                            <button class="btnAcoes"  style="padding: 10px 15px">Editar</button>
                                        </a>
                                        <a href="excluirUsuario.jsp" class="a">
                                            <button class="btnAcoes"  style="padding: 10px 12px">Excluir</button>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                            <tr class="trHover">
                                <td>Larissa Astrogildo de Freitas</td>
                                <td>Professor, Organizador</td>
                                <td style="background-color: white">
                                    <div class="btn-groupA">
                                        <a href="editarUsuario.jsp" class="a">
                                            <button class="btnAcoes"  style="padding: 10px 15px">Editar</button>
                                        </a>
                                        <a href="excluirUsuario.jsp" class="a">
                                            <button class="btnAcoes"  style="padding: 10px 12px">Excluir</button>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                            <tr class="trHover">
                                <td>Luize Vargas Abreu</td>
                                <td>Aluno</td>
                                <td style="background-color: white">
                                    <div class="btn-groupA">
                                        <a href="editarUsuario.jsp" class="a">
                                            <button class="btnAcoes"  style="padding: 10px 15px">Editar</button>
                                        </a>
                                        <a href="excluirUsuario.jsp" class="a">
                                            <button class="btnAcoes"  style="padding: 10px 12px">Excluir</button>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                            <tr class="trHover">
                                <td>Thalia Djune Costa Longaray</td>
                                <td>Aluno</td>
                                <td style="background-color: white">
                                    <div class="btn-groupA">
                                        <a href="editarUsuario.jsp" class="a">
                                            <button class="btnAcoes"  style="padding: 10px 15px">Editar</button>
                                        </a>
                                        <a href="excluirUsuario.jsp" class="a">
                                            <button class="btnAcoes"  style="padding: 10px 12px">Excluir</button>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>   
                </div>
            </div>
        </section>
        <%@include file="../rodapeInicial.jsp"%>

