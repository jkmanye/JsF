package xyz.devmeko.JsF.TestCodes;

import org.junit.jupiter.api.Test;
import xyz.devmeko.JsF.DAO.AccountDAO;
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
        ingredientDAO.addIngredient("testFridgeCode", "7", "두부");
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

    AccountDAO accountDAO = new AccountDAO();

    @Test
    public void testUserAdd() throws Exception {
        accountDAO.addAccount("hychew463@gmail.com", "Jkykck66^^!@#$", "문종건");
    }

    @Test
    public void testUserLogin() throws Exception {
        System.out.println(accountDAO.login("hychew463@gmail.com", "Jkykck66^^!@#$"));
    }

    @Test
    public void testUserDelete() throws Exception {
        accountDAO.deleteAccount("hychew463@gmail.com");
    }

    @Test
    public void testUserFridgeAdd() throws Exception {
        accountDAO.addFridgeToUser("hychew463@gmail.com", "EGOZIX");
        accountDAO.addFridgeToUser("hychew463@gmail.com", "8HY4JP");
    }

    @Test
    public void testUserFridgeRemove() throws Exception {
        accountDAO.removeFridgeFromUser("hychew463@gmail.com", "EGOZIX");
    }
}
