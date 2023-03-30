/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.idealy.articles.model;

import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;

/**
 *
 * @author 26132
 */
public class TimestampClass extends Timestamp {

    public TimestampClass(int year, int month, int date, int hour, int minute, int second, int nano) {
        super(year, month, date, hour, minute, second, nano);
    }

    public void add(Time t) {
        this.setHours(this.getHours() + t.getHours());
        this.setMinutes(this.getMinutes() + t.getMinutes());
        this.setSeconds(this.getSeconds() + t.getSeconds());

    }

    public TimestampClass(long time) {
        super(time);
    }

    public Date toDate() {
        Date ret = new Date(this.getTime());
//        ut.println("Date realistion navadika = " + ret);
        return ret;
    }
    public int diff(Date d){
        return 0;
    }

}
