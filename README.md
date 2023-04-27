# Cadeira-Facil
Sistema similar ao EasyChair, desenvolvido para a disciplina de Desenvolvimento de Software (2022/2).



Dicas de como executar o projeto:
- Após baixá-lo aqui do git, abra o projeto no NetBeans, selecione o browser de sua preferência e execute o projeto.
- Se alguém não tiver o NetBeans e quiser executar o projeto no vscode, será necessário instalar a extensão para JSP no vscode.
- Link para a extensão: https://marketplace.visualstudio.com/items?itemName=pthorsson.vscode-jsp
- Essa extensão não está mais sendo mantida, por isso aconselho fortemente que tentem executar o projeto pelo NetBeans.


Downloads necessários:
Java 17: https://download.oracle.com/java/17/latest/jdk-17_windows-x64_bin.exe
Netbeans 17: https://dlcdn.apache.org/netbeans/netbeans-installers/17/Apache-NetBeans-17-bin-windows-x64.exe
PostgreeSql 15 (instalar pgAdmin): https://get.enterprisedb.com/postgresql/postgresql-15.2-2-windows-x64.exe
Glassfish 7: https://download.eclipse.org/ee4j/glassfish/glassfish-7.0.3.zip


Configurações depois das instalações dos programas:
- Depois de abrir o projeto no Netbeans, ir na aba Services, adicionar um servidor Glassfish na parte "Servers" e colocar o diretório do zip extraído.
- Criar uma conexão com o banco em "Databases" depois "New connection...", selecionar PostegreSQL e colocar as informações da instalação do PostgreSQL.
- Criar um banco em "Databases" com nome DS, utilizar o "Query Tool" no banco criado e executar o sql contido no repositório.
