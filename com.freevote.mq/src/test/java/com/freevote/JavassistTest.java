package com.freevote;

import com.freevote.client.MqClient;
import javassist.util.proxy.MethodHandler;
import javassist.util.proxy.ProxyFactory;
import javassist.util.proxy.ProxyObject;

import java.lang.reflect.Method;

public class JavassistTest {
    public static void main(String[] args) {
        try {
            testJavassistFactoryProxy();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    // 代理工厂创建动态代理
    public  static  void testJavassistFactoryProxy() throws Exception {
        // 创建代理工厂
        ProxyFactory proxyFactory = new ProxyFactory();

        // 设置被代理类的类型
        proxyFactory.setSuperclass(MqClient.class);

        // 创建代理类的class
        Class<ProxyObject> proxyClass = proxyFactory.createClass();

        // 创建对象
        MqClient proxyTest = (MqClient)proxyClass.newInstance();

        ((ProxyObject) proxyTest).setHandler(new MethodHandler() {
            // 真实主题
            MqClient test = new MqClient();
            public Object invoke(Object self, Method thisMethod,
                                 Method proceed, Object[] args) throws Throwable {
                String before = "before ";
                for (Object arg : args) {
                    System.out.println(arg);
                }
                Object str = thisMethod.invoke(test, args);
                String after = " after";
                return before + str + after;
            }
        });
        String exe = proxyTest.exe("s");
        System.out.println(exe);
    }
}
