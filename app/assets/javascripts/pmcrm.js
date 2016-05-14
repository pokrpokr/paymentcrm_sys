$(document).ready(function () {
  $(".userbtn").click(
      function () {
        document.getElementById("userpage").style.display= "block";
        document.getElementById("accountpage").style.display="none";
          document.getElementById("orderpage").style.display="none";
      });
   $(".accountbtn").click(function () {
       document.getElementById("accountpage").style.display="block";
       document.getElementById("userpage").style.display="none";
       document.getElementById("orderpage").style.display="none";
   });

   $(".orderbtn").click(
       function () {
           document.getElementById("orderpage").style.display="block";
           document.getElementById("userpage").style.display="none";
           document.getElementById("accountpage").style.display="none";
       }
   );
})