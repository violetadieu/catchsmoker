package com.service;

import java.util.List;
import java.util.Map;

public interface SmokeService {

    List<Map<String, Object>> selectBoardList(Map<String, Object> Map) throws Exception;
}
