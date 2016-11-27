
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
        ps.setInt(3, friendId);
        ps.setString(2,message);
        int count=ps.executeUpdate();
        return count>0;
    }
}
