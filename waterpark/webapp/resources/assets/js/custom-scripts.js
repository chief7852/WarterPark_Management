/*------------------------------------------------------
    Author : www.webthemez.com
    License: Commons Attribution 3.0
    http://creativecommons.org/licenses/by/3.0/
---------------------------------------------------------  */

(function ($) {
    "use strict";
    var mainApp = {

        initFunction: function () {
            /*MENU 
            ------------------------------------*/
            $('#main-menu').metisMenu();
			
            $(window).bind("load resize", function () {
                if ($(this).width() < 768) {
                    $('div.sidebar-collapse').addClass('collapse')
                } else {
                    $('div.sidebar-collapse').removeClass('collapse')
                }
            });

            /* MORRIS BAR CHART
			-----------------------------------------*/
            Morris.Bar({
                element: 'morris-bar-chart',
                data: [{
                    y: '12월',
                    a: 100,
                    b: 90
                }, {
                    y: '1월',
                    a: 75,
                    b: 65
                }, {
                    y: '2월',
                    a: 50,
                    b: 40
                }, {
                    y: '3월',
                    a: 75,
                    b: 65
                }, {
                    y: '4월',
                    a: 50,
                    b: 40
                }, {
                    y: '5월',
                    a: 75,
                    b: 65
                }, {
                    y: '6월',
                    a: 100,
                    b: 90
                }],
                xkey: 'y',
                ykeys: ['a', 'b'],
                labels: ['매출', '매입'],
				 barColors: [
    '#A6A6A6','#24C2CE',
    '#A8E9DC' 
  ],
                hideHover: 'auto',
                resize: true
            });
	 


            /* MORRIS DONUT CHART
			----------------------------------------*/
            Morris.Donut({
                element: 'morris-donut-chart',
                data: [{
                    label: "Download Sales",
                    value: 12
                }, {
                    label: "In-Store Sales",
                    value: 30
                }, {
                    label: "Mail-Order Sales",
                    value: 20
                }],
				   colors: [
    '#A6A6A6','#24C2CE',
    '#A8E9DC' 
  ],
                resize: true
            });

            /* MORRIS AREA CHART
			----------------------------------------*/

            Morris.Area({
                element: 'morris-area-chart',
                data: [{
                    period: '1월 Q1',
                    iphone: 2666,
                    ipad: null,
                    itouch: 2647
                }, {
                    period: '2월 Q2',
                    iphone: 2778,
                    ipad: 2294,
                    itouch: 2441
                }, {
                    period: '3월 Q3',
                    iphone: 4912,
                    ipad: 1969,
                    itouch: 2501
                }, {
                    period: '4월 Q4',
                    iphone: 3767,
                    ipad: 3597,
                    itouch: 5689
                }, {
                    period: '5월 Q1',
                    iphone: 6810,
                    ipad: 1914,
                    itouch: 2293
                }, {
                    period: '6월 Q2',
                    iphone: 5670,
                    ipad: 4293,
                    itouch: 1881
                }, {
                    period: '7월 Q3',
                    iphone: 4820,
                    ipad: 3795,
                    itouch: 1588
                }, {
                    period: '8월 Q4',
                    iphone: 15073,
                    ipad: 5967,
                    itouch: 5175
                }, {
                    period: '9월 Q1',
                    iphone: 10687,
                    ipad: 4460,
                    itouch: 2028
                }, {
                    period: '10월 Q2',
                    iphone: 8432,
                    ipad: 5713,
                    itouch: 1791
                }],
                xkey: 'period',
                ykeys: ['iphone', 'ipad', 'itouch'],
                labels: ['iPhone', 'iPad', 'iPod Touch'],
                pointSize: 2,
                hideHover: 'auto',
				  pointFillColors:['#ffffff'],
				  pointStrokeColors: ['black'],
				  lineColors:['#A6A6A6','#24C2CE'],
                resize: true
            });

            /* MORRIS LINE CHART
			----------------------------------------*/
            Morris.Line({
                element: 'morris-line-chart',
                data: [
					  { y: '1월', a: 50, b: 90},
					  { y: '2월', a: 165,  b: 185},
					  { y: '3월', a: 150,  b: 130},
					  { y: '4월', a: 175,  b: 160},
					  { y: '5월', a: 80,  b: 65},
					  { y: '6월', a: 90,  b: 70},
					  { y: '7월', a: 100, b: 125},
					  { y: '8월', a: 155, b: 175},
					  { y: '9월', a: 80, b: 85},
					  { y: '10월', a: 145, b: 155},
					  { y: '11월', a: 160, b: 195}
				],
            
				 
      xkey: 'y',
      ykeys: ['a', 'b'],
      labels: ['Total Income', 'Total Outcome'],
      fillOpacity: 0.6,
      hideHover: 'auto',
      behaveLikeLine: true,
      resize: true,
      pointFillColors:['#ffffff'],
      pointStrokeColors: ['black'],
      lineColors:['gray','#24C2CE']
	  
            });
           
        
            $('.bar-chart').cssCharts({type:"bar"});
            $('.donut-chart').cssCharts({type:"donut"}).trigger('show-donut-chart');
            $('.line-chart').cssCharts({type:"line"});

            $('.pie-thychart').cssCharts({type:"pie"});
       
	 
        },

        initialization: function () {
            mainApp.initFunction();

        }

    }
    // Initializing ///

    $(document).ready(function () {
        mainApp.initFunction(); 
		$("#sideNav").click(function(){
			if($(this).hasClass('closed')){
				$('.navbar-side').animate({left: '0px'});
				$(this).removeClass('closed');
				$('#page-wrapper').animate({'margin-left' : '260px'});
				
			}
			else{
			    $(this).addClass('closed');
				$('.navbar-side').animate({left: '-260px'});
				$('#page-wrapper').animate({'margin-left' : '0px'}); 
			}
		});
    });

}(jQuery));
