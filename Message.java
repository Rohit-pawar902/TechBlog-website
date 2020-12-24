/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.tech.entities;

/**
 *
 * @author DELL
 */
public class Message {
  private String content;
  private String type;
  private String cssMsg;

    public Message(String content, String type, String cssMsg) {
        this.content = content;
        this.type = type;
        this.cssMsg = cssMsg;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getCssMsg() {
        return cssMsg;
    }

    public void setCssMsg(String cssMsg) {
        this.cssMsg = cssMsg;
    }
          
          
}
