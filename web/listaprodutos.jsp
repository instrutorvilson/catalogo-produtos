<%-- 
    Document   : listaprodutos.jsp
    Created on : 01/02/2021, 10:02:10
    Author     : entra21
--%>

<%@page import="java.util.List"%>
<%@page import="dao.ProdutoDAO"%>
<%@page import="entidades.Produto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de produtos</title>
        <style>
            * {
                box-sizing: border-box;
            }
            .container{
                width: 98%;
                margin: auto;
                padding: 10px;
                border: red solid 1px;
                display: flex;                
            }
            
            .card{
                width: 100px;
                border: silver solid 1px; 
                margin-left: 10px;
                padding: 5px;
                
            }
            
            label{
                font-weight: 700;
            }
            
            .name{
                color: blue;                
            }
            .price{
                color:red;
                
            }
            
            img{
                width: 100% 
                
            }
        </style>
    </head>
    <body>
        <%
          List<Produto> lista = ProdutoDAO.findAll();
        %>
        
         <div class="container">
           <%for(Produto p : lista){%>
             <div class="card">
                 <img src="imagens/<%out.write(p.getImgUrl());%>" alt="<%out.write(p.getName());%>" />
                 <span>Nome:</span><label class="name"> <%out.write(p.getName());%></label>
                 <span>Preço: </span><Label class="price"> <%out.write(String.valueOf(p.getPrice()));%></label>                
            </div>
            <%}%> 
        </div>
    </body>
</html>
