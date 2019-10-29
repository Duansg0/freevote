package com.freevote.broker;

import com.freevote.core.MqBrokerHandler;
import com.freevote.core.MqClientHandler;
import com.freevote.pool.MqBrokerServer;
import org.apache.commons.lang3.StringUtils;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.concurrent.*;

/**
 * @author Duansg
 */
public class MqBokerServerCentre implements Runnable {

    private final Socket socket;

    private MqBroker mqBroker = MqBrokerHandler.build(10);

    public MqBokerServerCentre(Socket socket) {
        this.socket = socket;
    }

    /**
     * 初始化方法
     * @param port
     * @throws Exception
     */
    public void init (int port) throws Exception{

    }



    @Override
    public void run() {
        try (
                BufferedReader in = new BufferedReader(new InputStreamReader(socket.getInputStream()));
                PrintWriter out = new PrintWriter(socket.getOutputStream());
                ){
            while (true) {
                String str = in.readLine();
                if (str == null) {
                    continue;
                }
                if (str.startsWith("PRODUCER")){
                    if (str.startsWith(MqClientHandler.PRODUCER_OFFER)){
                        mqBroker.offer(str.replace(MqClientHandler.PRODUCER_OFFER,""));
                    }else if(str.startsWith(MqClientHandler.PRODUCER_PUT)){
                        mqBroker.put(str.replace(MqClientHandler.PRODUCER_PUT,""));
                    }
                }else if (str.startsWith("CONSUME")){
                    String message = null;
                    if (str.startsWith(MqClientHandler.CONSUME_TAKE)){
                        message = mqBroker.take();
                    }else if (str.startsWith(MqClientHandler.CONSUME_POLL)){
                        message = mqBroker.poll();
                    }
                    if (StringUtils.isNotBlank(message)){
                        out.println(message);
                        out.flush();
                    }
                }else {
                    //log.info("协议异常");
                }
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static void main(String[] args) throws Exception{

        ServerSocket serverSocket = new ServerSocket(9999);
        new Thread(new MqBokerServerCentre(serverSocket.accept())).start();
    }
}
