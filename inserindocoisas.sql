SELECT * FROM Usuario
SELECT * FROM Aluno_Turma
SELECT * FROM Revisao
SELECT * FROM Revisor_Submissao
SELECT * FROM Submissao
SELECT * FROM Turma

INSERT INTO Usuario
	VALUES ('1111', 'Lisane Brisolara de Brisolara', 'lisane@inf.ufpel.edu.br', '456', '{f,f,t,f}', 2)
INSERT INTO Usuario
	VALUES ('2222', 'Larissa Atrogildo de Freitas', 'larissa@inf.ufpel.edu.br', '456', '{f,t,t,f}', 1)
	
INSERT INTO Submissao
	VALUES ('Testando a Submissao do Projeto de DS', '', 'APROVADA', 
			'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 
			'27/04/2023/', 'TestandoSubmissao_ViniciusCruz.pdf', '', 'toto@gmail.com', '2022/1', 'viniciuscruz@inf.ufpel.edu.br')

INSERT INTO Aluno_Turma
	VALUES ('2022/2', 'lvabreu@inf.ufpel.edu.br')


