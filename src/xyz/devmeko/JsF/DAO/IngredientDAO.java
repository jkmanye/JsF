package xyz.devmeko.JsF.DAO;

import xyz.devmeko.JsF.SQL.SQLHandler;

public class IngredientDAO {

    public String getIngredients(String fridgeCode) throws Exception {
        String jsonString = "[]";

        String command = "SELECT type, addedDate, expireDate FROM ingredient WHERE fridge=\"" + fridgeCode + "\";";
        SQLHandler sqlHandler = new SQLHandler();
        jsonString = sqlHandler.queryArray(command);

        return jsonString;
    }

    public void addIngredient(String fridgeCode, Integer date, String type) throws Exception {
        String command = "INSERT INTO ingredient(fridge, type, addedDate, expireDate) VALUES ('" + fridgeCode + "', '" + type + "',  CURRENT_DATE, DATE_ADD(CURRENT_DATE, INTERVAL " + date + " day));";

        SQLHandler sqlHandler = new SQLHandler();
        sqlHandler.perform(command);
    }

    public void deleteIngredient(String type, String fridgeCode) throws Exception {
        String command = "DELETE FROM ingredient WHERE type = '" + type + "' AND fridge = '" + fridgeCode + "';";
        SQLHandler sqlHandler = new SQLHandler();
        sqlHandler.perform(command);
    }
}
