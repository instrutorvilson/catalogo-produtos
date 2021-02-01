/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entidades.Produto;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import utils.Conexao;

/**
 *
 * @author entra21
 */
public class ProdutoDAO {
    public static boolean insert(Produto produto) throws Exception{
        String sql = "insert into products(name, price, description, imgUrl)values(?,?,?,?)";
        PreparedStatement stm;
        try {
            stm = Conexao.getConexao().prepareStatement(sql);
            stm.setString(1, produto.getName());
            stm.setFloat(2, produto.getPrice());
            stm.setString(3, produto.getDescription());
            stm.setString(4, produto.getImgUrl());
            stm.execute();
        } catch (Exception ex) {
            throw new Exception("Erro ao inserir produto: " + ex.getMessage());
        }       
        return true;
    }
    
    public static Produto findById (int id){
       
        return null;
    }
    
    public static List<Produto> findAll() throws Exception{
        String sql = "select * from products";
        List<Produto> lista = new ArrayList<>();
        try {
            PreparedStatement stm = Conexao.getConexao().prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
              lista.add(new Produto(rs.getInt("id"), 
                                    rs.getString("name"),
                                    rs.getFloat("price"),
                                    rs.getString("description"),
                                    rs.getString("imgUrl")));
            }
        } catch (Exception ex) {
            throw new Exception("Erro ao consultar produto: " + ex.getMessage());
        }
        return lista;
    }
    
    public static boolean delete(int id){
        return true;
    }
    
    public static boolean update(Produto produto){
        return true;
    }
}
