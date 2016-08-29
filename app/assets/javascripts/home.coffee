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
            if ($("#carousel-container").height() < $("#info-container").height())
                console.log("Here");
                $("#carousel-container").css({"height":$("#info-container").height() + "px"});
            else
                $("#carousel-container").css({"height":"calc(100vh-80px-60px)"});
                
            $border_bottom = $("#carousel").height() + "px solid rgba(1,1,1,0.8)";
            $border_right = $("#carousel").width() + "px solid transparent";

            $border_right_white =  (60*$("#carousel").width()) / $("#carousel").height();
            $border_right_white = $border_right_white + "px solid transparent";

            $("#triangle-bottomleft").css({"border-bottom":$border_bottom, "border-right":$border_right})
            $("#triangle-bottomleft-white").css({"border-right":$border_right_white})

            console.log(max_index)
            prev_index = max_index-1;
            $("#carousel-next").on "click", ->
                                                $("#carousel-next").prop({"disabled":true})
                                                console.log("Carousel Forward")
                                                carouselNext()
                                                
                                                
            $("#carousel-previous").on "click", ->
                                                $("#carousel-previous").prop({"disabled":true})
                                                console.log("Carousel Backward")
                                                carouselBack()  

carouselNext = () ->
                    console.log("Moving to next image")   
                    $($("#carousel .carousel-image")[active_index]).animate({"margin-left": "100%"}, -> 
                                                                                                        $($("#carousel .carousel-image")).attr("style":"")
                                                                                                        changeValues(1)).removeClass("active")
                    $($("#carousel .carousel-image")[next_index]).animate({"margin-left": "0%"}, -> 
                                                                                                        $($("#carousel .carousel-image")).attr("style":"")
                                                                                                        $("#carousel-next").prop({"disabled":false})).addClass("active")

carouselBack = () ->
                    console.log("Moving to previous image")   
                      
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
                            if ($("#carousel-container").height() < $("#info-container").height())
                                console.log("Here");
                                $("#carousel-container").css({"height":$("#info-container").height() + "px"});
                            else
                                $("#carousel-container").css({"height":"calc(100vh-80px-60px)"});
                            $border_bottom = $("#carousel").height() + "px solid rgba(1,1,1,0.8)";
                            $border_right = $("#carousel").width() + "px solid transparent";
                            $border_right_white =  (60*$("#carousel").width()) / $("#carousel").height();
                            $border_right_white = $border_right_white + "px solid transparent";
                            $("#triangle-bottomleft").css({"border-bottom":$border_bottom, "border-right":$border_right})
                            $("#triangle-bottomleft-white").css({"border-right":$border_right_white})
