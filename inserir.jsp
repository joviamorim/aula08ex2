<html>
	<body>
		<a href="menu.jsp">Voltar ao menu</a><br>
	</body>
</html>
<%@ page import="java.sql.*" %>
<%
  String nome=request.getParameter("nome");
  String fone=request.getParameter("fone");
  String email=request.getParameter("email");
  String datanasc=request.getParameter("datanasc");
  try{
	//Definição driver jdbc para ligação com o banco. 
	//Em jsp deve ficar na pasta 'lib' do Tomcat.
        //Arquivo é chamado de mysql-connector-java-5.1.40-bin.jar.	
	Class.forName("com.mysql.jdbc.Driver");
	// Criação da variável conexão com os dados do servidor.
	Connection conexao = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/contato","root",""); //conectando com o banco
    //Comando SQL que, neste arquivo é para inserir tupla/registro.
	PreparedStatement inserir=conexao.prepareStatement("insert into amigos (nome, telefone, email, datanasc) values(?,?,?,?)");
	inserir.setString(1,nome); //variável associada ao primeiro ? 
	inserir.setString(2,fone); //variável associada ao segundo ?
	inserir.setString(3,email); //variável associada ao terceiro ?
	inserir.setString(4,datanasc);
	inserir.execute(); //execução do SQL que (insert)
	out.println("Contato Gravado!");
	inserir.close();
  //Analisando possível erro de driver	
  }catch (ClassNotFoundException erroClass){
	out.println("Class Driver não foi localizado, erro = "+erroClass);}
  //Analisando possível erro de database
  catch (SQLException e){
	out.println("Erro na conexão ao banco de dados. erro = "+e);
  }							
%>