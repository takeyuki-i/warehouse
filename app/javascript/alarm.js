window.addEventListener('load', function(){

const ButtonAction = document.getElementById("alarm_id")
const AlartOpen = document.getElementById("alarm")
const AlartClose = document.getElementById("alarm_hidden_id")

  ButtonAction.addEventListener('mouseover', function(){
    ButtonAction.setAttribute("style","background-color:#ffff99;")
  })

  ButtonAction.addEventListener('mouseout', function(){
    ButtonAction.removeAttribute("style","background-color:#ffff99;")
  })

  ButtonAction.addEventListener('click', function(){
    AlartOpen.setAttribute("style", "display:block;")
  })

  AlartClose.addEventListener('click', function(){
    AlartOpen.removeAttribute("style", "display:block;")
  })

})
