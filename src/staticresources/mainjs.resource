var j$ = jQuery.noConflict();
var currentUrl = window.location.href;
var hostIndex = currentUrl.indexOf(window.location.host+'/')+(window.location.host+'/').length;
var projectId = currentUrl.substring(hostIndex,hostIndex+15); 
j$(function(){
    /*Insert the jQuery style sheets in the Head.*/
    /*Insert the Modal dialog along with the VF as an iframe inside the div.*/
    j$("head").after(
        j$("<link>",{rel:"stylesheet",
                    href:"https://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css"}));
    j$("body").after(
        j$("<div>",{id:"modalDiv",
                    style:"display:none;"
           }).append(
            j$("<iframe>",{id:"vfFrame",
                         src:"/apex/popupwindow?id="+projectId,
                         height:200,
                         width:550,
                         frameBorder:0})
           ));
    /*Initialize the Dialog window.*/
    j$("#modalDiv").dialog({
        autoOpen: false,
        height: 210,
        width: 605,
        modal:true
    });
});