/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDate;

/**
 *
 * @author ADMIN
 */
public class DAO_E extends DBContext {

    public void addNewProduct(String name, int idt, int idc, int idb, double price, String des, int cid, String img) {
        LocalDate date = LocalDate.now();
        String sql = "INSERT INTO [dbo].[product]\n"
                + "           ([name]\n"
                + "           ,[idType]\n"
                + "           ,[idColor]\n"
                + "           ,[idBrand]\n"
                + "           ,[price]\n"
                + "           ,[releaseDate]\n"
                + "           ,[description]\n"
                + "           ,[idCategory]\n"
                + "           ,[image])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?,?,?)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setInt(2, idt);
            st.setInt(3, idc);
            st.setInt(4, idb);
            st.setDouble(5, price);
            st.setDate(6, Date.valueOf(date));
            st.setString(7, des);
            st.setInt(8, cid);
            st.setString(9, img);
            st.executeUpdate();
        } catch (SQLException e) {
        }

        
    }
    public void addQuantityProduct(String name, int quantity, int pid){
        String sql = "INSERT INTO [dbo].[size]\n"
                + "           ([name]\n"
                + "           ,[quantity]\n"
                + "           ,[idProduct])\n"
                + "     VALUES\n"
                + "           (?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setInt(2, quantity);
            st.setInt(3, pid);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }
}
