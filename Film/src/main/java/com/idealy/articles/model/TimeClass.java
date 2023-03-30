/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.idealy.articles.model;

import java.sql.Date;
import java.sql.Time;

/**
 *
 * @author 26132
 */
public class TimeClass extends Time {
    
    public TimeClass(int hour, int minute, int second) {
        super(hour, minute, second);
    }

   
    

    public void add(Time t) {
        this.setHours(this.getHours() + t.getHours());
        this.setMinutes(this.getMinutes() + t.getMinutes());
        this.setSeconds(this.getSeconds() + t.getSeconds());
    }
 
    
}
