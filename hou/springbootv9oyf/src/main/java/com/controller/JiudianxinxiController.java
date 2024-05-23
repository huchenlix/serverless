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

import com.entity.JiudianxinxiEntity;
import com.entity.view.JiudianxinxiView;

import com.service.JiudianxinxiService;
import com.service.TokenService;
import com.utils.PageUtils;
import com.utils.R;
import com.utils.MD5Util;
import com.utils.MPUtil;
import com.utils.CommonUtil;
import java.io.IOException;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.stream.Collectors;

import com.service.StoreupService;
import com.entity.StoreupEntity;

/**
 * 酒店信息
 * 后端接口
 * @author 
 * @email 
 * @date 
 */
@RestController
@RequestMapping("/jiudianxinxi")
public class JiudianxinxiController {
    @Autowired
    private JiudianxinxiService jiudianxinxiService;

    @Autowired
    private StoreupService storeupService;



    @GetMapping("/getZhuxingtu")
    public R getZhuxingtu(){
        List<JiudianxinxiEntity> allList = jiudianxinxiService.selectList(null);
        List<String> nameList = allList.stream().map(JiudianxinxiEntity::getJiudianmingcheng).distinct().collect(Collectors.toList());

        List<AtomicInteger> ydata = new ArrayList<>();
        HashMap<String, Object> map = new HashMap<>();
        map.put("xData",nameList);

        nameList.forEach(item ->{
            AtomicInteger count = new AtomicInteger();
            allList.forEach(itemInner ->{
                if (itemInner.getJiudianmingcheng().equals(item)) {
                    count.getAndIncrement();
                }
            });
            ydata.add(count);
        });
        map.put("ydata",ydata);

        return R.ok().put("data",map);
    }

    /**
     * 后端列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,JiudianxinxiEntity jiudianxinxi,
                @RequestParam(required = false) Double kefangjiagestart,
                @RequestParam(required = false) Double kefangjiageend,
		HttpServletRequest request){
        EntityWrapper<JiudianxinxiEntity> ew = new EntityWrapper<JiudianxinxiEntity>();
                if(kefangjiagestart!=null) ew.ge("kefangjiage", kefangjiagestart);
                if(kefangjiageend!=null) ew.le("kefangjiage", kefangjiageend);

		PageUtils page = jiudianxinxiService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, jiudianxinxi), params), params));

        return R.ok().put("data", page);
    }
    
    /**
     * 前端列表
     */
	@IgnoreAuth
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params,JiudianxinxiEntity jiudianxinxi, 
                @RequestParam(required = false) Double kefangjiagestart,
                @RequestParam(required = false) Double kefangjiageend,
		HttpServletRequest request){
        EntityWrapper<JiudianxinxiEntity> ew = new EntityWrapper<JiudianxinxiEntity>();
                if(kefangjiagestart!=null) ew.ge("kefangjiage", kefangjiagestart);
                if(kefangjiageend!=null) ew.le("kefangjiage", kefangjiageend);

		PageUtils page = jiudianxinxiService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, jiudianxinxi), params), params));
        return R.ok().put("data", page);
    }

	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( JiudianxinxiEntity jiudianxinxi){
       	EntityWrapper<JiudianxinxiEntity> ew = new EntityWrapper<JiudianxinxiEntity>();
      	ew.allEq(MPUtil.allEQMapPre( jiudianxinxi, "jiudianxinxi")); 
        return R.ok().put("data", jiudianxinxiService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(JiudianxinxiEntity jiudianxinxi){
        EntityWrapper< JiudianxinxiEntity> ew = new EntityWrapper< JiudianxinxiEntity>();
 		ew.allEq(MPUtil.allEQMapPre( jiudianxinxi, "jiudianxinxi")); 
		JiudianxinxiView jiudianxinxiView =  jiudianxinxiService.selectView(ew);
		return R.ok("查询酒店信息成功").put("data", jiudianxinxiView);
    }
	
    /**
     * 后端详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        JiudianxinxiEntity jiudianxinxi = jiudianxinxiService.selectById(id);
        return R.ok().put("data", jiudianxinxi);
    }

    /**
     * 前端详情
     */
	@IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id){
        JiudianxinxiEntity jiudianxinxi = jiudianxinxiService.selectById(id);
        return R.ok().put("data", jiudianxinxi);
    }
    



    /**
     * 后端保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody JiudianxinxiEntity jiudianxinxi, HttpServletRequest request){
    	jiudianxinxi.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(jiudianxinxi);
        jiudianxinxiService.insert(jiudianxinxi);
        return R.ok();
    }
    
    /**
     * 前端保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody JiudianxinxiEntity jiudianxinxi, HttpServletRequest request){
    	jiudianxinxi.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(jiudianxinxi);
        jiudianxinxiService.insert(jiudianxinxi);
        return R.ok();
    }



    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    public R update(@RequestBody JiudianxinxiEntity jiudianxinxi, HttpServletRequest request){
        //ValidatorUtils.validateEntity(jiudianxinxi);
        jiudianxinxiService.updateById(jiudianxinxi);//全部更新
        return R.ok();
    }
    

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        jiudianxinxiService.deleteBatchIds(Arrays.asList(ids));
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
		
		Wrapper<JiudianxinxiEntity> wrapper = new EntityWrapper<JiudianxinxiEntity>();
		if(map.get("remindstart")!=null) {
			wrapper.ge(columnName, map.get("remindstart"));
		}
		if(map.get("remindend")!=null) {
			wrapper.le(columnName, map.get("remindend"));
		}


		int count = jiudianxinxiService.selectCount(wrapper);
		return R.ok().put("count", count);
	}


    /**
     * （按值统计）时间统计类型
     */
    @RequestMapping("/value/{xColumnName}/{yColumnName}/{timeStatType}")
    public R valueDay(@PathVariable("yColumnName") String yColumnName, @PathVariable("xColumnName") String xColumnName, @PathVariable("timeStatType") String timeStatType,HttpServletRequest request) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("xColumn", xColumnName);
        params.put("yColumn", yColumnName);
        params.put("timeStatType", timeStatType);
        EntityWrapper<JiudianxinxiEntity> ew = new EntityWrapper<JiudianxinxiEntity>();
        String tableName = request.getSession().getAttribute("tableName").toString();
        if(tableName.equals("yonghu")) {
            ew.eq("zhanghao", (String)request.getSession().getAttribute("username"));
        }
        List<Map<String, Object>> result = jiudianxinxiService.selectTimeStatValue(params, ew);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        for(Map<String, Object> m : result) {
            for(String k : m.keySet()) {
                if(m.get(k) instanceof Date) {
                    m.put(k, sdf.format((Date)m.get(k)));
                }
            }
        }
        return R.ok().put("data", result);
    }

    /**
     * 总数量
     */
    @RequestMapping("/count")
    public R count(@RequestParam Map<String, Object> params,JiudianxinxiEntity jiudianxinxi, HttpServletRequest request){
//        String tableName = request.getSession().getAttribute("tableName").toString();
//        if(tableName.equals("yonghu")) {
//            qingxidingdan.set((String)request.getSession().getAttribute("username"));
//        }
        EntityWrapper<JiudianxinxiEntity> ew = new EntityWrapper<JiudianxinxiEntity>();
        int count = jiudianxinxiService.selectCount(MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, jiudianxinxi), params), params));
        return R.ok().put("data", count);
    }




}
