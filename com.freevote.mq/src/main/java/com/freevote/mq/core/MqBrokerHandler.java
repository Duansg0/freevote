package com.freevote.mq.core;

import com.freevote.mq.broker.MqBroker;
import org.apache.commons.lang3.StringUtils;

/**
 * @author Duansg
 * @dec 消息处理器
 */
public class MqBrokerHandler extends MqBroker {

    private volatile static MqBrokerHandler mqBrokerHandler;

    public MqBrokerHandler(int size) {
        super(size);
    }

    public static MqBrokerHandler build(int size) {
        if (mqBrokerHandler == null) {
            synchronized (MqBroker.class) {
                if (mqBrokerHandler == null) {
                    mqBrokerHandler = new MqBrokerHandler(10);
                }
            }
        }
        return mqBrokerHandler;
    }

    @Override
    public boolean offer(String msg) {
        if (StringUtils.isBlank(msg)){
            return false;
        }
        return messageQueue.offer(msg);
    }

    @Override
    public boolean put(String msg) {
        try {
            messageQueue.put(msg);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    @Override
    public String poll() {
        return messageQueue.poll();
    }

    @Override
    public String take() {
        try {
            return messageQueue.take();
        } catch (InterruptedException e) {
            return null;
        }
    }
}
