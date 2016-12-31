/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package guidesign;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author User
 */
public class connectOracle {
    
    Connection conn = null;
    
    connectOracle(){
        System.out.println("Check_1: Connecting to Oracle Database\n");

    //code for connection
        try{
            String driverName = "oracle.jdbc.driver.OracleDriver";
            Class.forName(driverName);
            String serverName = "KAI10";
            String serverPort = "1521";
            String sid = "orcl";
            String url = "jdbc:oracle:thin:@"+serverName+":"+serverPort+":"+ sid;
            String username = "KAI";
            String password = "786292";
            conn = DriverManager.getConnection(url, username, password);
            System.out.println("Connected Successfully");
        }
        catch (ClassNotFoundException | SQLException E){
            System.out.println("Error in Connection");
        }
    }
}
