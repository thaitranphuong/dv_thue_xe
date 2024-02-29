
$(document).ready(function () {


    $(window).scroll(function () {
        var scroll = $(window).scrollTop();

        //>=, not <=
        if (scroll >= 60) {
            //clearHeader, not clearheader - caps H
            $(".navbar").addClass("bg-light");
        } else {
            $(".navbar").removeClass("bg-light");
        }
    }); //missing );

    // document ready  
});
//nav
$(document).ready(function () {
    $('#toggle').click(function () {
        $('nav').slideToggle();
    });
})