-- Turma 202202: No prazo para Submissão. [Para apresentar a Submissão]
-- Turma 202301: Após o prazo e com a Submissão feita. [Para apresentar a distribuição e a Revisão]
-- Turma 202302: No prazo para a Reesubmissão. [Para testar a Reesubmissão]
-- Turma 202401: Após o prazo e com a Reesubmissão feita. [Para testar novamente a Revisão]
-- 
-- Cria os usuários:

INSERT INTO Usuario
	VALUES ('0000', 'Admin', 'admin@inf.ufpel.edu.br', 'admin', '{t,t,f,f}', 2);	
INSERT INTO Usuario
	VALUES ('1111', 'Lisane Brisolara de Brisolara', 'lisane@inf.ufpel.edu.br', '456', '{f,f,t,f}', 2);	
INSERT INTO Usuario
	VALUES ('2222', 'Larissa Atrogildo de Freitas', 'larissa@inf.ufpel.edu.br', '456', '{f,t,t,f}', 1);	
INSERT INTO Usuario
	VALUES ('3333', 'Rafael Torchelsen', 'toto@inf.ufpel.edu.br', '456', '{f,f,t,f}', 2);
INSERT INTO Usuario
	VALUES ('4444', 'Guilherme Netto ', 'neto@inf.ufpel.edu.br', '456', '{f,f,t,f}', 2);
INSERT INTO Usuario
	VALUES ('5555', 'Alan Carlos', 'alan@inf.ufpel.edu.br', '456', '{f,f,t,f}', 2);
INSERT INTO Usuario
	VALUES ('6666', 'Andre Du Bois', 'andre@inf.ufpel.edu.br', '456', '{f,f,t,f}', 2);
INSERT INTO Usuario
	VALUES ('7777', 'Bruno Zatt', 'zatt@inf.ufpel.edu.br', '456', '{f,f,t,f}', 2);
INSERT INTO Usuario
	VALUES ('8888', 'Tatiana Aires', 'tatiana@inf.ufpel.edu.br', '456', '{f,f,t,f}', 2);
INSERT INTO Usuario
	VALUES ('9999', 'Ulisses Brisolara', 'ulisses@inf.ufpel.edu.br', '456', '{f,f,t,f}', 2);
INSERT INTO Usuario
	VALUES ('0001', 'Marcelo Porto', 'porto@inf.ufpel.edu.br', '456', '{f,f,t,f}', 2);
-- Turma 202202:
INSERT INTO Usuario
	VALUES ('1236', 'Aluno A', 'alunoa@inf.ufpel.edu.br', '123', '{f,f,f,t}', 3);
INSERT INTO Usuario
	VALUES ('1236', 'Aluno B', 'alunob@inf.ufpel.edu.br', '123', '{f,f,f,t}', 3);
INSERT INTO Usuario
	VALUES ('1236', 'Aluno C', 'alunoc@inf.ufpel.edu.br', '123', '{f,f,f,t}', 3);
INSERT INTO Usuario
	VALUES ('1236', 'Aluno D', 'alunod@inf.ufpel.edu.br', '123', '{f,f,f,t}', 3);
-- Turma 202301:
INSERT INTO Usuario
	VALUES ('1236', 'Aluno E', 'alunoe@inf.ufpel.edu.br', '123', '{f,f,f,t}', 3);
INSERT INTO Usuario
	VALUES ('1236', 'Aluno F', 'alunof@inf.ufpel.edu.br', '123', '{f,f,f,t}', 3);
INSERT INTO Usuario
	VALUES ('1236', 'Aluno G', 'alunog@inf.ufpel.edu.br', '123', '{f,f,f,t}', 3);
INSERT INTO Usuario
	VALUES ('1236', 'Aluno H', 'alunoh@inf.ufpel.edu.br', '123', '{f,f,f,t}', 3);
-- Turma 202302:
INSERT INTO Usuario
	VALUES ('1236', 'Aluno I', 'alunoi@inf.ufpel.edu.br', '123', '{f,f,f,t}', 3);
INSERT INTO Usuario
	VALUES ('1236', 'Aluno J', 'alunoj@inf.ufpel.edu.br', '123', '{f,f,f,t}', 3);
INSERT INTO Usuario
	VALUES ('1236', 'Aluno L', 'alunol@inf.ufpel.edu.br', '123', '{f,f,f,t}', 3);
