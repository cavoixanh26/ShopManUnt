/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Stack;
import model.Account;
import model.Brand;
import model.Cart;
import model.Category;
import model.Color;
import model.Customer;
import model.Image;
import model.Item;
import model.Product;
import model.ProductHis;
import model.ProductInCategory;
import model.Size;
import model.Type;
import org.apache.jasper.tagplugins.jstl.core.ForEach;

/**
 *
 * @author ADMIN
 */
public class DAO extends DBContext {

    public List<Category> getAllCategory() {
        String sql = "select *from category";
        List<Category> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getInt(1), rs.getString(2));
                list.add(c);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Type> getAllType() {
        String sql = "select *from type";
        List<Type> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Type c = new Type(rs.getInt(1), rs.getString(2));
                list.add(c);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Brand> getAllBrand() {
        String sql = "select *from Brand";
        List<Brand> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Brand c = new Brand(rs.getInt(1), rs.getString(2));
                list.add(c);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Color> getAllColor() {
        String sql = "select *from color";
        List<Color> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Color c = new Color(rs.getInt(1), rs.getString(2));
                list.add(c);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Size> getAllSize(int pid) {
        List<Size> list = new ArrayList<>();
        String sql = "select *from size where pid = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, pid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Size s = new Size(rs.getString(1), rs.getInt(2), pid);
                list.add(s);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Product> getAllProduct(String sort) {
        String sql = "select *from product";
        List<Product> list = new ArrayList<>();
        if (sort != null) {
            sql += " order by price " + sort;
        }

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt(1));
                p.setName(rs.getString(2));
                p.setIdType(rs.getInt(3));
                p.setIdColor(rs.getInt(4));
                p.setIdBrand(rs.getInt(5));
                p.setPrice(rs.getDouble(6));
                p.setReleaseDate(rs.getDate(7));
                p.setDescription(rs.getString(8));
                p.setIdCategory(rs.getInt(9));
                p.setImage(rs.getString(10));
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Product> getProductByCategory(int idCategory, String[] type, String[] brand, String[] color, String r_from, String r_to, String sort) {
        List<Product> list = new ArrayList<>();
        String sql = "select p.id, p.name, p.idType, p.idColor, p.idBrand, p.price, p.releaseDate, p.description, p.idCategory, p.image\n"
                + "from product p join type t on t.id=p.idType join color c on c.id=p.idColor join brand b on b.id=p.idBrand join category ca on ca.id=p.idCategory\n"
                + "where p.idCategory = ? ";

        if (type != null) {
            sql += " and t.name in(";
            for (int i = 0; i < type.length; i++) {
                sql += "'" + type[i] + "',";
            }
            if (sql.endsWith(",")) {
                sql = sql.substring(0, sql.length() - 1);
            }
            sql += " )";
        }

        if (brand != null) {
            sql += " and b.name in(";
            for (int i = 0; i < brand.length; i++) {
                sql += "'" + brand[i] + "',";
            }
            if (sql.endsWith(",")) {
                sql = sql.substring(0, sql.length() - 1);
            }
            sql += " )";
        }

        if (color != null) {
            sql += " and c.name in(";
            for (int i = 0; i < color.length; i++) {
                sql += "'" + color[i] + "',";
            }
            if (sql.endsWith(",")) {
                sql = sql.substring(0, sql.length() - 1);
            }
            sql += " )";
        }
        if (r_from != null) {
            double from;
            try {
                from = Double.parseDouble(r_from);
                sql += " and p.price >= " + from;
            } catch (NumberFormatException e) {
            }
        }
        if (r_to != null) {
            double to;
            try {
                to = Double.parseDouble(r_to);
                sql += " and p.price <= " + to;
            } catch (NumberFormatException e) {
            }
        }

        if (sort != null) {
            sql += " order by price " + sort;
        }

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, idCategory);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt(1));
                p.setName(rs.getString(2));
                p.setIdType(rs.getInt(3));
                p.setIdColor(rs.getInt(4));
                p.setIdBrand(rs.getInt(5));
                p.setPrice(rs.getDouble(6));
                p.setReleaseDate(rs.getDate(7));
                p.setDescription(rs.getString(8));
                p.setIdCategory(rs.getInt(9));
                p.setImage(rs.getString(10));
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public Product getProductById(int id, String size) {
        String sql = "select p.id, p.name, p.idType, p.idColor, p.idBrand, p.price, p.releaseDate, p.description, p.idCategory, p.image"
                + " from product p join size s on p.id=s.pid where p.id = ?";
        if (size != null) {
            sql += " and s.name = ?";
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            if (size != null) {
                st.setString(2, size);
            }
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt(1));
                p.setName(rs.getString(2));
                p.setIdType(rs.getInt(3));
                p.setIdColor(rs.getInt(4));
                p.setIdBrand(rs.getInt(5));
                p.setPrice(rs.getDouble(6));
                p.setReleaseDate(rs.getDate(7));
                p.setDescription(rs.getString(8));
                p.setIdCategory(rs.getInt(9));
                p.setImage(rs.getString(10));

                return p;
            }
        } catch (SQLException e) {
        }

        return null;
    }

    public List<Image> getImgByIdProduct(int idp) {
        List<Image> list = new ArrayList<>();
        String sql = "select img.idp, img.img from product p join [image] img on p.id=img.idp where p.id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, idp);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Image i = new Image(rs.getInt(1), rs.getString(2));
                list.add(i);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public int getQuantityProBySize(String size, int pid) {
        int quantity = 0;
        String sql = "select s.quantity from product p join size s on p.id=s.idProduct\n"
                + "where p.id = ? and s.name = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, pid);
            st.setString(2, size);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                quantity = rs.getInt("quantity");
            }
        } catch (SQLException e) {
        }
        return quantity;
    }

