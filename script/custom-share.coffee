function shareFB(title,url,desc,image) {
    t=encodeURIComponent(title);
    d=encodeURIComponent(desc);
    u=encodeURIComponent(url);
    i=encodeURIComponent(image);
    share_url='http://www.facebook.com/sharer.php';
    share_url+='?s=100&p[title]='+t+'&p[summary]='+d+'&p[url]='+u;
    share_url+='&p[images][0]='+i;
    share_url+='&t='+t+'&e='+d;
    return share_url;
}
function shareVK(title,url,desc,image) {
    t=encodeURIComponent(title);
    d=encodeURIComponent(desc);
    u=encodeURIComponent(url);
    i=encodeURIComponent(image);
    share_url='http://vkontakte.ru/share.php';
    share_url+='?title='+t+'&description='+d+'&url='+u;
    share_url+='&image='+i;
    share_url+='&noparse=1'
    return share_url;
}
function shareMM(title,url,desc,image) {
    t=encodeURIComponent(title);
    d=encodeURIComponent(desc);
    u=encodeURIComponent(url);
    i=encodeURIComponent(image);
    share_url='http://connect.mail.ru/share';
    share_url+='?title='+t+'&description='+d+'&url='+u;
    share_url+='&imageurl='+i;
    return share_url;
}
function shareOD(title,url,desc,image) {
    t=encodeURIComponent(title);
    d=encodeURIComponent(desc);
    u=encodeURIComponent(url);
    i=encodeURIComponent(image);
    return 'http://www.odnoklassniki.ru/dk?st.cmd=addShare&st.s=1&st._surl='+u;
}
function socialShare(type,title,url,desc,image) {
    var u = '';
    switch(type){
        case 'vk':
            u = shareVK(title,url,desc,image);
            break;
        case 'fb':
            u = shareFB(title,url,desc,image);
            break;
        case 'mm':
            u = shareMM(title,url,desc,image);
            break;
        case 'od':
            u = shareOD(title,url,desc,image);
            break;
    }
    if(url != ''){
        window.open(u,'sharer','toolbar=0,status=0,width=626,height=436');
    }
    return false;
}