package com.library.bean;

import java.io.Serializable;
import java.util.Date;

public class ReaderInfo implements Serializable {

    private long reader_id;
    private String name;
    private String sex;
    private Date birth;
    private String address;
    private String phone;
    private int level;

    public long getReader_id() {
        return reader_id;
    }

    public void setReader_id(long reader_id) {
        this.reader_id = reader_id;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public long getReaderId() {
        return reader_id;
    }

    public void setReaderId(long reader_id) {
        this.reader_id = reader_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Date getBirth() {
        return birth;
    }

    public void setBirth(Date birth) {
        this.birth = birth;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

}
