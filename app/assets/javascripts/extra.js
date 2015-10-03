
$(document).ready(function(){

	$(".like").mouseenter(function() 
		{ $(".like-explain").css('display','block'); 
	});

	$(".like").mouseleave(function() 
		{ $(".like-explain").css('display','none'); 
	});

	$(".dislike").mouseenter(function() 
		{ $(".dislike-explain").css('display','block'); 
	});

	$(".dislike").mouseleave(function() 
		{ $(".dislike-explain").css('display','none'); 

	});


$.fn.reverseChildren = function() {
  return this.each(function(){
    var $this = $(this);
    $this.children().each(function(){ $this.prepend(this) });
  });
};

$('#outcomes').reverseChildren();





});