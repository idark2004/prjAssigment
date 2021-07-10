/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package asg.daos;

import asg.dtos.ProductDTO;
import asg.utils.DBSupport;
import java.sql.SQLException;
import java.util.List;
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
public class ProductDAOTest {

    DBSupport db = new DBSupport();
    public ProductDAOTest() {
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
     * Test of insert method, of class ProductDAO.
     *
     * @throws java.sql.SQLException
     * @throws java.lang.ClassNotFoundException
     * need to change product's values after run test file
     */
    @Test
    public void testInsertSuccess() throws SQLException, ClassNotFoundException {
        try {
            ProductDTO product = new ProductDTO("PC-003", "AMD", "4", "10.0", "PC", "true");
        ProductDAO instance = new ProductDAO();
        int before = db.getAll("productID", "tblProducts");
        instance.insert(product);
        int after = db.getAll("productID", "tblProducts");
        assertEquals(before + 1, after);
        } catch (ClassNotFoundException | SQLException e) {
            fail("Need to change product's values");
        }        
    }

    @Test(expected = SQLException.class)
    public void testInsertFail() throws Exception {
        ProductDTO product = new ProductDTO("PC-001", "AMD", "4", "10.0", "PC", "true");
        ProductDAO instance = new ProductDAO();
        instance.insert(product);
    }

    /**
     * Test of view method, of class ProductDAO to get all active products.
     *
     * @throws java.lang.Exception
     */
    @Test
    public void testGetActiveProducts() throws Exception {
        String status = "true";
        String search = "";
        String categoryID = "";
        ProductDAO instance = new ProductDAO();
        int expResult = db.getActive("productID", "tblProducts");
        List<ProductDTO> result = instance.view(status, search, categoryID);
        assertEquals(expResult, result.size());
    }

    /**
     * Test of view method, of class ProductDAO to get all inactive products.
     *
     * @throws Exception
     */
    @Test
    public void testGetInactiveProducts() throws Exception {
        
        String status = "false";
        String search = "";
        String categoryID = "";
        ProductDAO instance = new ProductDAO();
        int expResult = db.getAll("productID", "tblProducts") - db.getActive("productID", "tblProducts");
        List<ProductDTO> result = instance.view(status, search, categoryID);
        assertEquals(expResult, result.size());
    }

    /**
     * Test of delete method, of class ProductDAO.
     * Success
     */
    @Test
    public void testDeleteSuccess() throws Exception {
        String productID = "PC-001";
        ProductDAO instance = new ProductDAO();
        boolean expResult = true;
        int expQty = db.getActive("productID", "tblProducts")-1;
        boolean result = instance.delete(productID);
        int atualQty = db.getActive("productID", "tblProducts");
        assertEquals(expResult == result, expQty == atualQty);
        
    }
    
    /**
     * Test of delete method, of class ProductDAO.
     * FAIL
     */
    @Test
    public void testDeleteFail() throws Exception {
        String productID = "PC-0001";
        ProductDAO instance = new ProductDAO();
        boolean expResult = false;
        int expQty = db.getActive("productID", "tblProducts");
        boolean result = instance.delete(productID);
        int atualQty = db.getActive("productID", "tblProducts");
        assertEquals(expResult == result, expQty == atualQty);
        
    }

    /**
     * Test of update method, of class ProductDAO.
     * SUCCESS
     */
    @Test
    public void testUpdateSuccess() throws Exception {
        ProductDTO product = new ProductDTO("PC-001", "intel", "29", "400", "PC", "true");
        ProductDAO instance = new ProductDAO();
        boolean expResult = true;
        boolean result = instance.update(product);
        assertEquals(expResult, result);
    }

    /**
     * Test of update method, of class ProductDAO.
     * FAIL
     */
    @Test
    public void testUpdateFail() throws Exception {
        ProductDTO product = new ProductDTO("PC-0001", "intel", "29", "400", "PC", "true");
        ProductDAO instance = new ProductDAO();
        boolean expResult = false;
        boolean result = instance.update(product);
        assertEquals(expResult, result);
    }
}
