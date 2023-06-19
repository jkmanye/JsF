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
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) {
        try {
            req.setCharacterEncoding("UTF-8");
            resp.setCharacterEncoding("UTF-8");
            resp.setContentType("application/json");

            JSONObject jsonObject = new JSONObject(ServletBodyHandler.getBody(req));
            String result = new IngredientDAO().getIngredients(jsonObject.getString("fridgeCode"));

            PrintWriter out = resp.getWriter();
            out.print(result);
            out.flush();
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) {
        try {
            req.setCharacterEncoding("UTF-8");
            resp.setCharacterEncoding("UTF-8");
            resp.setContentType("application/json");

            JSONObject jsonObject = new JSONObject(ServletBodyHandler.getBody(req));
            String fridgeCode = jsonObject.getString("fridgeCode");
            String type = jsonObject.getString("type");
            Integer date = jsonObject.getInt("date");
            new IngredientDAO().addIngredient(fridgeCode, date, type);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) {
        try {
            req.setCharacterEncoding("UTF-8");
            resp.setCharacterEncoding("UTF-8");
            resp.setContentType("application/json");

            JSONObject jsonObject = new JSONObject(ServletBodyHandler.getBody(req));
            String fridgeCode = jsonObject.getString("fridgeCode");
            String type = jsonObject.getString("type");

            new IngredientDAO().deleteIngredient(type, fridgeCode);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
