<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="Clase.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="css/cssmaster.css" />
        <title>Producto</title>
         <script type="text/javascript">
            history.forward();
        </script>
           <div align="center"><img src="ImagenWorldRealGames/WRGrosa.jpg" width="15%"></div>
    </head>

    <body>
        <h1 align="center">
            <%
                if(request.getParameter("mens")!=null){
                    out.println(request.getParameter("mens"));
                }
            %>
        </h1><br>
        
        <%
            String codigo = (String)session.getAttribute("parametroCodigo");
            
            Usuario usu = Usuario_DB.listarUsuarioPorCodigo(codigo);
            String cliente = usu.getNombreUsuario() + ", " + usu.getApellidosUsuario();
        %>
        
        <header id="main-header">

            <a id="logo-header" href="index.jsp">
                <span class="site-name">World Real Games</span>
			<span class="site-desc">Siempre con la calidad de nuestros productos</span>
                       <form action="Servlet_Usu" method="post" id="frmCabecera">
                <input type="hidden" value="<%=usu.getTipoUsuario()%>" name="txtTipo" id="txtTipo">
                <center><h3>BIENVENIDO : <%=usu.getNombreUsuario()%> <%=usu.getApellidosUsuario()%></h3></center>
		</a> <!-- / #logo-header -->
                
		<nav>
			<ul>
                            <li><a href="Catalogo.jsp">Inicio</a></li>
                            
                            <li><a href="MiPerfil.jsp?codigoU=<%=usu.getCodigoUsuario() %>" class="link" id="lnkPerfil">Mi cuenta</a></li>
                            <li> <a href="CuentaAdministrador.jsp" class="link" id="lnkAdm">Administrar</a></li>
                            <li><a href="index.jsp" class="link" id="lnkLogout">Salir</a></li>
			</ul>
		</nav><!-- / nav -->
                
        </form>                
</header><!-- / #main-header -->
        <form id="frmMostrarCabeceraMP">
            <table id="tablaMostrarCabeceraMP">
                <tr>
                    <th style="color:#000000">
                        <h1> Inhabilitar marca de producto </h1>
                    </th>
                </tr>
                <tr>
                    <td>
                        <a href="CuentaAdministrador.jsp" class="link"><h4> P&aacute;gina principal </h4></a>
                    </td>
                </tr>
            </table>
        </form>
        
        <hr>
        
        <form id="frmMostrarCuerpoMP">
            <table id="tablaMostrarCuerpoMP">
                
                <tr>
                    <th class="Titulo">
                        C&Oacute;DIGO
                    </th>
                    <th class="Titulo">
                        NOMBRE
                    </th>
                    <th class="Titulo">
                        ESTADO
                    </th>
                    <th colspan="2" class="Titulo">
                        OPCI&Oacute;N
                    </th>
                </tr>
                
                <%
                    ArrayList<MarcaP> lista = MarcaP_DB.obtenerMPHabilitados();
                    for(int i=0; i<lista.size(); i++){
                        MarcaP MP = lista.get(i);
                %>

                <tr>
                    <td>
                        <%=MP.getCodigoMP() %>
                    </td>
                    <td>
                        <%=MP.getNombreMP() %>
                    </td>
                    <td>
                        <%=MP.getEstadoMP() %>
                    </td>
                    
                    <td class="Opcion">
                        <input  type="button" name="btnEliminar" id="btnEliminar" class="button" value="Inhabilitar" onclick="location.href='Servlet_MP?codigoMP=<%=MP.getCodigoMP() %>&&accion=eliminar'">
                    </td>
                </tr>
                
                <%
                    }
                %>

            </table>
        </form>
    </body>
    
</html>
