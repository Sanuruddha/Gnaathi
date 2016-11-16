package bean;

import java.util.Calendar;


public class Message {
    Calendar timestamp;
    int to_id,from_id;
    String message;
    
    public Message(String message,int to_id,int from_id){
        this.message=message;
        this.to_id=to_id;
        this.from_id=from_id;
        timestamp=Calendar.getInstance();
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
}
