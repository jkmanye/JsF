package xyz.devmeko.JsF.TestCodes;

import org.junit.jupiter.api.Test;
import xyz.devmeko.JsF.DAO.FridgeDAO;
import xyz.devmeko.JsF.DAO.IngredientDAO;

public class DAOTest {

    IngredientDAO ingredientDAO = new IngredientDAO();

    @Test
    public void testIngredientDAOGet() throws Exception {
        System.out.println(ingredientDAO.getIngredients("testFridgeCode"));
    }

    @Test
    public void testIngredientDAOAdd() throws Exception {
        ingredientDAO.addIngredient("testFridgeCode", 7, "두부");
    }

    @Test
    public void testIngredientDelete() throws Exception {
        ingredientDAO.deleteIngredient("양파", "testFridgeCode?");
    }


    FridgeDAO fridgeDAO = new FridgeDAO();

    @Test
    public void testFridgeAdd() throws Exception {
        fridgeDAO.addFridge("DAOTestFridge");
    }

    @Test
    public void testFridgeGet() throws Exception {
        System.out.println(fridgeDAO.getFridge("YU5EL2"));
    }

    @Test
    public void testUpdateUsedDate() throws Exception {
        fridgeDAO.updateUseDate("R6JQEM");
    }

    @Test
    public void testFridgeDelete() throws Exception {
        fridgeDAO.deleteFridge("HF7Z2FEL");
    }
}
