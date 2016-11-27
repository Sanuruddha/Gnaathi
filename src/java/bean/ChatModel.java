
package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Lock
 */
public class ChatModel {
    
    
    public static boolean add(Message msg) throws SQLException{
        Connection con = ConnectionProvider.getCon();
        int userId=msg.getFromId();
        int friendId=msg.getToId();
        String message=msg.getMessage();
        PreparedStatement ps;
        ps = con.prepareStatement("INSERT INTO chats (user_id,message,friend_id) VALUES (?,?,?)");
        ps.setInt(1, userId);
        ps.setInt(2, friendId);
        ps.setString(3,message);
        boolean rs=ps.execute();
        
        return rs;
    }
}
