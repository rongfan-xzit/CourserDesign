/**
 * 页面加载加载进度条启用
 * **/
function progressLoad(hintMsg){
    $("<div class=\"hint-mask\" style=\"position:absolute;z-index: 9999;top: 0px;left:0px;opacity:0.5;height: 100%;width: 100%;background-color:#e0e0e0;\"></div>")
        .css({display:"block",width:"100%",height:$(window).height()})
        .appendTo("body");

    $("<div class=\"hint-mask-msg\" style=\"position:absolute;z-index: 9999;color:red;\"></div>")
        .html(hintMsg)
        .appendTo("body")
        .css({display:"block",left:($(document.body).outerWidth(true) - 190) / 2,top:($(window).height() - 45) / 2});

}

/**
 * 页面加载加载进度条关闭
 * **/
function progressClose(){
    $(".hint-mask").remove();
    $(".hint-mask-msg").remove();
}