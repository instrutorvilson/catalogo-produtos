<%-- 
    Document   : cadastroproduto.jsp
    Created on : 01/02/2021, 08:33:14
    Author     : entra21
--%>

<%@page import="dao.ProdutoDAO"%>
<%@page import="entidades.Produto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de produto</title>
        <style>
            .container{
                width: 60%;
                margin-left: auto;
                margin-right: auto;
                padding: 10px;
                border: red solid 1px;                
            }
            .container-item{
                background-color: skyblue;
                padding: 20px;
            }

           input[type=file],  input[type=text], textarea{
                width: 100%;
            }
            input[type=button]{
                width: 200px;
                border-radius: 10px;
                padding: 5px;
                margin-top: 20px;
            }

            #msg{
                color: red;
                text-align: center;
                margin-left: auto;
                width: 60%;
                margin-right: auto;
                position: absolute;
                margin-top: 15px;
            }
            
            img{
                width: 100px;
                height: 100px;
                position: relative;
                right: 10px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Cadastro de produto</h1>
            <div class="container-item">
                <form action="cadastroproduto.jsp" method="POST">
                    <label for="name">Informe nome</label>
                    <input type="text" id="name" name="name" />
                    <label for="price">Informe preço</label>
                    <input type="text" id="price" name="price" />
                    <label for="description">Informe a descrição</label>
                    <textarea type="text" id="description" name="description"></textarea>
                    <label for="img">Informe a Imagem</label>
                    <input type="file" id="img" name="img" />
                                         
                    <input type="button" value="salvar" onclick="validaDados()"/>
                </form>                   
            </div>
        </div>
        <%
            String preco = request.getParameter("price");
            if (preco != null) {
                Produto prod = new Produto();
                prod.setName(request.getParameter("name"));
                prod.setPrice(Float.parseFloat(preco));
                prod.setDescription(request.getParameter("description"));
                prod.setImgUrl(request.getParameter("img"));
                if (ProdutoDAO.insert(prod)) {
                    out.write("<label id=msg>Cliente salvo com sucesso</label>");
                } else {
                    out.write("<label id=msg>Erro ao salvar cliente</label>");
                }
            }
        %>
        <script>
            function validaDados() {
                debugger;
                var name = document.getElementById("name");
                if (name.value === "") {
                    alert("Informe nome");
                    name.focus();
                    return;
                }
                var price = document.getElementById("price");
                if (price.value === "") {
                    alert("Informe preço");
                    price.focus();
                    return;
                }
                var description = document.getElementById("description");
                if (description.value === "") {
                    alert("Informe descrição");
                    description.focus();
                    return;
                }
                document.forms[0].submit();
            }
        </script>


    </body>
</html>