    //pagination
    public List<Product> getListByPage(List<Product> list, int start, int end) {
        ArrayList<Product> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    //search 
    public List<Product> getSearchProduct(String search) {
        List<Product> list = new ArrayList<>();
        String sql = "select p.id, p.name, p.idType, p.idColor, p.idBrand, p.price, p.releaseDate, p.description, p.idCategory, p.image\n"
                + "from product p join [type] t on t.id=p.idType join color c on c.id=p.idColor join brand b on b.id=p.idBrand join category ca on ca.id=p.idCategory\n"
                + "where p.name like ? or t.name like ? or c.name like ? or b.name like ? or p.description like ? or ca.name like ?\n";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, search);
            st.setString(2, search);
            st.setString(3, search);
            st.setString(4, search);
            st.setString(5, search);
            st.setString(6, search);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt(1));
                p.setName(rs.getString(2));
                p.setIdType(rs.getInt(3));
                p.setIdColor(rs.getInt(4));
                p.setIdBrand(rs.getInt(5));
                p.setPrice(rs.getDouble(6));
                p.setReleaseDate(rs.getDate(7));
                p.setDescription(rs.getString(8));
                p.setIdCategory(rs.getInt(9));
                p.setImage(rs.getString(10));
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Product> getProductFilter(String[] type, String[] brand, String[] color, String r_from, String r_to, String query, String sort) {
        List<Product> list = new ArrayList<>();
        String sql = "select p.id, p.name, p.idType, p.idColor, p.idBrand, p.price, p.releaseDate, p.description, p.idCategory, p.image\n"
                + "from product p join type t on t.id=p.idType join color c on c.id=p.idColor join brand b on b.id=p.idBrand join category ca on ca.id=p.idCategory\n"
                + "where 1=1 ";
        if (type != null) {
            sql += " and t.name in(";
            for (int i = 0; i < type.length; i++) {
                sql += "'" + type[i] + "',";
            }
            if (sql.endsWith(",")) {
                sql = sql.substring(0, sql.length() - 1);
            }
            sql += " )";
        }

        if (brand != null) {
            sql += " and b.name in(";
            for (int i = 0; i < brand.length; i++) {
                sql += "'" + brand[i] + "',";
            }
            if (sql.endsWith(",")) {
                sql = sql.substring(0, sql.length() - 1);
            }
            sql += " )";
        }

        if (color != null) {
            sql += " and c.name in(";
            for (int i = 0; i < color.length; i++) {
                sql += "'" + color[i] + "',";
            }
            if (sql.endsWith(",")) {
                sql = sql.substring(0, sql.length() - 1);
            }
            sql += " )";
        }
        if (r_from != null) {
            double from;
            try {
                from = Double.parseDouble(r_from);
                sql += " and p.price >= " + from;
            } catch (NumberFormatException e) {
            }
        }
        if (r_to != null) {
            double to;
            try {
                to = Double.parseDouble(r_to);
                sql += " and p.price <= " + to;
            } catch (NumberFormatException e) {
            }
        }

        if (query != null) {
            sql += " and (p.name like ? or t.name like ? or c.name like ? or b.name like ? or ca.name like ? )";
        }
        if (sort != null) {
            sql += " order by price " + sort;
        }

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            if (query != null) {
                st.setString(1, "%" + query + "%");
                st.setString(2, "%" + query + "%");
                st.setString(3, "%" + query + "%");
                st.setString(4, "%" + query + "%");
                st.setString(5, "%" + query + "%");
            }

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setIdType(rs.getInt("idType"));
                p.setIdColor(rs.getInt("idColor"));
                p.setIdBrand(rs.getInt("idBrand"));
                p.setPrice(rs.getDouble("price"));
                p.setReleaseDate(rs.getDate("releaseDate"));
                p.setDescription(rs.getString("description"));
                p.setIdCategory(rs.getInt("idCategory"));
                p.setImage(rs.getString("image"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    //account
    public Account checkAccountExist(String username) {
        String sql = "select *from account where username = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Account a = new Account();
                a.setId(rs.getInt(1));
                a.setUsername(username);
                a.setPassword(rs.getString(3));
                a.setRole(rs.getInt(4));
                a.setAmount(rs.getDouble(5));

                return a;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public Account checkAccountExist(String username, String password) {
        String sql = "select *from account where username = ? and password = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Account a = new Account();
                a.setId(rs.getInt(1));
                a.setUsername(username);
                a.setPassword(rs.getString(3));
                a.setRole(rs.getInt(4));
                a.setAmount(rs.getDouble(5));

                return a;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public void addAccountUser(String username, String password) {
        String sql = "INSERT INTO [dbo].[account]\n"
                + "           ([username]\n"
                + "           ,[password]\n"
                + "           ,[role]\n"
                + "           ,[amount])\n"
                + "     VALUES\n"
                + "           (?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            st.setInt(3, 3);
            st.setDouble(4, 0);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }
    //account

    // order 
    public void addOrder(Account a, Cart cart, Customer cus) {
        LocalDate local = LocalDate.now();
        try {
            //add
            String sql = "insert into [order] values (?,?,?,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, a.getId());
            st.setBoolean(2, false);
            st.setDate(3, Date.valueOf(local));
            st.setDate(4, null);
            st.executeUpdate();

            //lay id cua order
            String sql1 = "select top 1 id from [order] order by id desc";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            ResultSet rs1 = st1.executeQuery();
            if (rs1.next()) {
                int oid = rs1.getInt("id");
                for (Item i : cart.getItems()) {
                    String sql2 = "insert into orderDetail values (?,?,?,?,?)";
                    PreparedStatement st2 = connection.prepareStatement(sql2);
                    st2.setInt(1, i.getProduct().getId());
                    st2.setInt(2, i.getQuantity());
                    st2.setString(3, i.getSize());
                    st2.setDouble(4, i.getPrice());
                    st2.setInt(5, oid);
                    st2.executeUpdate();
                }
            }

            // update quantity 
            String sql3 = "update size set quantity = quantity - ? where idProduct = ? and name = ? ";
            PreparedStatement st3 = connection.prepareStatement(sql3);
            for (Item i : cart.getItems()) {
                st3.setInt(1, i.getQuantity());
                st3.setInt(2, i.getProduct().getId());
                st3.setString(3, i.getSize());
                st3.executeUpdate();
            }

            // add cus
            String sql4 = "";
            if (getCus(a) == null) {
                sql4 += "insert into customer values (?,?,?,?,?,?)";
            } else {
                sql4 += "update customer set firstname = ? , lastname = ? , phone = ? , email = ? , [address] = ? where ida = ?";
            }
            PreparedStatement st4 = connection.prepareStatement(sql4);
            st4.setString(1, cus.getFirstName());
            st4.setString(2, cus.getLastName());
            st4.setString(3, cus.getPhone());
            st4.setString(4, cus.getEmail());
            st4.setString(5, cus.getAddress());
            st4.setInt(6, a.getId());
            st4.executeUpdate();

        } catch (SQLException e) {
        }
    }

    // check account have customer 
    public Customer getCus(Account a) {
        String sql = "select c.firstname, c.lastname, c.phone, c.email, c.address, c.ida\n"
                + "from account a join customer c on a.id=c.ida where a.id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, a.getId());
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Customer c = new Customer();
                c.setFirstName(rs.getString(1));
                c.setLastName(rs.getString(2));
                c.setPhone(rs.getString(3));
                c.setEmail(rs.getString(4));
                c.setAddress(rs.getString(5));
                c.setIda(rs.getInt(6));
                return c;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    //order history
    public List<Product> getProductOrderHistory(Account a) {
        List<Product> list = new ArrayList<>();
        String sql = "select p.id, p.name, p.idType, p.idColor, p.idBrand, p.price, p.releaseDate, p.description, p.idCategory, p.image\n"
                + "from account a join [order] o on a.id=o.ida join orderDetail od on o.id=od.ido join product p on od.idPro=p.id\n"
                + "where a.id = ? ";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, a.getId());
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt(1));
                p.setName(rs.getString(2));
                p.setIdType(rs.getInt(3));
                p.setIdColor(rs.getInt(4));
                p.setIdBrand(rs.getInt(5));
                p.setPrice(rs.getDouble(6));
                p.setReleaseDate(rs.getDate(7));
                p.setDescription(rs.getString(8));
                p.setIdCategory(rs.getInt(9));
                p.setImage(rs.getString(10));
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    //product history
    public Stack<ProductHis> getPH(int ida) {
        Stack<ProductHis> list = new Stack<>();
        String sql = "select p.id, od.size,od.quantity, o.orderDate, o.status\n"
                + "from account a join order o on a.id=o.ida \n"
                + "join orderDetail od on o.id=od.ido join product p on p.id=od.idPro\n"
                + "where a.id=? order by o.orderDate desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, ida);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = getProductById(rs.getInt("id"), null);
                ProductHis ph = new ProductHis();
                ph.setProduct(p);
                ph.setSize(rs.getString("size"));
                ph.setQuantity(rs.getInt("quantity"));
                ph.setOrderDate(rs.getDate("orderDate"));
                ph.setStatus(rs.getBoolean("status"));
                list.add(ph);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public void updateProduct(Product product, List<Size> size) {
        String sql = "UPDATE product\n"
                + "   SET [name] = ?\n"
                + "      ,[idType] = ?\n"
                + "      ,[idColor] = ?\n"
                + "      ,[idBrand] = ?\n"
                + "      ,[price] = ?\n"
                + "      ,[description] = ?\n"
                + " WHERE id = ?";
        String sqlUpdate = "UPDATE size SET quantity= ?\n"
                + " WHERE size.name = ? and size.pid = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, product.getName());
            st.setInt(2, product.getIdType());
            st.setInt(3, product.getIdColor());
            st.setInt(4, product.getIdBrand());
            st.setDouble(5, product.getPrice());
            st.setString(6, product.getDescription());
            st.setInt(7, product.getId());
            st.executeUpdate();
            
            PreparedStatement stUpdate = connection.prepareStatement(sqlUpdate);
            for (Size s : size) {
                stUpdate.setInt(1, s.getQuantity());
                stUpdate.setString(2, s.getName());
                st.setInt(3, product.getId());
                st.executeUpdate();
            }
        } catch (SQLException e) {
        }
    }

    //
    public static void main(String[] args) {
        DAO d = new DAO();
        List<Size> size = new ArrayList<>();
        List<Size> sizea =d.getAllSize(1);
        for (Size s : sizea) {
            size.add(new Size(s.getName(), s.getQuantity()+1, s.getIdProduct()));
        }
        for (Size s : size) {
            System.out.println(s.getQuantity());
        }
//        Product product = new Product(1, "Manchester United Home Shirt 2022-23", 1, 1,1, 70, null, "Turned up or pressed down, the humble polo collar has played a starring role in many of Manchester Uniteds biggest moments. Making a comeback on this adidas football jersey, it joins a shield-style badge and engineered pinstripe graphic to produce an eye-catching look. Moisture-absorbing AEROREADY and mesh panels make it a comfortable choice for passionate supporters. Made with 100% recycled materials, this product represents just one of our solutions to help end plastic waste.", 1, null);
//        d.updateProduct(product, size);
    }
}
