# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
active_index = 0;
next_index = 1;
prev_index = 4;
max_index = 0;

$(window).load ->
            console.log("DOM Ready")
            
            
            $("#carousel .carousel-image").first().css({"display":"block"})
            max_index = $("#carousel .carousel-image").length
            
            console.log($("#info-container").height())
            if ($("#carousel-container").height() < $("#info-container").height() && $(window).width() > 768)
                console.log("here");
                $("#carousel-container").css({"height":$("#info-container").height() + "px"});
            else if($(window).width() > 768)
                $("#carousel-container").css({"height":"calc(100vh-80px-60px)"});
                
            checkTriangles()

            console.log(max_index)
            prev_index = max_index-1;
            $("#carousel-next").on "click", ->
                                                $("#carousel-next").prop({"disabled":true})
                                                console.log("Carousel Forward")
                                                carouselNext()
                                                checkTriangles()
                                                
                                                
            $("#carousel-previous").on "click", ->
                                                $("#carousel-previous").prop({"disabled":true})
                                                console.log("Carousel Backward")
                                                carouselBack()
                                                checkTriangles()

            $("#title-bar .sign-in-register-link").on "click", ->
                                                $(".flip-container").slideToggle(400);
                                                $(".flip-container").removeClass("flipped");
            $("#title-bar .flipper-link").on "click", ->
                                                $(".flip-container").toggleClass("flipped");

carouselNext = () ->
                    console.log("Moving to next image")
                    $($("#carousel .carousel-info-box")[active_index]).fadeOut(100).removeClass("active-info-box")   
                    $($("#carousel .carousel-info-box")[next_index]).fadeIn(400).addClass("active-info-box")
                    $($("#carousel .carousel-image")[active_index]).animate({"margin-left": "100%"}, -> 
                                                                                                        $($("#carousel .carousel-image")).attr("style":"")
                                                                                                        changeValues(1)).removeClass("active")
                    $($("#carousel .carousel-image")[next_index]).animate({"margin-left": "0%"}, -> 
                                                                                                        $($("#carousel .carousel-image")).attr("style":"")
                                                                                                        $("#carousel-next").prop({"disabled":false})).addClass("active")

carouselBack = () ->
                    console.log("Moving to previous image")   
                    $($("#carousel .carousel-info-box")[active_index]).fadeOut(100).removeClass("active-info-box")   
                    $($("#carousel .carousel-info-box")[prev_index]).fadeIn(400).addClass("active-info-box")  
                    $($("#carousel .carousel-image")[active_index]).animate({"margin-left": "-100%"}, -> 
                                                                                                        $($("#carousel .carousel-image")).attr("style":"")
                                                                                                        changeValues(-1)).removeClass("active")
                    $($("#carousel .carousel-image")[prev_index]).addClass("prev")
                    $($("#carousel .carousel-image")[prev_index]).animate({"margin-left": "0%"}, -> 
                                                                                                        $($("#carousel .carousel-image")).attr("style":"")
                                                                                                        $("#carousel-previous").prop({"disabled":false})).removeClass("prev").addClass("active")


changeValues = (num) ->
                    active_index = active_index + num
                    if (active_index >= max_index)
                                        active_index = 0;
                    if (active_index < 0)
                                        active_index = max_index-1;
                    next_index = next_index + num
                    if (next_index >= max_index)
                                        next_index = 0;
                    if (next_index < 0)
                                        next_index = max_index-1;
                    prev_index = prev_index + num
                    if (prev_index >= max_index)
                                        prev_index = 0;
                    if (prev_index < 0)
                                        prev_index = max_index-1;

                    console.log(prev_index + " - " + active_index + " - " + next_index)

active_func_next = () ->
$(window).on "resize orientationChange", -> 
                            $("#carousel-container").css({"height":""});
                            if ($("#carousel-container").height() < $("#info-container").height() && $(window).width() > 768)
                                $("#carousel-container").css({"height":$("#info-container").height() + "px"});
                            else if($(window).width() > 768)
                                $("#carousel-container").css({"height":"calc(100vh-80px-60px)"});

                            checkTriangles()

                            

checkTriangles = () ->
                    if($("#carousel .active").height() < $("#carousel").height())
                        $border_bottom = $("#carousel .active").height()/2 + "px solid rgba(1,1,1,0.8)";
                        $border_right = $("#carousel .active").width()/2 + "px solid transparent";

                        $border_top = $("#carousel .active").height()/2 + "px solid transparent";
                        $border_left = $("#carousel .active").width()/2 + "px solid rgba(0, 0, 0, 0.5)";

                        $border_right_white =  (60*$("#carousel .active").width()) / $("#carousel .active").height();
                        $border_right_white = $border_right_white + "px solid transparent";

                        console.log("Jeez")
                        $("#carousel .active-info-box").css({"bottom" : "" + $("#carousel").height() - $("#carousel .active").height() + "px"})
                    else
                        $border_bottom = $("#carousel").height()/2 + "px solid rgba(1,1,1,0.8)";
                        $border_right = $("#carousel").width()/2 + "px solid transparent";

                        $border_top = $("#carousel").height()/2 + "px solid transparent";
                        $border_left = $("#carousel").width()/2 + "px solid rgba(0, 0, 0, 0.5)";

                        $border_right_white =  (60*$("#carousel").width()) / $("#carousel").height();
                        $border_right_white = $border_right_white + "px solid transparent";
                        $("#carousel .active-info-box").css({"bottom" : "0px"})

                    $("#triangle-bottomleft").css({"border-bottom":$border_bottom, "border-right":$border_right, "border-left": $border_left, "border-top": $border_top})
                    $("#triangle-bottomleft-white").css({"border-right":$border_right_white})
                    