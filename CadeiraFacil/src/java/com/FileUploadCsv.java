package com;

import java.io.IOException;
 
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.Collection;
 
@WebServlet("/FileUploadCsv")
@MultipartConfig(fileSizeThreshold=1024*1024*1, 	// 1 MB 
                 maxFileSize=1024*1024*1,               // 1 MB
                 maxRequestSize=1024*1024*1)            // 1 MB
public class FileUploadCsv extends HttpServlet {
     
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String anoSemestre = request.getParameter("anoSemestre");
        String organizador = request.getParameter("organizador");
        
        DBConn.makeQuery(String.format("INSERT INTO Turma VALUES ('%s', '{null,null}', '{null,null}', '%s')", anoSemestre, organizador));
        
        Part part = request.getPart("csvAlunos");
        InputStreamReader isr = new InputStreamReader(part.getInputStream());
        
        try (BufferedReader reader = new BufferedReader(isr)) {
            while(reader.ready()) {
                String line = reader.readLine();
                String[] result = line.split(",");
                
                if (result.length == 3) {
                    DBConn.makeQuery(String.format("INSERT INTO Usuario VALUES ('%s','%s','%s','1234','{false,false,false,true}', 0)", result[0], result[1], result[2]));
                    DBConn.makeQuery(String.format("INSERT INTO Aluno_Turma VALUES ('%s','%s')", anoSemestre, result[2]));
                }
            }
        }
        
        response.sendRedirect("organizador/orgTurmas.jsp");
    }
}