$(function () {
  $(".userbtn").click(
      function () {
          $('#accountpage').css('display','none');
          $('#userpage').css('display','block');
          $('#orderpage').css('display','none');
          // $('#financepage').css('display','none');
        // document.getElementById("userpage").style.display= "block";
        // document.getElementById("accountpage").style.display="none";
        //   document.getElementById("orderpage").style.display="none";
        //   document.getElementById("financepage").style.display="none";
      });
   $(".accountbtn").click(
       function () {
           $('#accountpage').css('display','block');
           $('#userpage').css('display','none');
           $('#orderpage').css('display','none');
           // $('#financepage').css('display','none');
       // document.getElementById("accountpage").style.display="block";
       // document.getElementById("userpage").style.display="none";
       // document.getElementById("orderpage").style.display="none";
       //     document.getElementById("financepage").style.display="none";
   });

   $(".orderbtn").click(
       function () {
           $('#accountpage').css('display','none');
           $('#userpage').css('display','none');
           $('#orderpage').css('display','block');
           // $('#financepage').css('display','none');
           // document.getElementById("orderpage").style.display="block";
           // document.getElementById("userpage").style.display="none";
           // document.getElementById("accountpage").style.display="none";
           // document.getElementById("financepage").style.display="none";
       }
   );

   // $(".financebtn").click(
   //     function () {
   //         $('#accountpage').css('display','none');
   //         $('#userpage').css('display','none');
   //         $('#orderpage').css('display','none');
   //         // $('#financepage').css('display','block');
   //         // document.getElementById("financepage").style.display="block";
   //         // document.getElementById("orderpage").style.display="none";
   //         // document.getElementById("userpage").style.display="none";
   //         // document.getElementById("accountpage").style.display="none";
   //      }
   // );

   $(".finance_s").click(
       function () {
           $('#f_search').css('display','block');
           $('#f_count').css('display','none');
           // document.getElementById("f_search").style.display = "block";
           // document.getElementById("f_count").style.display = "none";
           // $.getJSON("/api/finances/search.json",function (data) {
           //     alert(JSON.stringify(data.search));
           //     console.log(JSON.stringify(data.search));
           //     $("#search").html("");
           //     $.each(data.search, function(i,item) {
           //         $("#search").append(
           //            "<tr><td>" + item.userid +"</td>" +
           //                "<td>" + item.pay_type + "</td>" +
           //                "<td>" + item.pay_account + "</td>" +
           //                "<td>" + item.to_bank_account + "</td>" +
           //                "<td>" + item.to_bank_account_no + "</td>" +
           //                "<td>" + item.to_bank_type + "</td>" +
           //                "<td>" + item.money + "</td>" +
           //                "<td>" + item.tousername + "</td>" +
           //                "<td>" + item.info + "</td>" +
           //                "<td>" + item.pay_info + "</td>" +
           //                "<td>" + item.pay_time + "</td>" +
           //                "<td>" + item.receive_time + "</td></tr>"
           //         );
           //     });
           // });
       }
   );

   $(".finance_c").click(
        function () {
            $('#f_search').css('display','none');
            $('#f_count').css('display','block');
            // document.getElementById("f_search").style.display = "none";
            // document.getElementById("f_count").style.display = "block";
            // $.getJSON("/api/finances/count.json",function(data){
            //     console.log(JSON.stringify(data));
            //     $("#count").html("");
            //     $("#count").append(
            //             "<tr><td>" + data.count.sumcount + "</td>" +
            //             "<td>" + data.count.maxcount + "</td>" +
            //             "<td>" + data.count.mincount + "</td></tr>"
            //     );
            // });
            // $.ajax({
            //     type:"get",
            //     url: "/api/finances/search.json?page=1",
            //     success:function(data){
            //         
            //             },
            //     error: function(data){
            //         alert("error"+data)
            //     }
            // })
        }
   );

})