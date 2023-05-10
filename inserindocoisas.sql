SELECT * FROM Usuario

INSERT INTO Usuario
	VALUES ('1111', 'Lisane Brisolara de Brisolara', 'lisane@inf.ufpel.edu.br', '456', '{f,f,t,f}', 2);	
INSERT INTO Usuario
	VALUES ('2222', 'Larissa Atrogildo de Freitas', 'larissa@inf.ufpel.edu.br', '456', '{f,t,t,f}', 1);	
INSERT INTO Usuario
	VALUES ('3333', 'Rafael Torchelsen', 'toto@inf.ufpel.edu.br', '456', '{f,f,t,f}', 2);	
INSERT INTO Usuario
	VALUES ('4444', 'Guilherme Netto ', 'neto@inf.ufpel.edu.br', '456', '{f,f,t,f}', 2);
INSERT INTO Usuario
	VALUES ('1234', 'Yago Martins', 'ymartins@inf.ufpel.edu.br', '123', '{f,f,f,t}', 3);

SELECT * FROM Aluno_Turma

INSERT INTO Aluno_Turma
	VALUES ('2022/1', 'lvabreu@inf.ufpel.edu.br');
INSERT INTO Aluno_Turma
	VALUES ('2022/2', 'ymartins@inf.ufpel.edu.br');
INSERT INTO Aluno_Turma
	VALUES ('2022/1', 'atralberoni@inf.ufpel.edu.br');
	
SELECT * FROM Revisao

INSERT INTO Revisao
	VALUES('{3,3,3,1,2}', '{achei bom, achei bom, achei bom, achei bom}', '10/10/2022', false, 'lisane@inf.ufpel.edu.br', '2022/2', 'lvabreu@inf.ufpel.edu.br');
INSERT INTO Revisao
	VALUES('{1,2,3,1,2}', '{achei ruim, achei medio, achei bom, achei insuficiente}', '10/10/2022', false, 'toto@gmail.com', '2022/2', 'ymartins@inf.ufpel.edu.br');

SELECT * FROM Revisor_Submissao

INSERT INTO Revisor_Submissao
    VALUES('larissa@inf.ufpel.edu.br', '2022/1', 'viniciuscruz@inf.ufpel.edu.br');
INSERT INTO Revisor_Submissao
    VALUES('toto@gmail.com', '2022/2', 'ymartins@inf.ufpel.edu.br');
INSERT INTO Revisor_Submissao
	VALUES('Neto@inf.ufpel.edu.br', '2022/1', 'atralberoni@inf.ufpel.edu.br');
  
SELECT * FROM Submissao

INSERT INTO Submissao
	VALUES ('Testando a Submissao do Projeto de DS', '', 'APROVADA', 
			'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 
			'27/04/2023', 'TestandoSubmissao_ViniciusCruz.pdf', '', 'toto@gmail.com', '2022/1', 'viniciuscruz@inf.ufpel.edu.br');
INSERT INTO Submissao
	VALUES ('teste 2',' ' , 'APROVADA','inteligencia artificial para melhoria em jogos ','12/05/2023' , 'Tcc_1_Yago.pdf', '', 'larissa@inf.ufpel.edu.br', '2022/2', 'ymartins@inf.ufpel.edu.br');

SELECT * FROM Turma	

INSERT INTO Turma
	VALUES('2021/1', '{1/12/2042, 2/12/2042}', '{10/3/2043, 20/3/2043}', '{10/12/2042, 15/12/2042}', '{10/4/2043, 15/4/2043}', 'larissa@inf.ufpel.edu.br');
INSERT INTO Turma
	VALUES('2022/2', '{12/6/2023, 15/7/2023}', '{25/7/2023, 31/8/2023}', '{15/7/2023/, 23/07/2023/}', '{31/8/2023/, 9/9/2023}', 'larissa@inf.ufpel.edu.br');
   