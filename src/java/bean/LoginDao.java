package bean;

import java.sql.*;
import javax.servlet.http.HttpSession;

public class LoginDao {

    public static boolean validate(User bean,HttpSession session) {
        boolean status = false;
        try {
            Connection con = ConnectionProvider.getCon();
       
            PreparedStatement ps=con.prepareStatement("SELECT * FROM user WHERE email=? AND password=?");  	
            
            
            ps.setString(1, bean.getEmail());
            ps.setString(2, bean.getPassword());

            ResultSet rs = ps.executeQuery();
            
            status = rs.next();
            
            if(status){
                session.setAttribute("user_type",rs.getInt("user_type"));
                session.setAttribute("user_id",rs.getInt("user_id"));
            }
        } catch (Exception e) {
        }
        return status;
    }
}
