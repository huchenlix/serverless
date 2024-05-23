package com.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Map;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import com.utils.ValidatorUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.*;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.annotation.IgnoreAuth;

import com.entity.XianluleixingEntity;
import com.entity.view.XianluleixingView;

import com.service.XianluleixingService;
import com.service.TokenService;
import com.utils.PageUtils;
import com.utils.R;
import com.utils.MD5Util;
import com.utils.MPUtil;
import com.utils.CommonUtil;
import java.io.IOException;
import java.util.stream.Collectors;

/**
 * 线路类型
 * 后端接口
 * @author 
 * @email 
 * @date 
 */
@RestController
@RequestMapping("/xianluleixing")
public class XianluleixingController {
    @Autowired
    private XianluleixingService xianluleixingService;


    @GetMapping("/getPie")
    public R getPie(){
        List<XianluleixingEntity> xiangmufenleiEntities = xianluleixingService.selectList(null).stream().distinct().collect(Collectors.toList());
        List<Object> list = new ArrayList<>();

        xiangmufenleiEntities.forEach(entity ->{
            HashMap<String, Object> temp = new HashMap<>();
            temp.put("value", entity.getId());
            temp.put("name", entity.getXianluleixing());
            list.add(temp);
        });


        return R.ok().put("data",list);
    }


    /**
     * 后端列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,XianluleixingEntity xianluleixing,
		HttpServletRequest request){
        EntityWrapper<XianluleixingEntity> ew = new EntityWrapper<XianluleixingEntity>();

		PageUtils page = xianluleixingService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, xianluleixing), params), params));

        return R.ok().put("data", page);
    }
    
    /**
     * 前端列表
     */
	@IgnoreAuth
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params,XianluleixingEntity xianluleixing, 
		HttpServletRequest request){
        EntityWrapper<XianluleixingEntity> ew = new EntityWrapper<XianluleixingEntity>();

		PageUtils page = xianluleixingService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, xianluleixing), params), params));
        return R.ok().put("data", page);
    }

	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( XianluleixingEntity xianluleixing){
       	EntityWrapper<XianluleixingEntity> ew = new EntityWrapper<XianluleixingEntity>();
      	ew.allEq(MPUtil.allEQMapPre( xianluleixing, "xianluleixing")); 
        return R.ok().put("data", xianluleixingService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(XianluleixingEntity xianluleixing){
        EntityWrapper< XianluleixingEntity> ew = new EntityWrapper< XianluleixingEntity>();
 		ew.allEq(MPUtil.allEQMapPre( xianluleixing, "xianluleixing")); 
		XianluleixingView xianluleixingView =  xianluleixingService.selectView(ew);
		return R.ok("查询线路类型成功").put("data", xianluleixingView);
    }
	
    /**
     * 后端详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        XianluleixingEntity xianluleixing = xianluleixingService.selectById(id);
        return R.ok().put("data", xianluleixing);
    }

    /**
     * 前端详情
     */
	@IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id){
        XianluleixingEntity xianluleixing = xianluleixingService.selectById(id);
        return R.ok().put("data", xianluleixing);
    }
    



    /**
     * 后端保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody XianluleixingEntity xianluleixing, HttpServletRequest request){
    	xianluleixing.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(xianluleixing);
        xianluleixingService.insert(xianluleixing);
        return R.ok();
    }
    
    /**
     * 前端保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody XianluleixingEntity xianluleixing, HttpServletRequest request){
    	xianluleixing.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(xianluleixing);
        xianluleixingService.insert(xianluleixing);
        return R.ok();
    }



    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    public R update(@RequestBody XianluleixingEntity xianluleixing, HttpServletRequest request){
        //ValidatorUtils.validateEntity(xianluleixing);
        xianluleixingService.updateById(xianluleixing);//全部更新
        return R.ok();
    }
    

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        xianluleixingService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }
    
    /**
     * 提醒接口
     */
	@RequestMapping("/remind/{columnName}/{type}")
	public R remindCount(@PathVariable("columnName") String columnName, HttpServletRequest request, 
						 @PathVariable("type") String type,@RequestParam Map<String, Object> map) {
		map.put("column", columnName);
		map.put("type", type);
		
		if(type.equals("2")) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Calendar c = Calendar.getInstance();
			Date remindStartDate = null;
			Date remindEndDate = null;
			if(map.get("remindstart")!=null) {
				Integer remindStart = Integer.parseInt(map.get("remindstart").toString());
				c.setTime(new Date()); 
				c.add(Calendar.DAY_OF_MONTH,remindStart);
				remindStartDate = c.getTime();
				map.put("remindstart", sdf.format(remindStartDate));
			}
			if(map.get("remindend")!=null) {
				Integer remindEnd = Integer.parseInt(map.get("remindend").toString());
				c.setTime(new Date());
				c.add(Calendar.DAY_OF_MONTH,remindEnd);
				remindEndDate = c.getTime();
				map.put("remindend", sdf.format(remindEndDate));
			}
		}
		
		Wrapper<XianluleixingEntity> wrapper = new EntityWrapper<XianluleixingEntity>();
		if(map.get("remindstart")!=null) {
			wrapper.ge(columnName, map.get("remindstart"));
		}
		if(map.get("remindend")!=null) {
			wrapper.le(columnName, map.get("remindend"));
		}


		int count = xianluleixingService.selectCount(wrapper);
		return R.ok().put("count", count);
	}
	








}
