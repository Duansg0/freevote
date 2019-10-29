package com.freevote.mq.broker;

import java.util.concurrent.ArrayBlockingQueue;

/**
 * @author Duansg
 * @date 2019-10-29
 * @dec 消息处理中心，负责[存储/消费/发送]消息
 */
public abstract class MqBroker {
    /**
     * 消息存储
     */
    public static ArrayBlockingQueue<String> messageQueue ;

    public MqBroker(int size) {
        messageQueue =  new ArrayBlockingQueue(size);
    }

    /**
     * 生产消息
     * @dec 可以容纳,则返回 true,否则返回false
     * @param msg
     */
    public abstract boolean offer(String msg);
    /**
     * 生产消息
     * @dec 调用此方法的线程被阻断直到messageQueue里面有空间再继续存放
     * @param msg
     */
    public abstract boolean put(String msg);
    /**
     * 消费消息
     * @dec 取走messageQueue里排在首位的消息,取不到返回空
     */
    public abstract String poll();
    /**
     * 消费消息
     * @dec 取走messageQueue里排在首位的消息,取不到阻断进入等待状态直到messageQueue有新消息被加入
     */
    public abstract String take();

}
