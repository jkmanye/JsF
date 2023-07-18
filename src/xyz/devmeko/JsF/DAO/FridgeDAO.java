package xyz.devmeko.JsF.DAO;

import xyz.devmeko.JsF.Handlers.RandomStringGenerator;
import xyz.devmeko.JsF.SQL.SQLHandler;

import javax.servlet.annotation.WebServlet;

public class FridgeDAO {

    public String addFridge(String name) throws Exception {
        String code = new RandomStringGenerator().generate(6);
        String command = "INSERT INTO fridge(code, name, lastUsed) VALUES ('" + code + "', '" + name + "', CURRENT_DATE);";
        SQLHandler sqlHandler = new SQLHandler();
        sqlHandler.perform(command);
        return code;
    }

    public void updateUseDate(String fridgeCode) throws Exception {
        String command = "UPDATE fridge SET lastUsed = CURRENT_DATE WHERE code = '" + fridgeCode + "';";
        SQLHandler sqlHandler = new SQLHandler();
        sqlHandler.perform(command);
    }

    public void deleteFridge(String fridgeCode) throws Exception {
        String command = "DELETE FROM fridge WHERE code = '" + fridgeCode + "';";
        SQLHandler sqlHandler = new SQLHandler();
        sqlHandler.perform(command);
    }

    public String getFridge(String fridgeCode) throws Exception {
        String command = "SELECT code, name, lastUsed FROM fridge WHERE code = '" + fridgeCode + "';";
        SQLHandler sqlHandler = new SQLHandler();

        return sqlHandler.queryObj(command);
    }
}
