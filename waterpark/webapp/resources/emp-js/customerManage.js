let searchUI = $("#searchUI");
searchUI.find("[name='searchType']").val("${pagingVO.searchMap.searchType }");
$("#searchBtn").on("click", function(){
	let inputs = searchUI.find(":input[name]");
	$(inputs).each(function(idx, input){
		let name = $(this).attr("name");
		let sameInput = searchForm.find("[name='"+name+"']");
		$(sameInput).val($(this).val());
		let testing = $(this).val();
		console.log(`${idx} : ${testing}`);
	});
	searchForm.submit();
});	

let pagingArea = $("#pagingArea").on("click", "a", function(event){
	event.preventDefault();
	let page = $(this).data("page");
	console.log("내가 받은 페이지 : " + page);
	if(page){
		console.log(page);
		searchForm.find("[name='page']").val(page);
		console.log("pageArea click!");
		searchForm.submit();
	}
	return false;
});

let listBody = $("#listBody");

let searchForm = $("#searchForm").ajaxForm({
	dataType : 'json'
	, beforeSubmit:function(){
		searchForm.find("[name='page']").val("");
	}, success : function(resp){
		listBody.empty();
		pagingArea.empty();
		let trTags = [];
		if(resp.dataList){
			$(resp.dataList).each(function(idx,user){
				let user_del = "-";
				let membership_date = "-";
				if(user.user_del != null){
					user_del = user.user_del;
				}				
				if (user.membership_date != null){
					membership_date = user.membership_date;
				}
				let tr = $("<tr>").append(
						 $("<td  class='centering'>").html(user.rnum)
						,$("<td class='centering'>").html(user.user_id)
						,$("<td class='centering'>").html(user.user_name)
						,$("<td class='centering'>").html(user.user_mail)
						,$("<td class='centering'>").html(user.user_hp)
						,$("<td class='centering'>").html(user.user_date)
						,$("<td class='centering'>").html(user_del)
						,$("<td class='centering'>").html(membership_date)
						,$("<td class='centering'>").html(user.agreement_check)
						,$("<td class='centering'>").html(user.user_protect)
						).css("cursor","pointer");
				
				trTags.push(tr);
			});
		}else{
			trTags.push(
				$("<tr>").html(
					$("<td>").attr("colspan","7")
				)
			);
		}
		listBody.html(trTags);
		pagingArea.html(resp.pagingHTMLBS);
	},error:function(xhr, resp, error){
		console.log(xhr);
	}
});

$(document).on("click","#listBody tr",function(){
	let userId = $(this).children().eq(1).text();
	let url = "/waterpark/emp/customerInfo?what="+userId;
	window.open(url,"new","width=1050,height=800");
});





