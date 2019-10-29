package com.freevote.client;

import com.alibaba.fastjson.JSON;
import com.freevote.context.MqHandlerContextHolder;
import com.freevote.core.MqClientHandler;
import javassist.util.proxy.MethodHandler;
import javassist.util.proxy.ProxyObject;

import java.lang.reflect.Method;

/**
 * MQ客户端
 */
public class MqClient {

    /**
     * 生产消息
     * @dec 可以容纳,则返回 true,否则返回false
     * @param message
     */
    public static void producerOffer(String message)throws Exception{
        MqClientHandler.produce(MqClientHandler.PRODUCER_OFFER + message);
    }



    /**
     * 生产消息
     * @dec 调用此方法的线程被阻断直到messageQueue里面有空间再继续存放
     * @param message
     */
    public static void producerPut(String message)throws Exception{
        MqClientHandler.produce(MqClientHandler.PRODUCER_PUT + message);
    }

    /**
     * 消费消息
     * @dec 取走messageQueue里排在首位的消息,取不到返回空
     * @return
     * @throws Exception
     */
    public static String consumePoll() throws Exception {
        return MqClientHandler.consume(MqClientHandler.CONSUME_POLL);
    }

    /**
     * 消费消息
     * @dec 取走messageQueue里排在首位的消息,取不到阻断进入等待状态直到messageQueue有新消息被加入
     * @return
     * @throws Exception
     */
    public static String consumeTake() throws Exception {
        return MqClientHandler.consume(MqClientHandler.CONSUME_TAKE);
    }

    public static void main(String[] args) throws Exception{
      //MqClient.producerPut("发送消息");

                String s = MqClient.consumeTake();
        System.out.println(s);
    }

}
