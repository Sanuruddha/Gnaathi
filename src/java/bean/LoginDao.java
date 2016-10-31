package bean;

import java.sql.*;

public class LoginDao {

    public static boolean validate(User bean) {
        boolean status = false;
        try {
            Connection con = ConnectionProvider.getCon();
       
            PreparedStatement ps=con.prepareStatement("SELECT * FROM user WHERE email=? AND password=?");  	
            
            
            ps.setString(1, bean.getEmail());
            ps.setString(2, bean.getPassword());

            ResultSet rs = ps.executeQuery();
            
            status = rs.next();
        } catch (Exception e) {
        }
        return status;
    }
}
