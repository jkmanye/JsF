package xyz.devmeko.JsF.DataType;

import java.util.List;

public class Account {

    private String email;
    private String name;
    private List<Fridge> fridges;

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void addFridge(Fridge target) {
        fridges.add(target);
    }

    public void removeFridge(Fridge target) {
        if (fridges.contains(target)) fridges.remove(target);
    }
}
