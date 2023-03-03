/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.swing.text.html.HTML;
import model.Product;
import model.ProductInCategory;
import model.ProductTopSell;

/**
 *
 * @author ADMIN
 */
public class DAO_S extends DBContext {

    public List<ProductInCategory> getQuantityProductInCategory() {
        List<ProductInCategory> list = new ArrayList<>();
        String sql = "select c.name, count(p.idCategory) as quantity \n"
                + "from category c join product p on c.id=p.idCategory\n"
                + "group by c.name";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ProductInCategory p = new ProductInCategory(rs.getString(1), rs.getInt(2));
                list.add(p);
            }
        } catch (SQLException e) {
        }

        return list;
    }

    public List<ProductTopSell> topProductSell(int top, String year, String month, String day, String sort) {
        String sql = "select top " + top + "  p.id, sum(od.quantity) as quantity, \n"
                + "YEAR(o.orderDate) , MONTH(o.orderDate), DAY(o.orderDate)\n"
                + "from product p join orderDetail od on p.id=od.idPro join [order] o on od.ido=o.id\n"
                + "group by p.id, YEAR(o.orderDate),MONTH(o.orderDate), DAY(o.orderDate)\n"
                + "having 1=1 \n";

        List<ProductTopSell> list = new ArrayList<>();
        if (year != null) {
            sql += " and YEAR(o.orderDate) = " + year;
        }
        if (month != null) {
            sql += " and MONTH(o.orderDate) = " + month;
        }
        if (day != null) {
            sql += " and DAY(o.orderDate) = " + day;
        }

        sql += " order by quantity " + sort;

        DAO d = new DAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ProductTopSell p = new ProductTopSell();
                Product pr = d.getProductById(rs.getInt("id"), null);
                p.setProduct(pr);
                p.setQuantity(rs.getInt(2));
                list.add(p);
            }

        } catch (SQLException e) {
        }
        return list;
    }

    public List<Object> getAllYear() {
        List<Object> list = new ArrayList<>();
//        int index = 0;
        String sql = "select distinct year(orderDate) from [order]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(rs.getString(1));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Object> quantityProductSell(String year, String month) {
        List<Object> list = new ArrayList<>();
        String sql = "select YEAR(o.orderDate) as year,\n"
                + "sum(od.quantity)\n"
                + "from orderDetail od join [order] o on od.ido=o.id\n"
                + "group by YEAR(o.orderDate)";
        if (year != null && month==null) {
            sql += " , MONTH(o.orderDate) having YEAR(o.orderDate) = "+year;
        } else if(month != null && year != null) {
            sql += ", MONTH(o.orderDate), DAY(o.orderDate) having YEAR(o.orderDate) = "+year+" and MONTH(o.orderDate) = "+month;
        }
        
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(rs.getInt(2));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public static void main(String[] args) {
        DAO_S d = new DAO_S();
        List<Object> l = d.quantityProductSell("2022","12");
        for (Object o : l) {
            System.out.println(o);
        }

    }
}
