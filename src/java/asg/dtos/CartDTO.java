/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package asg.dtos;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author phath
 */
public class CartDTO {
    private Map<String, ProductDTO> cart ;

    public CartDTO() {
    }

    public CartDTO(Map<String, ProductDTO> cart) {
        this.cart = cart;
    }

    public Map<String, ProductDTO> getCart() {
        return cart;
    }

    public void setCart(Map<String, ProductDTO> cart) {
        this.cart = cart;
    }
    public void add(ProductDTO product, int productQuantity){
        if(this.cart == null){
            cart=new HashMap<>();
        }
        if(this.cart.containsKey(product.getProductID())){
            int quantity = Integer.parseInt(this.cart.get(product.getProductID()).getProductQuantity());
            product.setProductQuantity(Integer.toString(quantity+productQuantity));
        }
        cart.put(product.getProductID(), product);
    }
    public void delete(String productID){
        if(this.cart==null){
            return;
        }
        if(this.cart.containsKey(productID)){
            this.cart.remove(productID);
        }
    }
    public void update(String productID, ProductDTO product){
        if(this.cart == null){
            return;
        }
        if(this.cart.containsKey(productID)){
            this.cart.replace(productID, product);
        }
    }
}
