import java.util.logging.Logger;

public class Log4jTestDemo {
    public void logMethod(){
        Logger logger = Logger.getLogger(String.valueOf(Log4jTestDemo.class));
        logger.info("这是info级别的错误");

    }
    public static void main(String[] args){
        Log4jTestDemo test=new Log4jTestDemo();
        test.logMethod();
    }

}
