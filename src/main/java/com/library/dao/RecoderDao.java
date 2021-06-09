package com.library.dao;


import org.mybatis.spring.SqlSessionTemplate;

import javax.annotation.Resource;
import java.util.ArrayList;

public class RecoderDao {
    private final static String NAMESPACE = "com.library.dao.RecoderDao";

    @Resource
    private SqlSessionTemplate sqlSessionTemplate;

    public ArrayList<Recod>
}
