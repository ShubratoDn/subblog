function reaction(blogid,state, elem){
	let reinfo = {
		blogID: blogid,
		reactState: state
	};
	
	let likeBtn = elem.parentElement.querySelector(".like-btn");
	let dislikeBtn = elem.parentElement.querySelector(".dislike-btn");
	
	let likeCount = parseInt(elem.parentElement.querySelector(".like-btn span").innerHTML);
	let dislikeCount = parseInt(elem.parentElement.querySelector(".dislike-btn span").innerHTML);		
	
	$.ajax({
		url:"Reaction",
		data: reinfo,
		success: function(data, x,x){
			
			var serverData = data.trim();
			console.log(data);
			
			switch(serverData){
				case "liked":
					likeBtn.classList.add("interacted");
					++likeCount;
					break;
				case "disliked":
					dislikeBtn.classList.add("interacted");
					++dislikeCount;
					break;
				case "rmvlike":
					likeBtn.classList.remove("interacted");
					--likeCount;
					break;
				case "rmvdislike":
					dislikeBtn.classList.remove("interacted");
					--dislikeCount;
					break;					
				case "uplike":
					likeBtn.classList.add("interacted");
					dislikeBtn.classList.remove("interacted");
					++likeCount;
					--dislikeCount;
					break;
				case "updislike":
					dislikeBtn.classList.add("interacted");
					likeBtn.classList.remove("interacted");
					--likeCount;
					++dislikeCount;
					break;
				default:
					window.location = "login.jsp";
					break;
			}
			
			elem.parentElement.querySelector(".like-btn span").innerHTML = likeCount;
			elem.parentElement.querySelector(".dislike-btn span").innerHTML = dislikeCount;
			
			
		},
		error: function(){
			
		}
	})
}

