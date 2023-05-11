<%
    String sessionLogin = (String) session.getAttribute("usuarioAdmin");
    if (sessionLogin == null) {
        throw new ServletException("Invalid Login");
    }

    Boolean[] sessionPapeis = (Boolean[]) session.getAttribute("usuarioPapeis");
    if (!sessionPapeis[3]) {
        throw new ServletException("Aluno Only");
    }

    String sessionNome = (String) session.getAttribute("usuarioNome");
    String turmaAno = request.getParameter("turmaAno");
%>

<%@include file="cabecalhoAluno.jsp"%>
<%@include file="../DBConn.jsp"%>

<style>
    .accordion {
        background-color: #eee;
        color: #888;
        cursor: pointer;
        padding: 5px 20px;
        width: 100%;
        border: none;
        text-align: left;
        outline: none;
        font-size: 20px;
        transition: 0.4s;
    }

    .active, .accordion:hover {
        background-color: #ccc;
    }

    .panel {
        padding: 0 18px;
        display: none;
        background-color: white;
        overflow: hidden;
    }
</style>

<div class="btn-groupA" style="margin: 3% 0 0 68%">
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
    <a href="alunoRevisoes.jsp?turmaAno=<% out.print(turmaAno); %>" class="a">
        <button class="btnCabecalho" style="padding: 25px 50px">Voltar</button>
    </a>
</div>
</div>
</header>
<main class="mdl-layout__content">
    <div class="mdl-layout__tab-panel is-active" id="overview">
        <section class="mdl-grid mdl-grid--no-spacing">
            <div class="mdl-card mdl-cell mdl-cell--12-col">
                <div class="mdl-card__supporting-text" style="margin: -30px 40px 40px 20px">
                    <h3>Revisão</h3>
                    <%
                        ResultSet rs = makeQuery(String.format("SELECT * FROM Revisao WHERE fk_Aluno_Email='%s' AND fk_turma_anosemestre='%s'", sessionLogin, turmaAno));

                        if (rs != null && rs.next()) {

                            ResultSet rs2 = makeQuery(String.format("SELECT Nome FROM Usuario WHERE Email='%s'", rs.getString("fk_revisor_email")));

                            if (rs2 != null && rs2.next()) {

                                Integer[] notas = (Integer[])rs.getArray("CriteriosObjetivos").getArray();
                                String[] notasDiss = (String[])rs.getArray("CriteriosDissertivos").getArray();
                                String avaliacao = "Reprovado";
                                    
                                int ii;
                                for (ii = 0; ii < 5; ++ii)
                                    if (notas[ii] < 3)
                                        break;
                                            
                                if (ii == 5)
                                    avaliacao = "Aprovado";
                                    
                                out.println(String.format("<label for=\"professorRevisor\">Professor Revisor</label><br>"));
                                out.println(String.format("<input class=\"trHover\" type=\"text\" name=\"professorRevisor\" value=\"%s\" readonly>", rs2.getString("Nome")));    
                                out.print("<br><br>");    
                                
                                out.print(String.format("<label>Critérios Objetivos</label><br>"));
                                out.print(String.format("<button class=\"accordion\">Expandir</button><div class=\"panel\">"));
                                
                                out.print(String.format("<table><tr><th style=\"font-size: 25px; padding: 10px 15px; border: 5px solid #D9D9D9; width: 30cm; background-color: white; font-size: 20px\">Apresentação e consistência</th><td style=\"border: 5px solid #D9D9D9; text-align: center; background-color: white; font-size: 20px\">%d</td></tr>", notas[0]));
                                out.print(String.format("<tr><th style=\"font-size: 25px; padding: 10px 15px; border: 5px solid #D9D9D9; width: 30cm; background-color: white; font-size: 20px\">Relevância e contribuição</th><td style=\"border: 5px solid #D9D9D9; text-align: center; background-color: white; font-size: 20px\">%d</td></tr>", notas[1]));
                                out.print(String.format("<tr><th style=\"font-size: 25px; padding: 10px 15px; border: 5px solid #D9D9D9; width: 30cm; background-color: white; font-size: 20px\">Metodologia</th><td style=\"border: 5px solid #D9D9D9; text-align: center; background-color: white; font-size: 20px\">%d</td></tr>", notas[2]));
                                out.print(String.format("<tr><th style=\"font-size: 25px; padding: 10px 15px; border: 5px solid #D9D9D9; width: 30cm; background-color: white; font-size: 20px\">Adequação ao curso</th><td style=\"border: 5px solid #D9D9D9; text-align: center; background-color: white; font-size: 20px\">%d</td></tr>", notas[3]));
                                out.print(String.format("<tr><th style=\"font-size: 25px; padding: 10px 15px; border: 5px solid #D9D9D9; width: 30cm; background-color: white; font-size: 20px\">Plano de trabalho a ser desenvolvido</th><td style=\"border: 5px solid #D9D9D9; text-align: center; background-color: white; font-size: 20px\">%d</td></tr>", notas[4]));
                                out.print("</table></div><br><br>");
                                
                                out.print(String.format("<label>Critérios Dissertativos</label><br>"));
                                out.print(String.format("<button class=\"accordion\">Expandir</button><div class=\"panel\">"));
                                
                                out.print(String.format("<table><tr><th style=\"font-size: 25px; padding: 10px 15px; border: 5px solid #D9D9D9; width: 15cm; background-color: white; font-size: 20px\">Resumo da proposta</th><td style=\"border: 5px solid #D9D9D9; text-align: center; background-color: white; font-size: 20px\">%s</td></tr>", notasDiss[0]));
                                out.print(String.format("<tr><th style=\"font-size: 25px; padding: 10px 15px; border: 5px solid #D9D9D9; width: 15cm; background-color: white; font-size: 20px\">Pontos fortes da proposta</th><td style=\"border: 5px solid #D9D9D9; text-align: center; background-color: white; font-size: 20px\">%s</td></tr>", notasDiss[1]));
                                out.print(String.format("<tr><th style=\"font-size: 25px; padding: 10px 15px; border: 5px solid #D9D9D9; width: 15cm; background-color: white; font-size: 20px\">Pontos fracos da proposta</th><td style=\"border: 5px solid #D9D9D9; text-align: center; background-color: white; font-size: 20px\">%s</td></tr>", notasDiss[2]));
                                out.print(String.format("<tr><th style=\"font-size: 25px; padding: 10px 15px; border: 5px solid #D9D9D9; width: 15cm; background-color: white; font-size: 20px\">Detalhamento da avaliação</th><td style=\"border: 5px solid #D9D9D9; text-align: center; background-color: white; font-size: 20px\">%s</td></tr>", notasDiss[3]));
                                out.print("</table></div><br><br>");
                                
                                out.println(String.format("<label for=\"avaliacao\">Avaliação Geral</label><br>"));
                                out.println(String.format("<input class=\"trHover\" type=\"text\" name=\"avaliacao\" value=\"%s\" readonly>", avaliacao));    
                                out.print("<br><br>");                                  
                            }
                        }
                    %>
                </div>
            </div>
        </section>
        <script>
            var acc = document.getElementsByClassName("accordion");
            var i;

            for (i = 0; i < acc.length; i++) {
                acc[i].addEventListener("click", function () {
                    this.classList.toggle("active");
                    var panel = this.nextElementSibling;
                    if (panel.style.display === "block") {
                        panel.style.display = "none";
                    } else {
                        panel.style.display = "block";
                    }
                });
            }
        </script>
        <%@include file="../rodapeInicial.jsp"%>
