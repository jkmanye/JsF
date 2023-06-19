package xyz.devmeko.JsF.Handlers;

public class SaltHandler {

    //⓪①②③④⑤⑥⑦⑧⑨

    public String toSalt(Integer number) {
        return number.toString().replace("0", "⓪")
                .replace("1", "①")
                .replace("2", "②")
                .replace("3", "③")
                .replace("4", "④")
                .replace("5", "⑤")
                .replace("6", "⑥")
                .replace("7", "⑦")
                .replace("8", "⑧")
                .replace("9", "⑨");
    }
}
