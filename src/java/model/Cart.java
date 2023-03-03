/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class Cart {
    private List<Item> items;
    
    public Cart(){
        items = new ArrayList<>();
    }
    
    public List<Item> getItems(){
        return items;
    }
    
    public int getQuantityById(int id, String size){
        return getItemById(id,size).getQuantity();
    }

    private Item getItemById(int id, String size) {
        for (Item item : items) {
            if(item.getProduct().getId()==id && item.getSize().equals(size))
                return item;
        }
        return null;
    }
    
    public void addItem(Item i, String size){
        if(getItemById(i.getProduct().getId(), size)!=null){
            Item m = getItemById(i.getProduct().getId(), size);
            m.setQuantity(m.getQuantity()+i.getQuantity());
        }else 
            items.add(i);
    }
    public void addItemQuantity(Item i, String size){
        if(getItemById(i.getProduct().getId(), size)!=null){
            Item m = getItemById(i.getProduct().getId(), size);
            m.setQuantity(i.getQuantity());
        }else 
            items.add(i);
    }
    
    public void RemoveItem(int id, String size){
        if(getItemById(id, size)!=null)
            items.remove(getItemById(id, size));
    }
    
    public double getTotalPrice(){
        double p = 0;
        for (Item i : items) {
            p += (i.getQuantity()*i.getPrice());
        }
        return p;
    }
    
    private Product getProductById(int id,List<Product> list){
        for(Product i:list){
            if(i.getId()==id)
                return i;
        }
        return null;
    }
    
    public Cart(String txt,List<Product> list){
        items=new ArrayList<>();
        try{
            if(txt!=null && txt.length()!=0){
                String[] s=txt.split("/");//thay / cho dau ,
                for(String i:s){
                    String[] n=i.split(":");
                    int id=Integer.parseInt(n[0]);
                    int quantity=Integer.parseInt(n[1]);
                    String size = n[2];
                    Product p=getProductById(id, list);
                    Item t=new Item(p, quantity, p.getPrice(), size);
                    addItem(t, size);
                }
            }
        }catch(NumberFormatException e){
            
        }
    }
    
    
}
