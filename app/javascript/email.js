window.addEventListener('load', function(){

  const pullDownButton = document.getElementById("email_id")
  const pullDownParents = document.getElementById("alarm-test")
  
  pullDownButton.addEventListener('mouseover', function(){
     pullDownButton.setAttribute("style","background-color:#FFBEDA;")
   })
  pullDownButton.addEventListener('mouseout', function(){
     pullDownButton.setAttribute("style","background-color;#FFBEDA")
   })
   pullDownButton.addEventListener('click', function(){
     pullDownParents.setAttribute("style", "display:block;")
   })
  
  })