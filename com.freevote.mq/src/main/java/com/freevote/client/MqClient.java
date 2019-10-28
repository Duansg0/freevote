package com.freevote.client;

import com.freevote.broker.MqBokerServerCentre;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.net.Socket;

public class MqClient {

    public String exe(String str){
        return "SUCCESS" +str;
    }


        //生产消息
    public static void producer(String message){
        PrintWriter out = null;
        try{
            Socket socket = new Socket(InetAddress.getLocalHost(), MqBokerServerCentre.SERVICE_PORT);
            out = new PrintWriter(socket.getOutputStream());
            out.println("SNED" + message);
            out.flush();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            if (out!=null){
                out.close();
            }
        }
    }

    //消费消息
    public static String consume() throws Exception {
        Socket socket = new Socket(InetAddress.getLocalHost(), MqBokerServerCentre.SERVICE_PORT);
        try (
                BufferedReader in = new BufferedReader(new InputStreamReader(
                        socket.getInputStream()));
                PrintWriter out = new PrintWriter(socket.getOutputStream())
        ) {
            //先向消息队列发送命令
            out.println("CONSUME");
            out.flush();

            //再从消息队列获取一条消息
            String message = in.readLine();

            return message;
        }
    }
}
