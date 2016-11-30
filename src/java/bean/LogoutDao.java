package bean;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Lock
 */
public class LogoutDao {

    public static void logout(int userId) {
        Connection con = ConnectionProvider.getCon();
        try {
            List<Message> rList = Chat.recievedMessages.remove(userId);
            List<Message> sList = Chat.sentMessages.remove(userId);
            for (Message m : rList) {

            }

            for (Message m : rList) {

            }
        } catch (Exception e) {
        }

    }
}