INSERT INTO Usuario
	VALUES ('1236', 'Aluno M', 'alunom@inf.ufpel.edu.br', '123', '{f,f,f,t}', 3);
-- Turma 202401:
INSERT INTO Usuario
	VALUES ('1236', 'Aluno N', 'alunon@inf.ufpel.edu.br', '123', '{f,f,f,t}', 3);
INSERT INTO Usuario
	VALUES ('1236', 'Aluno O', 'alunoo@inf.ufpel.edu.br', '123', '{f,f,f,t}', 3);
INSERT INTO Usuario
	VALUES ('1236', 'Aluno P', 'alunop@inf.ufpel.edu.br', '123', '{f,f,f,t}', 3);
INSERT INTO Usuario
	VALUES ('1236', 'Aluno Q', 'alunoq@inf.ufpel.edu.br', '123', '{f,f,f,t}', 3);

-- Cria a Turma:

INSERT INTO Turma
	VALUES('202202', '{2023-05-09, 2023-05-30}', '{2023-05-09, 2023-05-30}', '{2023-05-09, 2023-05-30}', '{2023-05-09, 2023-05-30}', 'larissa@inf.ufpel.edu.br');
	
INSERT INTO Turma
	VALUES('202301', '{2023-05-05, 2023-05-05}', '{2023-05-05, 2023-05-05}', '{2023-05-05, 2023-05-05}', '{2023-05-05, 2023-05-05}', 'larissa@inf.ufpel.edu.br');
	
INSERT INTO Turma
	VALUES('202302', '{2023-05-05, 2023-05-05}', '{2023-05-05, 2023-05-05}', '{2023-05-09, 2023-05-30}', '{2023-05-09, 2023-05-30}', 'larissa@inf.ufpel.edu.br');
	
INSERT INTO Turma
	VALUES('202401', '{2023-05-05, 2023-05-05}', '{2023-05-05, 2023-05-05}', '{2023-05-09, 2023-05-30}', '{2023-05-09, 2023-05-30}', 'larissa@inf.ufpel.edu.br');
	
-- Define os alunos para as Turmas:

INSERT INTO Aluno_Turma
	VALUES ('202202', 'alunoa@inf.ufpel.edu.br');
INSERT INTO Aluno_Turma
	VALUES ('202202', 'alunob@inf.ufpel.edu.br');
INSERT INTO Aluno_Turma
	VALUES ('202202', 'alunoc@inf.ufpel.edu.br');
INSERT INTO Aluno_Turma
	VALUES ('202202', 'alunod@inf.ufpel.edu.br');

INSERT INTO Aluno_Turma
	VALUES ('202301', 'alunoe@inf.ufpel.edu.br');
INSERT INTO Aluno_Turma
	VALUES ('202301', 'alunof@inf.ufpel.edu.br');
INSERT INTO Aluno_Turma
	VALUES ('202301', 'alunog@inf.ufpel.edu.br');
INSERT INTO Aluno_Turma
	VALUES ('202301', 'alunoh@inf.ufpel.edu.br');

INSERT INTO Aluno_Turma
	VALUES ('202302', 'alunoi@inf.ufpel.edu.br');
INSERT INTO Aluno_Turma
	VALUES ('202302', 'alunoj@inf.ufpel.edu.br');
INSERT INTO Aluno_Turma
	VALUES ('202302', 'alunol@inf.ufpel.edu.br');
INSERT INTO Aluno_Turma
	VALUES ('202302', 'alunom@inf.ufpel.edu.br');
	
INSERT INTO Aluno_Turma
	VALUES ('202401', 'alunon@inf.ufpel.edu.br');
INSERT INTO Aluno_Turma
	VALUES ('202401', 'alunoo@inf.ufpel.edu.br');
INSERT INTO Aluno_Turma
	VALUES ('202401', 'alunop@inf.ufpel.edu.br');
INSERT INTO Aluno_Turma
	VALUES ('202401', 'alunoq@inf.ufpel.edu.br');
	
-- Cria as submissões:

INSERT INTO Submissao
	VALUES ('Testando a Submissao do Projeto de DS', '', 'wait', 
			'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 
			'10/05/2023', 'Submissao.pdf', '', 'toto@inf.ufpel.edu.br', '202301', 'alunoe@inf.ufpel.edu.br');
INSERT INTO Submissao
	VALUES ('Testando a Submissao do Projeto de DS', '', 'wait', 
			'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 
			'10/05/2023', 'Submissao.pdf', '', 'toto@inf.ufpel.edu.br', '202301', 'alunof@inf.ufpel.edu.br');
