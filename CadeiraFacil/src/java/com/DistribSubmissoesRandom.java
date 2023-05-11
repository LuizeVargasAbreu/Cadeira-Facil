package com;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.sql.*;
import java.io.IOException;
import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/DistribSubmissoesRandom")
public class DistribSubmissoesRandom extends HttpServlet {
    
    private int distribSubmissoes(List<Map.Entry<String, Integer>> v, Random gen, int revMaxCount) {
        int rand = gen.nextInt();
        if (rand < 0)
            rand = -rand;
        
        rand %= v.size();

        for (int i = rand, c = 0; c < v.size(); ++c, ++i) {
            if (i == v.size())
                i = 0;

            int value = v.get(i).getValue();
            if (value < revMaxCount) {
                v.get(i).setValue(value + 1);
                return i;
            }
        }

        return -1;
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String turmaAno = request.getParameter("turmaAno");
        
        // Apagar a distribuição feita anteriormente?
        DBConn.makeQuery(String.format("DELETE FROM revisor_submissao WHERE fk_turma_anosemestre='%s'", turmaAno));
        
        ResultSet rsc = DBConn.makeQuery(String.format("SELECT Email FROM Usuario WHERE Papeis[3]=true"));
        if (rsc != null) {
            
            List<Map.Entry<String, Integer>> v = new ArrayList<>();
            
            try {
                while (rsc.next()) {
                    v.add(new AbstractMap.SimpleEntry<>(rsc.getString("Email"), 0));
                }
            } catch (SQLException ex) {
                Logger.getLogger(DistribSubmissoesRandom.class.getName()).log(Level.SEVERE, null, ex);
            }

            if (!v.isEmpty()) {
                ResultSet rs = DBConn.makeQuery(String.format("SELECT * FROM Submissao WHERE fk_turma_anosemestre='%s'", turmaAno));
                if (rs != null) {
                    Random gen = new Random();
                    int revMaxCount = 1;
                    
                    try {
                        while (rs.next()) {
                            int id = distribSubmissoes(v, gen, revMaxCount);
                            if (id == -1) {
                                revMaxCount++;
                                
                                id = distribSubmissoes(v, gen, revMaxCount);
                                if (id == -1) {
                                    Logger.getLogger(DistribSubmissoesRandom.class.getName()).log(Level.SEVERE, null, "Error in DistribSubmissoes");
                                    break;
                                }
                            }
                            
                            DBConn.makeQuery(String.format("INSERT INTO revisor_submissao VALUES ('%s','%s','%s')", v.get(id).getKey(), turmaAno, rs.getString("fk_aluno_email")));
                        }
                    } catch (SQLException ex) {
                        Logger.getLogger(DistribSubmissoesRandom.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            }
        }
        
        response.sendRedirect(String.format("organizador/orgOpcoes.jsp?turmaAno=%s", turmaAno));
    }
}
