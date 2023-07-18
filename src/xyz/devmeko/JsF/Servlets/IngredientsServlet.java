package xyz.devmeko.JsF.Servlets;

import org.json.JSONObject;
import org.json.simple.parser.JSONParser;
import xyz.devmeko.JsF.DAO.IngredientDAO;
import xyz.devmeko.JsF.Handlers.ServletBodyHandler;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "IngredientsAPI", urlPatterns = "/api/ingredients")
public class IngredientsServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) {
        try {
            req.setCharacterEncoding("UTF-8");
            resp.setCharacterEncoding("UTF-8");
            resp.setContentType("application/json");

            JSONObject jsonObject = new JSONObject(ServletBodyHandler.getBody(req));
            String action = jsonObject.getString("action");
            if (action.equalsIgnoreCase("get")) {
                String result = new IngredientDAO().getIngredients(jsonObject.getString("fridgeCode"));

                PrintWriter out = resp.getWriter();
                out.print(result);
                out.flush();
                out.close();
            } else if (action.equalsIgnoreCase("add")) {
                String fridgeCode = jsonObject.getString("fridgeCode");
                String type = jsonObject.getString("type");
                String date = jsonObject.getString("date");
                System.out.println(date);
                new IngredientDAO().addIngredient(fridgeCode, date, type);
                PrintWriter out = resp.getWriter();
                out.print("{\"result\": 0}");
                out.flush();
                out.close();
            } else if (action.equalsIgnoreCase("delete")) {
                String fridgeCode = jsonObject.getString("fridgeCode");
                String type = jsonObject.getString("type");

                new IngredientDAO().deleteIngredient(type, fridgeCode);
                PrintWriter out = resp.getWriter();
                out.print("{\"result\": 0}");
                out.flush();
                out.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
