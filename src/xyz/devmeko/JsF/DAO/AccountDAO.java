package xyz.devmeko.JsF.DAO;

import org.json.JSONException;
import org.json.JSONObject;
import xyz.devmeko.JsF.Handlers.RandomStringGenerator;
import xyz.devmeko.JsF.Handlers.SHA256Handler;
import xyz.devmeko.JsF.Handlers.SaltHandler;
import xyz.devmeko.JsF.SQL.SQLHandler;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class AccountDAO {

    public void addAccount(String email, String ogPw, String name) throws Exception {
        String salt = new SaltHandler().toSalt(new RandomStringGenerator().generate(8));
        String savingPW = new SHA256Handler().encrypt(ogPw + salt);
        String command = "INSERT INTO user(email, salt, password, name, fridges) VALUES ('" + email + "', '" + salt + "', '" + savingPW + "', '" + name + "', '');";
        System.out.println(command);
        SQLHandler sqlHandler = new SQLHandler();
        sqlHandler.perform(command);
    }

    public void deleteAccount(String email) throws Exception {
        String command = "DELETE FROM user WHERE email = '" + email + "';";
        SQLHandler sqlHandler = new SQLHandler();
        sqlHandler.perform(command);
    }

    public String login(String email, String ogPw) throws Exception {
        try {
//        String command1 = "SELECT CASE WHEN EXISTS(SELECT * FROM user WHERE email = '" + email + "' THEN 'TRUE' ELSE 'FALSE' END;";
            SQLHandler sqlHandler = new SQLHandler();
//        if (sqlHandler.queryObj(command1).equalsIgnoreCase("FALSE")) return "{\"result\": 1}";
//        else {
            String command2 = "SELECT salt FROM user WHERE email = '" + email + "';";
            String command3 = "SELECT password FROM user WHERE email = '" + email + "';";
            JSONObject saltObj = new JSONObject(sqlHandler.queryObj(command2));
            String salt = saltObj.getString("salt");
            String savingPW = new SHA256Handler().encrypt(ogPw + salt);
            JSONObject pwObj = new JSONObject(sqlHandler.queryObj(command3));
            String pw = pwObj.getString("password");
            if (!savingPW.equalsIgnoreCase(pw)) {
                return "{\"result\": 2}";
            } else {
                JSONObject user = new JSONObject(sqlHandler.queryObj("SELECT email, name FROM user WHERE email = '" + email + "';"));
                user.put("result", 0);
                return user.toString();
            }
//        }
        } catch (JSONException exception) {
            return "{\"result\": 1}";
        }
    }

    public void removeFridgeFromUser(String email, String fridge) throws Exception {
        SQLHandler sqlHandler = new SQLHandler();

        String command1 = "SELECT fridges FROM user WHERE email = '" + email + "';";
        String list = new JSONObject(sqlHandler.queryObj(command1)).getString("fridges");
        List<String> fridges = new ArrayList<>();
        Collections.addAll(fridges, list.split(","));
        if (fridges.contains(fridge)) fridges.remove(fridge);
        fridges.remove("");

        String result = "";
        for (String member : fridges) {
            result += member;
            result += ",";
        }

        String command2 = "UPDATE user SET fridges = '" + result + "' WHERE email = '" + email + "';";
        sqlHandler.perform(command2);
    }

    public void addFridgeToUser(String email, String fridge) throws Exception {
        SQLHandler sqlHandler = new SQLHandler();

        String command1 = "SELECT fridges FROM user WHERE email = '" + email + "';";
        String list = new JSONObject(sqlHandler.queryObj(command1)).getString("fridges");
        List<String> fridges = new ArrayList<>();
        Collections.addAll(fridges, list.split(","));
        if (fridges.contains(fridge)) return;
        else fridges.add(fridge);
        fridges.remove("");


        String result = "";
        for (String member : fridges) {
            result += member;
            result += ",";
        }

        String command2 = "UPDATE user SET fridges = '" + result + "' WHERE email = '" + email + "';";
        sqlHandler.perform(command2);
    }

    public String getUserFridge(String email) throws Exception {
        SQLHandler sqlHandler = new SQLHandler();
        String command2 = "SELECT fridges FROM user WHERE email = '" + email + "';";
        return sqlHandler.queryObj(command2);
    }
}
