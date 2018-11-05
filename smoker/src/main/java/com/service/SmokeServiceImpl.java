package com.service;

import com.dao.AbstractDAO;
import com.dao.SampleDAO;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

@Service("smokeService")
public class SmokeServiceImpl implements SmokeService{

    Logger log=Logger.getLogger(String.valueOf(this.getClass()));

    private SampleDAO sampleDAO;

    @Override
    public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception {
        return sampleDAO.selectBoardList(map);
    }
}
