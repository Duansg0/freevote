package com.freevote.core;

import com.freevote.broker.MqBokerServerCentre;
import com.freevote.context.MqHandlerContextHolder;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.net.Socket;

public class MqClientHandler {

    public static final String PRODUCER_PUT = "PRODUCER_PUT";

    public static final String PRODUCER_OFFER = "PRODUCER_OFFER";

    public static final String CONSUME_TAKE = "CONSUME_TAKE";

    public static final String CONSUME_POLL = "CONSUME_POLL";

    /**
     * 生产消息
     * @param message
     */
    public static void produce(String message){
        PrintWriter out = null;
        try{
            Socket socket = new Socket(InetAddress.getLocalHost(), 9999);
            out = new PrintWriter(socket.getOutputStream());
            out.println(message);
            out.flush();
            //socket.close();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            if (out!=null){
                out.close();
            }
        }
    }

    /**
     * 消费消息
     */
    public static String consume(String message){
        PrintWriter out = null;
        BufferedReader in = null;
        try{
            Socket socket = new Socket(InetAddress.getLocalHost(), 9999);
            in = new BufferedReader(new InputStreamReader(socket.getInputStream()));
            out = new PrintWriter(socket.getOutputStream());
            out.println(message);
            out.flush();
            String str = in.readLine();
            out.close();
            in.close();
            //socket.close();
            return str;
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }


}
