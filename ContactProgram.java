import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class ContactProgram {
    public static void main(String[] args){
        String jdbcURL = "jdbc:postgresql://localhost:5432/hotelmanagement";
        String username = "postgres";
        String password = "poswan07";

        try {
            Connection connection = DriverManager.getConnection(jdbcURL, username, password);
            System.out.println("connected");

            connection.close();
        } catch (SQLException e) {
            System.out.println("Error in connecting to database");
            e.printStackTrace();
        }
    }
}