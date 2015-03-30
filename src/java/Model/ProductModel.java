/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Bean.Product;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author dattr_000
 */
public class ProductModel {
       public List<Product> getData() {
        List<Product> list = new ArrayList<Product>();
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection("jdbc:sqlserver://TIENDAT;databaseName=shopping", "sa", "123456");
            PreparedStatement statement = con.prepareStatement("SELECT * FROM product");
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {

                list.add(new Product(resultSet.getInt("id"), resultSet.getString("name"), resultSet.getFloat("price")));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Product getbyName(String name) {
        Product pro = null;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection("jdbc:sqlserver://TIENDAT;databaseName=shopping", "sa", "123456");
            PreparedStatement statement = con.prepareStatement("SELECT TOP 1 * FROM product where name = ?");
            statement.setString(1, name);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                pro = new Product(resultSet.getInt("id"), resultSet.getString("name"), resultSet.getFloat("price"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return pro;
    }
}
