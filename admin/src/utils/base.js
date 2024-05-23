const base = {
    get() {
        return {
            url : "http://localhost:8080/springbootv9oyf/",
            name: "springbootv9oyf",
            // 退出到首页链接
            indexUrl: 'http://localhost:8080/springbootv9oyf/front/dist/index.html'
        };
    },
    getProjectName(){
        return {
            projectName: "智慧旅游平台"
        }
    }
}
export default base
