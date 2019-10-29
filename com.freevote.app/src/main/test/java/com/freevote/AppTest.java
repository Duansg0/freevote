package com.freevote;

import com.freevote.mq.broker.MqBokerServerCentre;
import com.freevote.mq.client.MqClient;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
public class AppTest {

    @Autowired
    MqBokerServerCentre mqBokerServerCentre;

    @Test
    public void run() throws Exception{
//        mqBokerServerCentre.execute(MqClientHandler.PRODUCER_OFFER + "1");
//        String s = mqBokerServerCentre.execute(MqClientHandler.CONSUME_POLL);
        for (int i = 0; i < 10; i++) {
            MqClient.producerOffer("q" + i);
        }
        for (int i = 0; i < 10; i++) {
            String s = MqClient.consumePoll();
            System.err.println(s);
        }

     // System.out.println(s);
    }
}
