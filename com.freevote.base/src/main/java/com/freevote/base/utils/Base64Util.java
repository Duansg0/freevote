package com.freevote.base.utils;

import org.apache.commons.codec.binary.Base64;

import java.io.UnsupportedEncodingException;

public class Base64Util {

    public static void main(String[] args) {
            //String a = "9999";
//            for (int i = 1000; i < 10000; i++) {

//                String a = String.valueOf(i);
//                String encode = Base64Util.encode(a);
//                System.out.println(encode);
//                String decode = Base64Util.decode("5q61546L54i377yf");
//                System.out.println(decode);
//            }
        String decode = Base64Util.decode("5q61546L54i377yf");
        System.out.println(decode);
    }

    /**
     * 编码
     * @param str
     * @return
     */
    public static String encode(String str){
        Base64 base64 = new Base64();
        try{
            byte[] bytes = str.getBytes("UTF-8");
            return base64.encodeToString(bytes);
        }catch (Exception e){
            return null;
        }
    }

    /**
     * 解码
     * @param str
     * @return
     */
    public static String decode(String str){
        Base64 base64 = new Base64();
        try {
            return  new String(base64.decode(str), "UTF-8");
        } catch (UnsupportedEncodingException e) {
            return null;
        }
    }


}
