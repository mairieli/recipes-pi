<%-- 
    Document   : head
    Created on : 29/10/2013, 15:52:23
    Author     : josimar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <meta charset="utf-8">
        <title>I'm Hungry - ${param.title}</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="SCP - Sistema de Controle pessoal, controle suas despesas mensais gratuitamente, relatórios com gráficos">
        <meta name="author" content="Josimar Loch">
        <!--<link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">-->
        <link href="css/bootstrap.css" rel="stylesheet"/>
              
         <link rel="shortcut icon" href="img/ico.ico">
        
        <!-- Le styleggggs -->

     
        <script type="text/javascript">
            
            function carregando(div_id,message){
                 document.getElementById(div_id).innerHTML = "<h4>"+message+"<img src='/loading.gif'/></h4>"; 
            }
        </script>

