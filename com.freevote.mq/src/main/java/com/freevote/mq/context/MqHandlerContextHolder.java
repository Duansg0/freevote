package com.freevote.mq.context;

public class MqHandlerContextHolder {

    private static final ThreadLocal<String> CONTEXT = new ThreadLocal<String>();

    /**
     * 获取当前统一上下文
     * @return TraceContext
     */
    public static String get(){
        return CONTEXT.get();
    }

    /**
     * 清理统一上下文
     */
    public static void clearContext() {
        //set null性能优于remove
        CONTEXT.set(null);
    }

    /**
     * 设置当前统一上下文
     * @param str
     */
    public static void set(String str) {
        CONTEXT.set(str);
    }
}
