<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">

    <script>
        // Ignore this in your implementation
        window.isMbscDemo = true;
    </script>

    <title>Localization</title>

    <script src="https://code.jquery.com/jquery-1.11.2.min.js"></script>

    <!-- Mobiscroll JS and CSS Includes -->
    <link rel="stylesheet" href="${WCP}/resources/css/mobiscroll.jquery.min.css">
    <script src="${WCP}/resources/js/mobiscroll.jquery.min.js"/>"</script>

    <style type="text/css">
    body {
        margin: 0;
        padding: 0;
    }

    button {
        display: inline-block;
        margin: 5px 5px 0 0;
        padding: 10px 30px;
        outline: 0;
        border: 0;
        cursor: pointer;
        background: #5185a8;
        color: #fff;
        text-decoration: none;
        font-family: arial, verdana, sans-serif;
        font-size: 14px;
        font-weight: 100;
    }

    input {
        width: 100%;
        margin: 0 0 5px 0;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 0;
        font-family: arial, verdana, sans-serif;
        font-size: 14px;
        box-sizing: border-box;
        -webkit-appearance: none;
    }

    .mbsc-page {
        padding: 1em;
    }
    #sizing{
       width: 400px;
       height: 200px;
    }

    </style>

</head>
<body>
<div id="sizing">
<div mbsc-page class="demo-localization">
  <div style="height:100%">
      <div id="demo"></div>
  </div>
</div>
<input id="dating" type="button" value="date">
</div>

<script>

    mobiscroll.setOptions({
        theme: 'ios',                                                          // Specify theme like: theme: 'ios' or omit setting to use default
            themeVariant: 'light'                                              // More info about themeVariant: https://docs.mobiscroll.com/5-4-0/range#opt-themeVariant
    });
    
    $(function () {
        // Mobiscroll Range initialization
        $('#demo').mobiscroll().datepicker({
            controls: ['calendar'],                                            // More info about controls: https://docs.mobiscroll.com/5-4-0/range#opt-controls
            select: 'range',                                                   // More info about select: https://docs.mobiscroll.com/5-4-0/range#methods-select
            display: 'inline',                                                 // Specify display mode like: display: 'bottom' or omit setting to use default
            locale: mobiscroll.localeKo// sets the language of the component  // Specify language like: locale: mobiscroll.localePl or omit setting to use default
        });
    });
//  시작날짜와 끝날짜 값받아오기
    $(function(){
    	$("#dating").on("click",function(){
    		var start = $("#starting").text();
    		var endi = $("#ending").text();
    		if(start != "선택" && endi !="선택"){
    			alert(start+" : " + endi)
    		}
    	})
    })
</script>

</body>
</html>
