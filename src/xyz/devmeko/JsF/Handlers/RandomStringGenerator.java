package xyz.devmeko.JsF.Handlers;

import java.util.Random;

public class RandomStringGenerator {

    public String generate(int len) {

        String saltChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ123456789";
        StringBuffer captchaStrBuffer = new StringBuffer();
        Random rnd = new Random();

        while (captchaStrBuffer.length() < len) {
            int index = (int) (rnd.nextFloat() * saltChars.length());
            captchaStrBuffer.append(saltChars.charAt(index));
        }

        return captchaStrBuffer.toString();
    }
}
