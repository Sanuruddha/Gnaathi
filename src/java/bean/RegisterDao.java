package bean;
import java.sql.*;

public class RegisterDao {

    public static boolean register(User bean) {
        boolean status = false;

        try {
            Connection con = ConnectionProvider.getCon();
       
            PreparedStatement ps=con.prepareStatement("SELECT * FROM user WHERE email=? OR user_name=?");  	
            
            ps.setString(1, bean.getEmail());
            ps.setString(2,bean.getUserName());

            ResultSet rs = ps.executeQuery();
            
            status = rs.next();
            
            if(status){
                return false;
            }
            ps=con.prepareStatement("INSERT INTO user (user_name,email,password,user_type) VALUES (?,?,?,?)");
   
            ps.setString(1,bean.getUserName());
            ps.setString(2,bean.getEmail());
            ps.setString(3,bean.getPassword());
            ps.setInt(4,bean.getUserType());
            
            int rows=ps.executeUpdate();
            con.close();
            if(rows!=0)
                return true;
        } catch (Exception e) {
        }
    return false;
        
    }
}