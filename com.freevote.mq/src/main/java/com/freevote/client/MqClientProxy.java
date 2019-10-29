//package com.freevote.client;
//
//import com.alibaba.fastjson.JSON;
//import com.freevote.context.MqHandlerContextHolder;
//import com.freevote.core.MqBrokerHandler;
//import com.freevote.core.MqClientHandler;
//import javassist.util.proxy.MethodHandler;
//import javassist.util.proxy.ProxyFactory;
//import javassist.util.proxy.ProxyObject;
//import jdk.nashorn.internal.objects.annotations.Getter;
//
//import java.lang.reflect.Method;
//import java.lang.reflect.Type;
//
//public class MqClientProxy {
//
//    /**
//     * 代理工厂创建动态代理
//     * @throws Exception
//     */
//    public static String factoryProxy(final String type) throws Exception {
//        // 创建代理工厂
//        ProxyFactory proxyFactory = new ProxyFactory();
//        // 设置被代理类的类型
//        proxyFactory.setSuperclass(MqClientHandler.class);
//        // 创建代理类的class
//        Class<ProxyObject> proxyClass = proxyFactory.createClass();
//        Method method = null;
//        if (type.startsWith("PRODUCER")){
//            method = proxyClass.getMethod("produce", String.class);
//        }else if (type.startsWith("CONSUME")){
//            method = proxyClass.getMethod("consume", String.class);
//        }
//        Object invoke = null;
//        try{
//            invoke = method.invoke(proxyClass.newInstance(), type + MqHandlerContextHolder.get());
//        }finally {
//            MqHandlerContextHolder.clearContext();
//        }
//        if(null != invoke){
//            return (String)invoke;
//        }
//        return null;
//    }
//
//}
