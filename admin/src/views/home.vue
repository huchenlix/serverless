<template>
<div class="content">
	<div class="text" :style='{"margin":"30px auto","fontSize":"24px","color":"rgb(51, 51, 51)","textAlign":"center","fontWeight":"bold"}'>欢迎使用 {{this.$project.projectName}}后台</div>
  <div class="cardView">


      <div class="cards" :style='{"alignItems":"center","background":"none","display":"flex","width":"100%","justifyContent":"center"}'>
        <div :style='{"border":"0px solid #ccc","margin":"0 0px 10px","borderRadius":"0px","background":"none","display":"flex","width":"80%","justifyContent":"center"}' v-if="Check">
          <div class="bgc"  ></div>
          <div :style='{"borderColor":"#c7ebdb","alignItems":"center","flexDirection":"column","background":"#fff","borderWidth":"1px","display":"flex","width":"auto","minWidth":"50%","borderStyle":"solid","justifyContent":"center"}'>
            <div :style='{"margin":"5px 0","lineHeight":"24px","fontSize":"20px","color":"#333","fontWeight":"bold","height":"24px"}'>{{jingdianxinxiCount}}</div>
            <div :style='{"margin":"5px 0","lineHeight":"24px","fontSize":"16px","color":"#666","height":"24px"}'>景点总数</div>
          </div>
        </div>
        <div :style='{"border":"0px solid #ccc","margin":"0 0px 10px","borderRadius":"0px","background":"none","display":"flex","width":"80%","justifyContent":"center"}' v-if="Check">
          <div class="bgc1" ></div>
          <div :style='{"borderColor":"#c7ebdb","alignItems":"center","flexDirection":"column","background":"#fff","borderWidth":"1px","display":"flex","width":"auto","minWidth":"50%","borderStyle":"solid","justifyContent":"center"}'>
            <div :style='{"margin":"5px 0","lineHeight":"24px","fontSize":"20px","color":"#333","fontWeight":"bold","height":"24px"}'>{{jipiaoxinxiCount}}</div>
            <div :style='{"margin":"5px 0","lineHeight":"24px","fontSize":"16px","color":"#666","height":"24px"}'>机票总数</div>
          </div>
        </div>
        <div :style='{"border":"0px solid #ccc","margin":"0 0px 10px","borderRadius":"0px","background":"none","display":"flex","width":"80%","justifyContent":"center"}' v-if="Check">
          <div class="bgc2" ></div>
          <div :style='{"borderColor":"#c7ebdb","alignItems":"center","flexDirection":"column","background":"#fff","borderWidth":"1px","display":"flex","width":"auto","minWidth":"50%","borderStyle":"solid","justifyContent":"center"}'>
            <div :style='{"margin":"5px 0","lineHeight":"24px","fontSize":"20px","color":"#333","fontWeight":"bold","height":"24px"}'>{{jiudianxinxiCount}}</div>
            <div :style='{"margin":"5px 0","lineHeight":"24px","fontSize":"16px","color":"#666","height":"24px"}'>酒店总数</div>
          </div>
        </div>
        <div class="cards" :style='{"alignItems":"center","background":"none","display":"flex","width":"100%","justifyContent":"center"}'>
          <div :style='{"border":"0px solid #ccc","margin":"0 0px 10px","borderRadius":"0px","background":"none","display":"flex","width":"80%","justifyContent":"center"}' v-if="Check">
            <div class="bgc3"></div>
            <div :style='{"borderColor":"#c7ebdb","alignItems":"center","flexDirection":"column","background":"#fff","borderWidth":"1px","display":"flex","width":"auto","minWidth":"50%","borderStyle":"solid","justifyContent":"center"}'>
              <div :style='{"margin":"5px 0","lineHeight":"24px","fontSize":"20px","color":"#333","fontWeight":"bold","height":"24px"}'>{{lvyouxianluCount}}</div>
              <div :style='{"margin":"5px 0","lineHeight":"24px","fontSize":"16px","color":"#666","height":"24px"}'>路线总数</div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div style="display: flex;align-items: center;width: 100%;margin-bottom: 10px;">
      <el-card style="width: 33.3%;margin: 0 10px;"  v-if="Check"  >
        <div id="qingxidingdanChart1" style="width:100%;height:400px;"></div>
      </el-card>
      <el-card style="width: 33.3%;margin: 0 10px;" v-if="Check">
        <div id="qingxidingdanChart2" style="width:100%;height:400px;"></div>
      </el-card>
      <el-card style="width: 33.3%;margin: 0 10px;" v-if="Check">
        <div id="qingxidingdanChart3" style="width:100%;height:400px;"></div>
      </el-card>
    </div>
    <div  style="width: 100%;height: 220px;background:#fff;margin-top: 70px" id="zhexian"  v-if="Check"></div>
    <div class="echart" id="mychart" :style="myChartStyle"  v-if="Check"></div>
    <div class="echart" id="mychart1" :style="myChartStyle"  v-if="Check"></div>
  </div>

