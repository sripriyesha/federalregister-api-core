$(document).ready(function() {  

  var mask = document.getElementById('scroll-mask');
  var content = document.getElementById('scroll-content');
  var li_width = $(".timeline .timeline_list > li").outerWidth(true);
  var li_count = $(".timeline .timeline_list > li").size();
  $(".timeline .timeline_list").width( li_width * li_count - 10);
  
  new Dragdealer('timeline_control', {
    x: 1,
    xPrecision: content.offsetWidth,
    steps: li_count - 2,
    snap: true,
  	animationCallback: function(x, y)
  	{
  		var margin = x * (content.offsetWidth - mask.offsetWidth);
  		content.style.marginLeft = String(-margin) + 'px';
  	}
  });
});
