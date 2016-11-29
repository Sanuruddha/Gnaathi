package bean;

import java.sql.Timestamp;
import java.util.Date;

public class Message {
    int to_id,from_id;
    String message;
    Timestamp timestamp;
    
    public Message(String message,int to_id,int from_id){
        Date date=new Date();
        this.timestamp = new Timestamp(date.getTime());
        this.message=message;
        this.to_id=to_id;
        this.from_id=from_id;
    }
    
    public String getMessage(){
        return this.message;
    }
    
    public int getFromId(){
        return from_id;
    }
    
    public int getToId(){
        return to_id;
    }
    
    public Timestamp getTimestamp(){
        return this.timestamp;
    }
}