</template>
<script>
//0
import router from '@/router/router-static'
import * as echarts from 'echarts'
import storage from '../utils/storage';
export default {
	data() {
		return {
      jiudianxinxiCount:0,
      lvyouxianluCount:0,
      jipiaoxinxiCount:0,
      jingdianxinxiCount:0,
      xData: ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"], //横坐标
      yData: [23, 24, 18, 25, 27, 28, 25], //数据
      myChart: {},
      pieData: [],
      pieName: [],
      myChartStyle: {float: "left", width: "100%", height: "400px"} //图表样式
		};
	},
  computed: {
    // eslint-disable-next-line vue/return-in-computed-property
    Check() {
      let roleb = false;
      let role = storage.get("role");
      // eslint-disable-next-line no-empty
       if(role=='管理员') {
         return roleb =true;
       }

    }
  },
  mounted(){
    this.init();
    if(storage.get("role")=='管理员') {
      this.JipiaoxinxiCount();
      this.LvyouxianluCount();
      this.JiudianxinxiCount();
      this.remenjingdianCount();
      this.qingxidingdanChat1();
      this.qingxidingdanChat2();
      this.qingxidingdanChat3();
      this.$nextTick(function () {
        this.initDate(); //数据初始化
        this.initzhuxingtu(); //数据初始化
        this.drawLine('zhexian')
      });
    }

  },

  methods:{
    drawLine(id) {
      this.$http({
        url: `/menpiaogoumai/getZhexian`,
        method: "get"
      }).then(({data}) => {
        if (data && data.code == 0) {
          this.charts = echarts.init(document.getElementById(id))
          this.charts.setOption({
            title: {
              left: "center",
              top: '5%',
              text: "景点门票订单数量",//标题文本，支持使用 \n 换行。
            },
            tooltip: {
              trigger: 'axis'
            },
            grid: {
              top: '30%',
              left: '5%',
              right: '5%',
              bottom: '5%',
              containLabel: true
            },

            xAxis: {
              type: 'category',
              boundaryGap: true,
              axisTick: {
                alignWithLabel: true //保证刻度线和标签对齐
              },
              data: data.data.xData //x坐标的名称

            },
            yAxis: {
              type: 'value',
              boundaryGap: true,
              splitNumber: 4, //纵坐标数
              interval: 250 //强制设置坐标轴分割间隔
            },

            series: [{
              type: 'line', //折线图line;柱形图bar;饼图pie
              stack: '总量',
              areaStyle: {
                //显示区域颜色---渐变效果
                color: {
                  type: 'linear',
                  x: 0,
                  y: 0,
                  x2: 0,
                  y2: 1,
                  colorStops: [{
                    offset: 0, color: 'rgb(255,200,213)' // 0% 处的颜色
                  }, {
                    offset: 1, color: '#ffffff' // 100% 处的颜色
                  }],
                  global: false // 缺省为 false
                }
              },
              itemStyle: {
                color: 'rgb(255,96,64)', //改变折线点的颜色
                lineStyle: {
                  color: 'rgb(255,96,64)' //改变折线颜色
                }

              },
              data: data.data.yData
            }]
          })
        }
      });

    },

    initzhuxingtu() {
      this.$http({
        url: `/jiudianxinxi/getZhuxingtu`,
        method: "get"
      }).then(({data}) => {
        // 基本柱状图
        const option = {
          xAxis: {
            data: data.data.xData
          },
          yAxis: {},
          title: {
            // 设置饼图标题，位置设为顶部居中
            text: "酒店信息",
            top: "0%",
            left: "center"
          },
          series: [
            {
              type: "bar", //形状为柱状图
              data: data.data.ydata
            }
          ]
        };
        const myChart = echarts.init(document.getElementById("mychart1"));
        myChart.setOption(option);
        //随着屏幕大小调节图表
        window.addEventListener("resize", () => {
          myChart.resize();
        });
      });
    },
    initDate() {
      this.$http({
        url: `/xianluleixing/getPie`,
        method: "get"
      }).then(({data}) => {
        this.pieData = data.data;
        for (let i = 0; i < this.pieData.length; i++) {
          // this.xData[i] = i;
          // this.yData =this.xData[i]*this.xData[i];
          this.pieName[i] = this.pieData[i].name;
        }
        this.initEcharts();
      });
    },
    initEcharts() {
      // 饼图
      const option = {
        legend: {
          // 图例
          data: this.pieName,
          right: "0%",
          top: "30%",
          orient: "vertical"
        },
        title: {
          // 设置饼图标题，位置设为顶部居中
          text: "线路分类",
          top: "0%",
          left: "center"
        },
        series: [
          {
            type: "pie",
            label: {
              show: true,
              formatter: "{b} : {c} ({d}%)" // b代表名称，c代表对应值，d代表百分比
            },
            radius: "50%", //饼图半径
            data: this.pieData
          }
        ]
      };
      console.log(this.seriesData);
      this.myChart = echarts.init(document.getElementById("mychart"));
      this.myChart.setOption(option);
      //随着屏幕大小调节图表
      window.addEventListener("resize", () => {
        this.myChart.resize();
      });
    },
    init(){
        if(this.$storage.get('Token')){
        this.$http({
            url: `${this.$storage.get('sessionTable')}/session`,
            method: "get"
        }).then(({ data }) => {
            if (data && data.code != 0) {
            router.push({ name: 'login' })
            }
        });
        }else{
            router.push({ name: 'login' })
        }
    },
    LvyouxianluCount() {
      this.$http({
        url: `lvyouxianlu/count`,
        method: "get"
      }).then(({
                 data
               }) => {
        if (data && data.code == 0) {
          this.lvyouxianluCount = data.data
        }
      })
    },
    JiudianxinxiCount() {
      this.$http({
        url: `jiudianxinxi/count`,
        method: "get"
      }).then(({
                 data
               }) => {
        if (data && data.code == 0) {
          this.jiudianxinxiCount = data.data
        }
      })
    },
    JipiaoxinxiCount() {
      this.$http({
        url: `jipiaoxinxi/count`,
        method: "get"
      }).then(({
                 data
               }) => {
        if (data && data.code == 0) {
          this.jipiaoxinxiCount = data.data
        }
      })
    },
    remenjingdianCount() {
      this.$http({
        url: `remenjingdian/count`,
        method: "get"
      }).then(({
                 data
               }) => {
        if (data && data.code == 0) {
          this.jingdianxinxiCount = data.data
        }
      })
    },
    qingxidingdanChat1() {

      this.$nextTick(()=>{

        var qingxidingdanChart1 = echarts.init(document.getElementById("qingxidingdanChart1"),'macarons');
        this.$http({
          url: `jiudianyuding/value/yudingshijian/zongjine/日`,
          method: "get",
        }).then(({ data }) => {
          if (data && data.code === 0) {
            let res = data.data;
            let xAxis = [];
            let yAxis = [];
            let pArray = []
            for(let i=0;i<res.length;i++){
              xAxis.push(res[i].yudingshijian);
              yAxis.push(parseFloat((res[i].total)));
              pArray.push({
                value: parseFloat((res[i].total)),
                name: res[i].yudingshijian
              })
            }
            var option = {};
            option = {
              title: {
                text: '酒店日收益',
                left: 'center'
              },
              tooltip: {
                trigger: 'item',
                formatter: '{b} : {c}'
              },
              xAxis: {
                type: 'category',
                data: xAxis,
                axisLabel : {
                  rotate:70
                }
              },
              yAxis: {
                type: 'value'
              },
              series: [{
                data: yAxis,
                type: 'bar'
              }]
            };
            // 使用刚指定的配置项和数据显示图表。
            qingxidingdanChart1.setOption(option);
            //根据窗口的大小变动图表
            window.onresize = function() {
              qingxidingdanChart1.resize();
            };
          }
        });
      })
    },

    qingxidingdanChat2() {
      this.$nextTick(()=>{

        var qingxidingdanChart2 = echarts.init(document.getElementById("qingxidingdanChart2"),'macarons');
        this.$http({
          url: `jiudianyuding/value/yudingshijian/zongjine/月`,
          method: "get",
        }).then(({ data }) => {
          if (data && data.code === 0) {
            let res = data.data;
            let xAxis = [];
            let yAxis = [];
            let pArray = []
            for(let i=0;i<res.length;i++){
              xAxis.push(res[i].yudingshijian);
              yAxis.push(parseFloat((res[i].total)));
              pArray.push({
                value: parseFloat((res[i].total)),
                name: res[i].yudingshijian
              })
            }
            var option = {};
            option = {
              title: {
                text: '酒店月收益',
                left: 'center'
              },
              tooltip: {
                trigger: 'item',
                formatter: '{b} : {c}'
              },
              xAxis: {
                type: 'category',
                data: xAxis,
                axisLabel : {
                  rotate:70
                }
              },
              yAxis: {
                type: 'value'
              },
              series: [{
                data: yAxis,
                type: 'bar'
              }]
            };
            // 使用刚指定的配置项和数据显示图表。
            qingxidingdanChart2.setOption(option);
            //根据窗口的大小变动图表
            window.onresize = function() {
              qingxidingdanChart2.resize();
            };
          }
        });
      })
    },

    qingxidingdanChat3() {
      this.$nextTick(()=>{

        var qingxidingdanChart3 = echarts.init(document.getElementById("qingxidingdanChart3"),'macarons');
        this.$http({
          url: `jiudianyuding/value/yudingshijian/zongjine/年`,
          method: "get",
        }).then(({ data }) => {
          if (data && data.code === 0) {
            let res = data.data;
            let xAxis = [];
            let yAxis = [];
            let pArray = []
            for(let i=0;i<res.length;i++){
              xAxis.push(res[i].yudingshijian);
              yAxis.push(parseFloat((res[i].total)));
              pArray.push({
                value: parseFloat((res[i].total)),
                name: res[i].yudingshijian
              })
            }
            var option = {};
            option = {
              title: {
                text: '酒店年收益',
                left: 'center'
              },
              tooltip: {
                trigger: 'item',
                formatter: '{b} : {c}'
              },
              xAxis: {
                type: 'category',
                data: xAxis,
                axisLabel : {
                  rotate:70
                }
              },
              yAxis: {
                type: 'value'
              },
              series: [{
                data: yAxis,
                type: 'bar'
              }]
            };
            // 使用刚指定的配置项和数据显示图表。
            qingxidingdanChart3.setOption(option);
            //根据窗口的大小变动图表
            window.onresize = function() {
              qingxidingdanChart3.resize();
            };
          }
        });
      })
    },

  }
};
</script>
<style lang="scss" scoped>

