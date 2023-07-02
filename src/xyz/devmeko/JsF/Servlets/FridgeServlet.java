package xyz.devmeko.JsF.Servlets;

import org.json.JSONObject;
import xyz.devmeko.JsF.DAO.FridgeDAO;
import xyz.devmeko.JsF.DAO.IngredientDAO;
import xyz.devmeko.JsF.Handlers.ServletBodyHandler;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "FridgeAPI", urlPatterns = "/api/fridge")
public class FridgeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) {
        try {
            req.setCharacterEncoding("UTF-8");
            resp.setCharacterEncoding("UTF-8");
            resp.setContentType("application/json");

            JSONObject jsonObject = new JSONObject(ServletBodyHandler.getBody(req));
            String result = new FridgeDAO().getFridge(jsonObject.getString("fridgeCode"));

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
            String fridgeName = jsonObject.getString("fridgeName");

            new FridgeDAO().addFridge(fridgeName);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) {
        try {
            req.setCharacterEncoding("UTF-8");
            resp.setCharacterEncoding("UTF-8");
            resp.setContentType("application/json");

            JSONObject jsonObject = new JSONObject(ServletBodyHandler.getBody(req));
            String fridgeCode = jsonObject.getString("fridgeCode");

            new FridgeDAO().updateUseDate(fridgeCode);
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

            new FridgeDAO().deleteFridge(fridgeCode);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
