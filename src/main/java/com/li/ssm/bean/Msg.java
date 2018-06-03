package com.li.ssm.bean;

import java.util.HashMap;
import java.util.Map;

public class Msg {
    //状态码 100-操作成功 200-操作失败
    private int code;
    //操作信息
    private String message;
    //用户返回给客户端的信息
    private Map<String,Object> extend=new HashMap<>();

    public static Msg sucess(){
        Msg msg=new Msg();
        msg.setCode(100);
        msg.setMessage("操作成功");
        return msg;
    }

    public static Msg fail(){
        Msg msg=new Msg();
        msg.setCode(200);
        msg.setMessage("操作失败");
        return msg;
    }

    public Msg add(String s, Object o){
        this.getExtend().put(s,o);
        return this;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Map<String, Object> getExtend() {
        return extend;
    }

    public void setExtend(Map<String, Object> extend) {
        this.extend = extend;
    }
}
