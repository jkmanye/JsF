package xyz.devmeko.JsF.Servlets;

import org.json.JSONObject;
import xyz.devmeko.JsF.DAO.AccountDAO;
import xyz.devmeko.JsF.DAO.IngredientDAO;
import xyz.devmeko.JsF.Handlers.ServletBodyHandler;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

@WebServlet(name = "UserAPI", urlPatterns = "/api/user")
public class UserServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) {
        try {
            req.setCharacterEncoding("UTF-8");
            resp.setCharacterEncoding("UTF-8");
            resp.setContentType("application/json");

            JSONObject jsonObject = new JSONObject(ServletBodyHandler.getBody(req));
            String action = jsonObject.getString("action");
            if (action.equalsIgnoreCase("register")) {
                new AccountDAO().addAccount(jsonObject.getString("email"), jsonObject.getString("password"), jsonObject.getString("name"));
                PrintWriter out = resp.getWriter();
                out.print("{\"email\": \"" + jsonObject.getString("email") + "\"}");
                out.flush();
                out.close();
            } else if (action.equalsIgnoreCase("login")) {
                PrintWriter out = resp.getWriter();
                out.print(new AccountDAO().login(jsonObject.getString("email"), jsonObject.getString("password")));
                out.flush();
                out.close();
            } else if (action.equalsIgnoreCase("delete")) {
                new AccountDAO().deleteAccount(jsonObject.getString("email"));
            } else if (action.equalsIgnoreCase("addFridge")) {
                new AccountDAO().addFridgeToUser(jsonObject.getString("email"), jsonObject.getString("fridgeCode"));
                PrintWriter out = resp.getWriter();
                out.print("{\"result\": 0}");
                out.flush();
                out.close();
            } else if (action.equalsIgnoreCase("removeFridge")) {
                new AccountDAO().removeFridgeFromUser(jsonObject.getString("email"), jsonObject.getString("fridgeCode"));
                PrintWriter out = resp.getWriter();
                out.print("{\"result\": 0}");
                out.flush();
                out.close();
            } else if (action.equalsIgnoreCase("getFridge")) {
                PrintWriter out = resp.getWriter();
                out.print(new AccountDAO().getUserFridge(jsonObject.getString("email")));
                out.flush();
                out.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
