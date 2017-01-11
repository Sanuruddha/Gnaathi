package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Validator {
    
    public static final Pattern VALID_EMAIL_ADDRESS_REGEX
            = Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$", Pattern.CASE_INSENSITIVE);

    public static boolean validateEmail(String emailStr) {
        Matcher matcher = VALID_EMAIL_ADDRESS_REGEX.matcher(emailStr);
        return matcher.find();
    }
    
    public static boolean validateName(String name){
        return name.length()>=6;
    }
    
    public static boolean validatePassword(String password){
        return password.length()>=7;
    }
    
    public static boolean validatePassword(String repassword,String password){
        return password.equals(repassword);
    }
    
    public static boolean validateUsertype(int usertype){
        return usertype==1||usertype==2||usertype==3;
    }
    
    public static boolean validateAll(int usertype,String emailStr,String name,String password,String repassword){
        return (validateUsertype(usertype)&&validateName(name)&&validateEmail(emailStr)&&validatePassword(password)&&validatePassword(repassword,password));
    }
    
    public static boolean checkDuplicateEmail(String email) throws SQLException{
       Connection con=ConnectionProvider.getCon();
       String query="select * from user where email=?";
       PreparedStatement ps=con.prepareStatement(query);
       ps.setString(1,email);
       ResultSet rs=ps.executeQuery();
       return rs.next();
    }
}
