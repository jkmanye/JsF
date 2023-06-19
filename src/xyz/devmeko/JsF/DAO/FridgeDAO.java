package xyz.devmeko.JsF.DAO;

import xyz.devmeko.JsF.Handlers.RandomStringGenerator;
import xyz.devmeko.JsF.SQL.SQLHandler;

public class FridgeDAO {

    public void addFridge(String name) throws Exception {
        String command = "INSERT INTO fridge(code, name, lastUsed) VALUES ('" + new RandomStringGenerator().generate(6) + "', '" + name + "', CURRENT_DATE);";
        SQLHandler sqlHandler = new SQLHandler();
        sqlHandler.perform(command);
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