.cardView {
  display: flex;
  flex-wrap: wrap;
  width: 100%;

  .cards {
    display: flex;
    align-items: center;
    width: 100%;
    margin-bottom: 10px;
    justify-content: center;
    .card {
      width: calc(25% - 20px);
      margin: 0 10px;
      /deep/.el-card__body{
        padding: 0;
      }
    }
    .bgc{
      border-color: #c7ebdb;
      background: url(../assets/img/1.svg) center center / auto 80% no-repeat;
      border-width: 1px 0px 1px 1px;
      width: auto;
      min-width: 200px;
      border-style: solid;
      height: 120px;

    }
    .bgc1{
      border-color: #c7ebdb;
      background: url(../assets/img/2.svg) center center / auto 80% no-repeat;
      border-width: 1px 0px 1px 1px;
      width: auto;
      min-width: 200px;
      border-style: solid;
      height: 120px;

    }
    .bgc2{
      border-color: #c7ebdb;
      background: url(../assets/img/3.svg) center center / auto 80% no-repeat;
      border-width: 1px 0px 1px 1px;
      width: auto;
      min-width: 200px;
      border-style: solid;
      height: 120px;

    }
    .bgc3{
      border-color: #c7ebdb;
      background: url(../assets/img/4.svg) center center / auto 80% no-repeat;
      border-width: 1px 0px 1px 1px;
      width: auto;
      min-width: 200px;
      border-style: solid;
      height: 120px;

    }
  }
}
</style>
