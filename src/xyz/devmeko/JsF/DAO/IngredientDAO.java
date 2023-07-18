package xyz.devmeko.JsF.DAO;

import xyz.devmeko.JsF.SQL.SQLHandler;

public class IngredientDAO {

    public String getIngredients(String fridgeCode) throws Exception {
        String jsonString = "[]";

        String command = "SELECT type, expireDate FROM ingredient WHERE fridge=\"" + fridgeCode + "\";";
        SQLHandler sqlHandler = new SQLHandler();
        jsonString = sqlHandler.queryArray(command);

        return jsonString;
    }

    public void addIngredient(String fridgeCode, String inputDate, String type) throws Exception {
//        System.out.println(date);
//        date = "2023-07-29";
        String command = "INSERT INTO ingredient(fridge, type, expireDate) VALUES ('" + fridgeCode + "', '" + type + "', STR_TO_DATE('" + inputDate + "', '%Y-%m-%d'));";
        System.out.println(command);

        SQLHandler sqlHandler = new SQLHandler();
        sqlHandler.perform(command);
    }

    public void deleteIngredient(String type, String fridgeCode) throws Exception {
        String command = "DELETE FROM ingredient WHERE type = '" + type + "' AND fridge = '" + fridgeCode + "';";
        SQLHandler sqlHandler = new SQLHandler();
        sqlHandler.perform(command);
    }
}
