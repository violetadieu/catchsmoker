package com.dao;

import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository("sampleDAO")
public class SampleDAO extends AbstractDAO{

    public List<Map<String, Object>> selectBoardList(Map<String, Object> map) {

        return (List<Map<String, Object>>)selectList("sample.selectBoardList",map);
    }
}