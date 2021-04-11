function check(){
   const alart = document.getElementById("alarmid");
   alart(function (post){
      post.addEventListener("click",() =>{ 
         console.log("OK");
       });
   });
}
window.addEventListener("load",check);



// const alart = document.getElementById("alarmid");
// alart.addEventListener("click", () => {
//    console.log("OK");
// })


// const alart = document.getElementById("alarmid");
//   alart.addEventListener("load",() => {
//     console.log("イベント発火")
//   })










// document.addEventListener(
//   "DOMContentLoaded", e => {
//     let modal_open = document.getElementById("modal-open-btn");
//     modal_open.onclick = function () {
//       $('#overlay').fadeIn();
//       document.getElementById('modal-close-btn').onclick = function () {
//         $('#overlay').fadeOut();
//       };
//       document.getElementById("delete-comformation-btn").onclick = function () {
//         document.getElementById("item-delete-btn").click();
//       };
//     };
//   },
//   false
// );