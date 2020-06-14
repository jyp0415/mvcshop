$(".plus").click(function(){
	var num = $(".numBox").val();
	var plusNum = Number(num) + 1;
	var stockMax = $(".numBox").attr('max');
	
	 if(plusNum > stockMax){ 
		$(".numBox").val(num);
	} else { 
		$(".numBox").val(plusNum);          
		 }
	} );
								  
	$(".minus").click(function(){
		var num = $(".numBox").val();
		var minusNum = Number(num) - 1;
								   
		if(minusNum <= 0) {
			$(".numBox").val(num);
		} else {
			$(".numBox").val(minusNum);          
		}
	});