/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package asg.daos;

import asg.dtos.ProductDTO;
import asg.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author phath
 */
public class ProductDAO {

    public ProductDAO() {
    }

    public void insert(ProductDTO product) throws SQLException, ClassNotFoundException {
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO tblProducts(productID,name,price,quantity,categoryID,status) "
                        + " VALUES(?,?,?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, product.getProductID());
                stm.setString(2, product.getProductName());
                stm.setFloat(3, Float.parseFloat(product.getProductPrice()));
                stm.setInt(4, Integer.parseInt(product.getProductQuantity()));
                stm.setString(5, product.getCategoryID());
                stm.setBoolean(6, Boolean.parseBoolean(product.getStatus()));
                stm.executeUpdate();
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    public List<ProductDTO> view(String status,String search, String categoryID) throws SQLException {
        List<ProductDTO> list = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT productID,name,price,quantity,categoryID,status"
                        + " FROM tblProducts "
                        + " WHERE status = ? AND categoryID LIKE ? AND name LIKE ?";
                stm = conn.prepareStatement(sql);
                stm.setBoolean(1, Boolean.parseBoolean(status));
                stm.setString(2, "%"+categoryID+"%");
                stm.setString(3, "%"+search+"%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String productName = rs.getString("name");
                    String productPrice = rs.getString("price");
                    String productQuantity = rs.getString("quantity");
                    categoryID=rs.getString("categoryID");
                    status = rs.getString("status");
                    if (list == null) {
                        list = new ArrayList<>();
                    }
                    list.add(new ProductDTO(productID, productName, productQuantity, productPrice, categoryID, status));
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public boolean delete(String productID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE tblProducts SET status='False'"
                        + " WHERE productID = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, productID);
                check = stm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean update(ProductDTO product) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE tblProducts SET name= ? , price= ? , quantity = ? , categoryID = ? , status = ? "
                        + " WHERE productID = ?";
                stm=conn.prepareStatement(sql);
                stm.setString(1, product.getProductName());
                stm.setFloat(2, Float.parseFloat(product.getProductPrice()));
                stm.setInt(3, Integer.parseInt(product.getProductQuantity()));
                stm.setString(4, product.getCategoryID());
                stm.setBoolean(5, Boolean.parseBoolean(product.getStatus()));
                stm.setString(6, product.getProductID());
                check=stm.executeUpdate() >0 ? true : false;
            }
        } catch (Exception e) {
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
}
