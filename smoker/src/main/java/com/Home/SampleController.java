package com.Home;

import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.annotation.Resource;

import com.service.SmokeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.service.SmokeService;
@Controller
public class SampleController {
    Logger log = Logger.getLogger(String.valueOf(this.getClass()));

    @Resource(name="smokeService")
    private SmokeService smokeService;

    @RequestMapping(value="/",method = RequestMethod.POST )
    public ModelAndView openSampleBoardList(Map<String,Object> commandMap) throws Exception{
        ModelAndView mv = new ModelAndView("Home");

        List<Map<String,Object>> list = smokeService.selectBoardList(commandMap);
        mv.addObject("list", list);

        return mv;
    }
}