INSERT INTO Submissao
	VALUES ('Testando a Submissao do Projeto de DS', '', 'wait', 
			'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 
			'10/05/2023', 'Submissao.pdf', '', 'toto@inf.ufpel.edu.br', '202301', 'alunog@inf.ufpel.edu.br');
INSERT INTO Submissao
	VALUES ('Testando a Submissao do Projeto de DS', '', 'wait', 
			'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 
			'10/05/2023', 'Submissao.pdf', '', 'toto@inf.ufpel.edu.br', '202301', 'alunoh@inf.ufpel.edu.br');

INSERT INTO Submissao
	VALUES ('Testando a Submissao do Projeto de DS', '', 'repr', 
			'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 
			'10/05/2023', 'Submissao.pdf', '', 'toto@inf.ufpel.edu.br', '202302', 'alunoi@inf.ufpel.edu.br');
INSERT INTO Submissao
	VALUES ('Testando a Submissao do Projeto de DS', '', 'repr', 
			'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 
			'10/05/2023', 'Submissao.pdf', '', 'toto@inf.ufpel.edu.br', '202302', 'alunoj@inf.ufpel.edu.br');
INSERT INTO Submissao
	VALUES ('Testando a Submissao do Projeto de DS', '', 'repr', 
			'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 
			'10/05/2023', 'Submissao.pdf', '', 'toto@inf.ufpel.edu.br', '202302', 'alunol@inf.ufpel.edu.br');
INSERT INTO Submissao
	VALUES ('Testando a Submissao do Projeto de DS', '', 'repr', 
			'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 
			'10/05/2023', 'Submissao.pdf', '', 'toto@inf.ufpel.edu.br', '202302', 'alunom@inf.ufpel.edu.br');
			
INSERT INTO Submissao
	VALUES ('Testando a Submissao do Projeto de DS', '', 'wait', 
			'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 
			'10/05/2023', 'Submissao.pdf', 'Submissao2.pdf', 'toto@inf.ufpel.edu.br', '202401', 'alunon@inf.ufpel.edu.br');
INSERT INTO Submissao
	VALUES ('Testando a Submissao do Projeto de DS', '', 'wait', 
			'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 
			'10/05/2023', 'Submissao.pdf', 'Submissao2.pdf', 'toto@inf.ufpel.edu.br', '202401', 'alunoo@inf.ufpel.edu.br');
INSERT INTO Submissao
	VALUES ('Testando a Submissao do Projeto de DS', '', 'wait', 
			'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 
			'10/05/2023', 'Submissao.pdf', 'Submissao2.pdf', 'toto@inf.ufpel.edu.br', '202401', 'alunop@inf.ufpel.edu.br');
INSERT INTO Submissao
	VALUES ('Testando a Submissao do Projeto de DS', '', 'wait', 
			'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 
			'10/05/2023', 'Submissao.pdf', 'Submissao2.pdf', 'toto@inf.ufpel.edu.br', '202401', 'alunoq@inf.ufpel.edu.br');

-- Distribui para a Revisão:

INSERT INTO Revisor_Submissao VALUES('larissa@inf.ufpel.edu.br', '202302', 'alunoi@inf.ufpel.edu.br');
INSERT INTO Revisor_Submissao VALUES('toto@inf.ufpel.edu.br', '202302', 'alunoi@inf.ufpel.edu.br');
INSERT INTO Revisor_Submissao VALUES('neto@inf.ufpel.edu.br', '202302', 'alunoi@inf.ufpel.edu.br');
INSERT INTO Revisor_Submissao VALUES('alan@inf.ufpel.edu.br', '202302', 'alunoj@inf.ufpel.edu.br');
INSERT INTO Revisor_Submissao VALUES('tatiana@inf.ufpel.edu.br', '202302', 'alunoj@inf.ufpel.edu.br');
INSERT INTO Revisor_Submissao VALUES('ulisses@inf.ufpel.edu.br', '202302', 'alunol@inf.ufpel.edu.br');
INSERT INTO Revisor_Submissao VALUES('porto@inf.ufpel.edu.br', '202302', 'alunol@inf.ufpel.edu.br');
INSERT INTO Revisor_Submissao VALUES('lisane@inf.ufpel.edu.br', '202302', 'alunol@inf.ufpel.edu.br');
INSERT INTO Revisor_Submissao VALUES('toto@inf.ufpel.edu.br', '202302', 'alunol@inf.ufpel.edu.br');
INSERT INTO Revisor_Submissao VALUES('neto@inf.ufpel.edu.br', '202302', 'alunom@inf.ufpel.edu.br');
INSERT INTO Revisor_Submissao VALUES('alan@inf.ufpel.edu.br', '202302', 'alunom@inf.ufpel.edu.br');
INSERT INTO Revisor_Submissao VALUES('larissa@inf.ufpel.edu.br', '202302', 'alunom@inf.ufpel.edu.br');

