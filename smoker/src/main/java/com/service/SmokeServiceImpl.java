package com.service;

import com.dao.AbstractDAO;
import com.dao.SampleDAO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

@Service("smokeService")
public class SmokeServiceImpl implements SmokeService{

    Logger log=Logger.getLogger(String.valueOf(this.getClass()));

    @Resource(name="sampleDAO")
    private SampleDAO sampleDAO;

    @Override
    public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception {
        return sampleDAO.selectBoardList(map);
    }
}
