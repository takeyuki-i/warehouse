window.addEventListener('load', function(){

const pullDownButton = document.getElementById("alarm_id")
const pullDownParents = document.getElementById("alarm-test")

pullDownButton.addEventListener('mouseover', function(){
   pullDownButton.setAttribute("style","background-color:#ffff99;")
 })
pullDownButton.addEventListener('mouseout', function(){
   pullDownButton.setAttribute("style","background-color;#ffff99")
 })
 pullDownButton.addEventListener('click', function(){
   pullDownParents.setAttribute("style", "display:block;")
 })

})
