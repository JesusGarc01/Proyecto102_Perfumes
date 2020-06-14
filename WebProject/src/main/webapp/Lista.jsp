<%-- 
    Document   : Lista
    Created on : 11 jun. 2020, 15:39:34
    Author     : jgjes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"
        
        import="java.sql.Connection"
        import="java.sql.DriverManager"
        import="java.sql.ResultSet"
        import="java.sql.Statement"
        import="java.sql.SQLException"
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link rel="stylesheet" href="./style.css">
    </head>
    
    <body style="background-color:#373030;">  
    <body>
        <header>
			<nav id="navegacion">
				<ul>
                                        <li><a href="index.html">Inicio</a></li>
					<li><a href="Lista.jsp">Lista</a></li>
					

				</ul>
			</nav>
		</header>
        
        <% 
            String marc = request.getParameter("Marca");
            String Modelo = request.getParameter("Modelo");
            String Genero = request.getParameter("Genero");
            String Contenido = request.getParameter("Contenido");
            String Ingredientes = request.getParameter("Ingredientes");
            String Pais = request.getParameter("Pais");
            String FamiliaO = request.getParameter("FamiliaO");
        %>
        
        <table>
            <tr>
                <td align="right"> Marca: </td>
                <td> <%out.println(marc); %> </td>
            </tr>
            <tr>
                <td align="right"> Modelo: </td>
                <td> <%= Modelo %> </td>
            </tr>
            <tr>
                <td align="right"> Genero: </td>
                <td> <%= Genero %> </td>
            </tr>
            
            <tr>
                <td align="right"> Contenido: </td>
                <td> <%= Contenido %> </td>
            </tr>
            <tr>
                <td align="right"> Ingredientes: </td>
                <td> <%= Ingredientes %> </td>
            </tr>
            <tr>
                <td align="right"> Pais de origen: </td>
                <td> <%= Pais %> </td>
            </tr>
            </tr>
            
            <tr>
                <td align="right"> Familia olfativa: </td>
                <td> <%= FamiliaO %> </td>
            </tr>
            </tr>

        </table>

        
        <%
                   Connection conex = null;
                   Statement sql = null;
                   try{
                       Class.forName("com.mysql.jdbc.Driver");
                       conex = (Connection)DriverManager.getConnection("jdbc:mysql://127.0.0.1/perfumes","root","root");
                       sql = conex.createStatement();
                       
                       out.print("Conexión establecida");
                       
                       ResultSet data = sql.executeQuery("select * from perfume");
                       while(data.next())
                       {
                       
                            System.out.print(data.getInt("Id"));

                            System.out.print(data.getString("Marca"));

                            System.out.print(data.getString("Modelo"));

                            out.print(data.getString("Genero"));

                            out.print(data.getString("Contenido"));

                            out.print(data.getString("Ingredientes"));

                            out.print(data.getString("Pais_Origen"));

                            out.print(data.getString("Familia_Olfativa"));
                            
                       
                        }
                       data.close();
                       
                   }
                   catch(Exception e)
                   {
                       out.print("Error en la conexión");
                       e.printStackTrace();
                   }

            %>
        
        <footer id="piePagina">
		<h3>Contacto:</h3>
		<p>Redes sociales:</p>
		<a href="https://twitter.com/oracle_mx">-Twitter</a>
                <br>
		<a href="https://www.facebook.com/oraclelatinoamerica/">-Facebook</a>
		<br><br>
		
                <p>Descargas:</p>
                <a href="https://dev.mysql.com/downloads/workbench/">-Apache NetBeans</a>
                <br>
                <a href="https://dev.mysql.com/downloads/mysql/">-MySQL Workbench</a>
                
                
	</footer>
        
        <footer id="n31">
            <br>
            <h3>
                Proyecto
                <br>
                Creditos:
                 <br>
                -Garcia Cardoso Jesus Guillermo
            </h3> 
        </footer>
            
    </body>
</html>
