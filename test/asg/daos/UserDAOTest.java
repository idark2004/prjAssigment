/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package asg.daos;

import asg.dtos.UserDTO;
import java.sql.SQLException;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author phath
 */
public class UserDAOTest {

    public UserDAOTest() {
    }

    @BeforeClass
    public static void setUpClass() {
    }

    @AfterClass
    public static void tearDownClass() {
    }

    @Before
    public void setUp() {
    }

    @After
    public void tearDown() {
    }

    /**
     * Test of checkLogin method, of class UserDAO.
     *
     * SUCCESS
     */
    @Test
    public void testCheckLoginSuccess() throws Exception {
        String userID = "phathuuho@gmail.com";
        String password = "1234";
        UserDAO instance = new UserDAO();
        UserDTO expResult = new UserDTO(userID, "testSignIn", "", "GU");
        UserDTO result = instance.checkLogin(userID, password);
        System.out.println(result.getName());
        System.out.println(result.getRoleID());
        assertEquals(expResult.getName().equals(result.getName()), expResult.getRoleID().equals(result.getRoleID()));
    }

    /**
     * Test of checkLogin method, of class UserDAO.
     *
     * FAIL
     * @throws java.sql.SQLException
     * @throws java.lang.ClassNotFoundException
     */
    @Test
    public void testCheckLoginFail() throws SQLException, ClassNotFoundException {
       
            String userID = "abc";
            String password = "abc";
            UserDAO instance = new UserDAO();
            UserDTO result = instance.checkLogin(userID, password);
            assertEquals(result.getName() == null, result.getRoleID() == null);       

    }
}
