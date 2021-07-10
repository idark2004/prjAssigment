/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package asg.utils;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;

/**
 *
 * @author phath
 */
public class DBSupport {

    public int getAll(String id, String tblName) throws SQLException, ClassNotFoundException {
        int rows = 0;
        Connection conn = null;
        CallableStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String procedure;
                procedure = "{call countAllRows(?,?,?)}";
                stm = conn.prepareCall(procedure);
                stm.setString(1, id);
                stm.setString(2, tblName);
                stm.registerOutParameter(3, Types.INTEGER);
                stm.execute();
                rows = stm.getInt(3);
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return rows;
    }

    public int getActive(String id, String tblName) throws SQLException, ClassNotFoundException {
        int rows = 0;
        Connection conn = null;
        CallableStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String procedure;
                procedure = "{call countActive(?,?,?)}";
                stm = conn.prepareCall(procedure);
                stm.setString(1, id);
                stm.setString(2, tblName);
                stm.registerOutParameter(3, Types.INTEGER);
                stm.execute();
                rows = stm.getInt(3);
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return rows;
    }
}
