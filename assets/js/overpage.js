//close search
function closesearch () {
    $('#search-form').fadeOut(1000).removeClass("show-search");
    $('#search-form').addClass("hide-search");
    $('#search-click').css({'display':'-webkit-inline-box',display:'inline-flex'});
    $('.right').animate({margin:'0px 10px 0 0'},2000);
    $('.center').fadeIn(4000).css({'display':'-webkit-inline-box'});
    $('#menu > .left ul').css({'display':'-webkit-inline-box'});

    $('#menu > .left').fadeIn(1000).animate({width:'80px'},10);
}
// When the user scrolls down 20px from the top of the document, show the button
function scrollFunction() {
    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
        document.getElementById("myBtn").style.display = "block";
    } else {
        document.getElementById("myBtn").style.display = "none";
    }
}

// When the user clicks on the button, scroll to the top of the document
function topFunction() {
    document.body.scrollTop = 0;
    document.documentElement.scrollTop = 0;
}

$(document).ready(function() {
    $('#search-form').addClass("hide-search");
    $('.center').fadeIn(500).css({'opacity':'0'});
    $('.center').animate({opacity:'0'},200);
    $('.center').fadeIn(500).animate({opacity:'1'},1000);
    $('.center').fadeIn(500).css({'display':'-webkit-inline-box'});
    $('#menu > .left ul').css({'display':'-webkit-inline-box'});
    $('#menu > .left').fadeIn(1000).animate({width:'80px'},100);
    $('.sm-form').hidden;
    $('#loginSingup').click(function () {
        $('.sm-form').toggleClass("show");

    });

    //search form//And Close Search form

    $('#search-click').click(function () {
        $('#search-click').fadeOut(1000);
        $('#search-click').css('display','none');
        $('#search-form').removeClass("hide-search");
        $('#search-form').addClass("show-search");
        $('#search-form').fadeIn(2000);
        $('#search-place').focus();
        $('.center').css({display:'none'});
        $('#menu > .left ul').css({display :'none'});
        $('#menu > .left').animate({width:'80%', opacity:'0'},100);
        $('#menu > .left').animate({width:'95%', opacity:'1'},1000);
        $('.right').animate({margin:'0px 10px 0 0'});

    });
    $('.close-search').click(closesearch());
    $(document).click(function (e) {

        var container = $("#search-click");
        if (!container.is(e.target)) {
            closesearch(e);
        }
    });
    //scrolling

});