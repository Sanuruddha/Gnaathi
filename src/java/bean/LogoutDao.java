package bean;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Lock
 */
public class LogoutDao {

    public static void logout(int userId) {
        Connection con = ConnectionProvider.getCon();
        try {
            LoginDao.onlineUsers.remove(userId);
            Chat.terminate(userId);
        } catch (Exception e) {
        }

    }
}
