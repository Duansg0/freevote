package com.freevote.pool;

import com.freevote.broker.MqBokerServerCentre;

import java.io.IOException;
import java.net.ServerSocket;
import java.util.concurrent.*;

public class MqBrokerServer implements Runnable {

    public Executor threadPoolExecutor = new ThreadPoolExecutor(10, 20, 30,
            TimeUnit.SECONDS, new ArrayBlockingQueue<Runnable>(40),
            Executors.defaultThreadFactory(),
            new ThreadPoolExecutor.AbortPolicy());

    public static ArrayBlockingQueue<MqBokerServerCentre> messageQueue = new ArrayBlockingQueue(10);



    @Override
    public void run() {
        while (true){
            MqBokerServerCentre mqBokerServerCentre = messageQueue.poll();
            if (null == mqBokerServerCentre){
                continue;
            }
            ServerSocket serverSocket = null;
            try {
                serverSocket = new ServerSocket(9999);
                messageQueue.offer(new MqBokerServerCentre(serverSocket.accept()));
            } catch (Exception e) {
                e.printStackTrace();
            }
            //threadPoolExecutor.execute();
        }
    }

}