INSERT INTO Revisor_Submissao VALUES('larissa@inf.ufpel.edu.br', '202401', 'alunon@inf.ufpel.edu.br');
INSERT INTO Revisor_Submissao VALUES('toto@inf.ufpel.edu.br', '202401', 'alunon@inf.ufpel.edu.br');
INSERT INTO Revisor_Submissao VALUES('neto@inf.ufpel.edu.br', '202401', 'alunon@inf.ufpel.edu.br');
INSERT INTO Revisor_Submissao VALUES('alan@inf.ufpel.edu.br', '202401', 'alunoo@inf.ufpel.edu.br');
INSERT INTO Revisor_Submissao VALUES('tatiana@inf.ufpel.edu.br', '202401', 'alunoo@inf.ufpel.edu.br');
INSERT INTO Revisor_Submissao VALUES('ulisses@inf.ufpel.edu.br', '202401', 'alunop@inf.ufpel.edu.br');
INSERT INTO Revisor_Submissao VALUES('porto@inf.ufpel.edu.br', '202401', 'alunop@inf.ufpel.edu.br');
INSERT INTO Revisor_Submissao VALUES('lisane@inf.ufpel.edu.br', '202401', 'alunop@inf.ufpel.edu.br');
INSERT INTO Revisor_Submissao VALUES('toto@inf.ufpel.edu.br', '202401', 'alunop@inf.ufpel.edu.br');
INSERT INTO Revisor_Submissao VALUES('neto@inf.ufpel.edu.br', '202401', 'alunoq@inf.ufpel.edu.br');
INSERT INTO Revisor_Submissao VALUES('alan@inf.ufpel.edu.br', '202401', 'alunoq@inf.ufpel.edu.br');
INSERT INTO Revisor_Submissao VALUES('larissa@inf.ufpel.edu.br', '202401', 'alunoq@inf.ufpel.edu.br');

INSERT INTO Revisao VALUES('{3,3,3,3,3}', '{achei bom, achei bom, achei bom, achei bom}', '10/10/2022', false, 'larissa@inf.ufpel.edu.br', '202302', 'alunoi@inf.ufpel.edu.br');
INSERT INTO Revisao VALUES('{3,3,3,3,3}', '{achei bom, achei bom, achei bom, achei bom}', '10/10/2022', false, 'toto@inf.ufpel.edu.br', '202302', 'alunoi@inf.ufpel.edu.br');
INSERT INTO Revisao VALUES('{3,3,3,3,3}', '{achei bom, achei bom, achei bom, achei bom}', '10/10/2022', false, 'neto@inf.ufpel.edu.br', '202302', 'alunoi@inf.ufpel.edu.br');
INSERT INTO Revisao VALUES('{3,3,3,1,2}', '{achei bom, achei bom, achei bom, achei bom}', '10/10/2022', false, 'alan@inf.ufpel.edu.br', '202302', 'alunoj@inf.ufpel.edu.br');
INSERT INTO Revisao VALUES('{3,3,3,1,2}', '{achei bom, achei bom, achei bom, achei bom}', '10/10/2022', false, 'tatiana@inf.ufpel.edu.br', '202302', 'alunoj@inf.ufpel.edu.br');
INSERT INTO Revisao VALUES('{3,3,3,1,2}', '{achei bom, achei bom, achei bom, achei bom}', '10/10/2022', false, 'ulisses@inf.ufpel.edu.br', '202302', 'alunol@inf.ufpel.edu.br');
INSERT INTO Revisao VALUES('{3,3,3,1,2}', '{achei bom, achei bom, achei bom, achei bom}', '10/10/2022', false, 'porto@inf.ufpel.edu.br', '202302', 'alunol@inf.ufpel.edu.br');
INSERT INTO Revisao VALUES('{3,3,3,1,2}', '{achei bom, achei bom, achei bom, achei bom}', '10/10/2022', false, 'lisane@inf.ufpel.edu.br', '202302', 'alunol@inf.ufpel.edu.br');
INSERT INTO Revisao VALUES('{3,3,3,1,2}', '{achei bom, achei bom, achei bom, achei bom}', '10/10/2022', false, 'toto@inf.ufpel.edu.br', '202302', 'alunol@inf.ufpel.edu.br');
INSERT INTO Revisao VALUES('{3,3,3,1,2}', '{achei bom, achei bom, achei bom, achei bom}', '10/10/2022', false, 'neto@inf.ufpel.edu.br', '202302', 'alunom@inf.ufpel.edu.br');
INSERT INTO Revisao VALUES('{3,3,3,1,2}', '{achei bom, achei bom, achei bom, achei bom}', '10/10/2022', false, 'alan@inf.ufpel.edu.br', '202302', 'alunom@inf.ufpel.edu.br');
INSERT INTO Revisao VALUES('{3,3,3,1,2}', '{achei bom, achei bom, achei bom, achei bom}', '10/10/2022', false, 'larissa@inf.ufpel.edu.br', '202302', 'alunom@inf.ufpel.edu.br');

