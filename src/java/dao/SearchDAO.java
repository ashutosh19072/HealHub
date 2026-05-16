
package dao;

import db.DBConnector;
import java.sql.*;
import java.util.*;
import model.SearchResult;

public class SearchDAO {

    public List<SearchResult> searchMedicine(String medicine, String city) {

        List<SearchResult> list = new ArrayList<>();

        try {
            Connection con = DBConnector.getConnection();

            String sql = "SELECT p.pname, p.address, p.city, p.latitude, p.longitude, m.name AS medicine, s.quantity FROM pharmacy p JOIN stock s ON p.pharmacy_id = s.pharmacy_id JOIN medicine m ON m.medicine_id = s.medicine_id WHERE m.name LIKE ? AND s.quantity > 0 AND p.status='APPROVED'";

            if (city != null && !city.trim().isEmpty()) {
                sql += " AND p.city LIKE ?";
            }

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, "%" + medicine + "%");

            if (city != null && !city.trim().isEmpty()) {
                ps.setString(2, "%" + city + "%");
            }

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                SearchResult sr = new SearchResult();

                sr.setPharmacyName(rs.getString("pname"));
                sr.setAddress(rs.getString("address"));
                sr.setCity(rs.getString("city"));
                sr.setMedicine(rs.getString("medicine"));
                sr.setQuantity(rs.getInt("quantity"));
                sr.setLatitude(rs.getDouble("latitude"));
                sr.setLongitude(rs.getDouble("longitude"));
                
                list.add(sr);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }
}
