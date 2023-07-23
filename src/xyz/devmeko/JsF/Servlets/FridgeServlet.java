package xyz.devmeko.JsF.Servlets;

import org.json.JSONArray;
import org.json.JSONObject;
import xyz.devmeko.JsF.DAO.FridgeDAO;
import xyz.devmeko.JsF.DAO.IngredientDAO;
import xyz.devmeko.JsF.Handlers.ServletBodyHandler;
import xyz.devmeko.JsF.SQL.SQLHandler;

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
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) {
        try {
            req.setCharacterEncoding("UTF-8");
            resp.setCharacterEncoding("UTF-8");
            resp.setContentType("application/json");

            String body = ServletBodyHandler.getBody(req);
            System.out.println("Body: " + body);
            JSONObject jsonObject = new JSONObject(body);
            if (jsonObject.getString("action").equalsIgnoreCase("get")) {
                String result = new FridgeDAO().getFridge(jsonObject.getString("fridgeCode"));
                PrintWriter out = resp.getWriter();
                out.print(result);
                out.flush();
                out.close();
            } else if (jsonObject.getString("action").equalsIgnoreCase("add")) {
                PrintWriter out = resp.getWriter();
                out.print("{\"fridgeCode\": \"" + new FridgeDAO().addFridge(jsonObject.getString("fridgeName")) + "\"}");
                out.flush();
                out.close();
            } else if (jsonObject.getString("action").equalsIgnoreCase("update")) {
                String fridgeCode = jsonObject.getString("fridgeCode");
                new FridgeDAO().updateUseDate(fridgeCode);
                PrintWriter out = resp.getWriter();
                out.print("{\"result\": 0}");
                out.flush();
                out.close();
            } else if (jsonObject.getString("action").equalsIgnoreCase("delete")) {
                String fridgeCode = jsonObject.getString("fridgeCode");
                new FridgeDAO().deleteFridge(fridgeCode);
                PrintWriter out = resp.getWriter();
                out.print("{\"result\": 0}");
                out.flush();
                out.close();
            } else if (jsonObject.getString("action").equalsIgnoreCase("count")) {
                String fridgeCode = jsonObject.getString("fridgeCode");
                String command = "SELECT email FROM user WHERE fridges LIKE \"%" + fridgeCode + "%\";";
                String array = new SQLHandler().queryArray(command);
                System.out.println(array);
                JSONArray userJSON = new JSONArray(array);
                PrintWriter out = resp.getWriter();
                out.print("{\"length\": " + userJSON.length() + "}");
                out.flush();
                out.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
