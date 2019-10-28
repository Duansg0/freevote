//package com.freevote;
//
//import static org.junit.Assert.assertTrue;
//
//import com.freevote.client.MqClient;
//import org.junit.Test;
//
///**
// * Unit test for simple App.
// */
//public class AppTest {
//    /**
//     * Rigorous Test :-)
//     */
//    @Test
//    public void produce(){
//        MqClient client = new MqClient();
//        try {
//            client.produce("SEND:Hello World");
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }
//
//    @Test
//    public void consume(){
//        MqClient client = new MqClient();
//        String message = null;
//        try {
//            message = client.consume();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//        System.out.println("获取的消息为：" + message);
//    }
//
//}
