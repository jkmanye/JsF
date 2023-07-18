package xyz.devmeko.JsF.SQL;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.sql.*;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

public class SQLHandler {

    Connection connection;

    public SQLHandler() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
    }

    public void perform(String statementString) throws Exception {
        connection = DriverManager.getConnection("jdbc:mysql://sql6.freemysqlhosting.net:3306/sql6633558", SQLPasswordManager.ID, SQLPasswordManager.PASSWORD);
        Statement statement = connection.createStatement();
        statement.executeUpdate(statementString);

        statement.close();
        connection.close();
    }

    public String queryObj(String statementString) throws Exception {
        connection = DriverManager.getConnection("jdbc:mysql://sql6.freemysqlhosting.net:3306/sql6633558", SQLPasswordManager.ID, SQLPasswordManager.PASSWORD);
        String jsonString = "[]";

        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(statementString);
        ResultSetMetaData md = resultSet.getMetaData();

        int numCols = md.getColumnCount();
        List<String> colNames = IntStream.range(0, numCols)
                .mapToObj(i -> {
                    try {
                        return md.getColumnName(i + 1);
                    } catch (SQLException e) {
                        e.printStackTrace();
                        return "?";
                    }
                })
                .collect(Collectors.toList());

        JSONObject result = new JSONObject();

        while (resultSet.next()) {
            colNames.forEach(cn -> {
                try {
                    result.put(cn, resultSet.getObject(cn));
                } catch (JSONException | SQLException e) {
                    e.printStackTrace();
                }
            });
        }

        jsonString = result.toString();

        resultSet.close();
        statement.close();
        connection.close();

        return jsonString;
    }

    public String queryArray(String statementString) throws Exception {
        connection = DriverManager.getConnection("jdbc:mysql://sql6.freemysqlhosting.net:3306/sql6633558", SQLPasswordManager.ID, SQLPasswordManager.PASSWORD);
        String jsonString = "[]";

        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(statementString);
        ResultSetMetaData md = resultSet.getMetaData();

        int numCols = md.getColumnCount();
        List<String> colNames = IntStream.range(0, numCols)
                .mapToObj(i -> {
                    try {
                        return md.getColumnName(i + 1);
                    } catch (SQLException e) {
                        e.printStackTrace();
                        return "?";
                    }
                })
                .collect(Collectors.toList());

        JSONArray result = new JSONArray();
        while (resultSet.next()) {
            JSONObject row = new JSONObject();
            colNames.forEach(cn -> {
                try {
                    row.put(cn, resultSet.getObject(cn));
                } catch (JSONException | SQLException e) {
                    e.printStackTrace();
                }
            });
            result.put(row);
        }

        jsonString = result.toString();

        resultSet.close();
        statement.close();
        connection.close();

        return jsonString;
    }
}