INSERT INTO Revisao VALUES('{3,3,3,1,2}', '{achei bom, achei bom, achei bom, achei bom}', '10/10/2022', false, 'larissa@inf.ufpel.edu.br', '202401', 'alunon@inf.ufpel.edu.br');
INSERT INTO Revisao VALUES('{3,3,3,1,2}', '{achei bom, achei bom, achei bom, achei bom}', '10/10/2022', false, 'toto@inf.ufpel.edu.br', '202401', 'alunon@inf.ufpel.edu.br');
INSERT INTO Revisao VALUES('{3,3,3,1,2}', '{achei bom, achei bom, achei bom, achei bom}', '10/10/2022', false, 'neto@inf.ufpel.edu.br', '202401', 'alunon@inf.ufpel.edu.br');
INSERT INTO Revisao VALUES('{3,3,3,1,2}', '{achei bom, achei bom, achei bom, achei bom}', '10/10/2022', false, 'alan@inf.ufpel.edu.br', '202401', 'alunoo@inf.ufpel.edu.br');
INSERT INTO Revisao VALUES('{3,3,3,1,2}', '{achei bom, achei bom, achei bom, achei bom}', '10/10/2022', false, 'tatiana@inf.ufpel.edu.br', '202401', 'alunoo@inf.ufpel.edu.br');
INSERT INTO Revisao VALUES('{3,3,3,1,2}', '{achei bom, achei bom, achei bom, achei bom}', '10/10/2022', false, 'ulisses@inf.ufpel.edu.br', '202401', 'alunop@inf.ufpel.edu.br');
INSERT INTO Revisao VALUES('{3,3,3,1,2}', '{achei bom, achei bom, achei bom, achei bom}', '10/10/2022', false, 'porto@inf.ufpel.edu.br', '202401', 'alunop@inf.ufpel.edu.br');
INSERT INTO Revisao VALUES('{3,3,3,1,2}', '{achei bom, achei bom, achei bom, achei bom}', '10/10/2022', false, 'lisane@inf.ufpel.edu.br', '202401', 'alunop@inf.ufpel.edu.br');
INSERT INTO Revisao VALUES('{3,3,3,1,2}', '{achei bom, achei bom, achei bom, achei bom}', '10/10/2022', false, 'toto@inf.ufpel.edu.br', '202401', 'alunop@inf.ufpel.edu.br');
INSERT INTO Revisao VALUES('{3,3,3,1,2}', '{achei bom, achei bom, achei bom, achei bom}', '10/10/2022', false, 'neto@inf.ufpel.edu.br', '202401', 'alunoq@inf.ufpel.edu.br');
INSERT INTO Revisao VALUES('{3,3,3,1,2}', '{achei bom, achei bom, achei bom, achei bom}', '10/10/2022', false, 'alan@inf.ufpel.edu.br', '202401', 'alunoq@inf.ufpel.edu.br');
INSERT INTO Revisao VALUES('{3,3,3,1,2}', '{achei bom, achei bom, achei bom, achei bom}', '10/10/2022', false, 'larissa@inf.ufpel.edu.br', '202401', 'alunoq@inf.ufpel.edu.br');

