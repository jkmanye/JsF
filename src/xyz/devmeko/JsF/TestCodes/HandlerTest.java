package xyz.devmeko.JsF.TestCodes;

import org.junit.jupiter.api.Test;
import xyz.devmeko.JsF.Handlers.SaltHandler;

public class HandlerTest {

    @Test
    public void saltHandlerTest() {
        System.out.println(new SaltHandler().toSalt(1234546483));
    }


}
