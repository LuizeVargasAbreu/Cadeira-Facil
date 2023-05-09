package com;

import java.io.IOException;
 
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Date;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/FileUploadSubmissao")
@MultipartConfig(fileSizeThreshold=1024*1024*10, 	// 10 MB 
                 maxFileSize=1024*1024*10,              // 10 MB
                 maxRequestSize=1024*1024*10,           // 10 MB
                 location=FileUploadSubmissao.PATH_LOCATION)
public class FileUploadSubmissao extends HttpServlet {
     
    static public final String PATH_LOCATION = "C:\\DSUploads\\";
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String titulo = request.getParameter("titulo");
        String orientador = request.getParameter("orientador");
        String coorientador = request.getParameter("coorientador");
        String resumo = request.getParameter("resumo");
        String aluno = request.getParameter("aluno");
        String alunoNome = request.getParameter("alunoNome");
        String turmaAno = request.getParameter("turmaAno");
        
        if (request.getParameter("alterar").equals("1")) {
            if (request.getPart("arquivo").getSize() > 0) {
                ResultSet rs = DBConn.makeQuery(String.format("SELECT arquivo FROM Submissao WHERE fk_turma_anosemestre='%s' AND fk_aluno_email='%s'", turmaAno, aluno));

                try {
                    if (rs != null && rs.next()) {
                        Part part = request.getPart("arquivo");
                        part.write(turmaAno + "\\" + rs.getString("arquivo"));
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(FileUploadSubmissao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            
            DBConn.makeQuery(String.format("UPDATE Submissao SET Titulo='%s', Coorientador='%s', Resumo='%s' WHERE fk_turma_anosemestre='%s' AND fk_aluno_email='%s'",
                    titulo, coorientador, resumo, turmaAno, aluno));
        }
        else {
            String path = PATH_LOCATION;
            String turmaPath = turmaAno;

            File fileSaveDir = new File(path);
            if (!fileSaveDir.exists()) {
                fileSaveDir.mkdir();
            }

            File fileSaveDir2 = new File(path + turmaPath);
            if (!fileSaveDir2.exists()) {
                fileSaveDir2.mkdir();
            }

            String finalFileName = String.format("%s_Sub1_%d.pdf", alunoNome.split(" ")[0], new Date().getTime());

            Part part = request.getPart("arquivo");
            part.write(turmaPath + "\\" + finalFileName);

            DBConn.makeQuery(String.format("INSERT INTO Submissao VALUES ('%s','%s','wait','%s',NOW(),'%s','null','%s','%s','%s')",
                    titulo, coorientador, resumo, finalFileName, orientador, turmaAno, aluno));
        }
        
        response.sendRedirect(String.format("aluno/alunoSub.jsp?turmaAno=%s", turmaAno));
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String turmaAno = request.getParameter("turmaAno");
        
        String fileName = request.getParameter("fileName");
        if(fileName == null || fileName.equals("")){
            throw new ServletException("File Name can't be null or empty");
        }
        
        File file = new File(PATH_LOCATION + turmaAno + "\\" + fileName);
        if(!file.exists()){
            throw new ServletException("File doesn't exists on server.");
        }
        
        try (InputStream fis = new FileInputStream(file)) {
            response.setContentType("application/octet-stream");
            response.setContentLength((int)file.length());
            response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
            
            try (ServletOutputStream os = response.getOutputStream()) {
                byte[] bufferData = new byte[1024];
                int read;
                
                while((read = fis.read(bufferData))!= -1){
                    os.write(bufferData, 0, read);
                }
                
                os.flush();
            }
        }
    }
}