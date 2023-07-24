<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>gantt chart</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <style>
      * {
        margin: 0;
        padding: 0;
        font-family: sans-serif;
      }
      .chartMenu {
        width: 100vw;
        height: 40px;
        background: #1A1A1A;
       /*  color: rgba(54, 162, 235, 1); */
       	color: white;
       
      }
      .chartMenu p {
        padding: 10px;
        font-size: 20px;
      }
      .chartCard {
        width: 100vw;
        height: calc(100vh - 40px);
        /* background: rgba(54, 162, 235, 0.2); */
        background: white;
        display: flex;
        align-items: center;
        justify-content: center;
      }
      .chartBox {
        width: 1000px;	/* 차트 박스 크기 조절 / 차트 크기로 인해 날짜가 간격 차이 남 */
        padding: 20px;
        border-radius: 20px;
        border: solid 3px rgba(54, 162, 235, 1);
        background: white;
      }
    </style>
    
    <!-- 프로젝트 상태표시 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" integrity="sha512-5A8nwdMOWrSz20fDsjczgUidUBR8liPYU+WymTZP1lmY9G6Oc7HlZv156XqnsgNUzTyMefFTcsFH/tnJE/+xBg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  </head>
  
  <body>
  
  	<h2>${list }</h2>  
  
    <div class="chartMenu">
      <p>SOOP<span id="chartVersion"></span></p>
    </div>
    
    <div class="chartCard">
      <div class="chartBox">
        <canvas id="myChart"></canvas>
      </div>
    </div>
    
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/chart.js/dist/chart.umd.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chartjs-adapter-date-fns/dist/chartjs-adapter-date-fns.bundle.min.js"></script>
        
    <script>    
   
    //var result = '${list}';
    
  	var gproject_info; 
  	
    function projectinfo() {
	    $.ajax({
	        url: "<c:url value="/data" />",
	        type: "get",
	        //data: JSON.stringify(obj),
	        dataType: "json",
	        contentType: "application/json",
	        success: function(project_info) {
	        	
	        	console.log(project_info);
	        	
	        	gproject_info = project_info;	// 전역변수로 선언하기 위한 대입
	        	
/*	
	            for(var i=0; i<=project_info.length-1; i++ ){

	   	 	        console.log("프로젝트 번호: " + project_info[i].project_no);
		            console.log("프로젝트 제목: " + project_info[i].project_title);
		            console.log("프로젝트 시작일: " + project_info[i].project_start_date);
		            console.log("프로젝트 마감일: " + project_info[i].project_end_Date);
		            console.log("프로젝트 내용: " + project_info[i].project_description);
		            console.log("프로젝트 상태: " + project_info[i].project_status);
		            console.log("프로젝트 색: " +project_info[i].color);
		            console.log("-----"); 

					console.log(
							project_info[i].project_no, 
							project_info[i].project_title, 
							project_info[i].project_start_date,
							project_info[i].project_end_Date,
							project_info[i].project_description,
							project_info[i].project_status,
							project_info[i].color);
	            		                  		            
	            } 
*/
	            
	        },
	        error: function(errorThrown) {
	            alert(errorThrown.statusText);
	        }
	    });            
	}
    
    projectinfo();  
    
   	console.log(gproject_info);
         
    // setup  
    const data = {
      //labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
      datasets: [{
        label: 'Weekly Sales',
        data: [
        	// x : 시작일 / 종료일, y : 프로젝트 이름 / 업무이름, name : 이름 / 다수 이름일 경우 [] 에 작성
        	// Completed : 2 / pending : 1 / Delayed : 0
        	{x:['2022-10-03', '2022-10-06'], y: 'project_name', name: 'James', status: 2 },
        	{x:['2022-10-06', '2022-10-12'], y: 'task1', name: ['Luna' , ' two'], status: 2 },  
        	{x:['2022-10-09', '2022-10-12'], y: 'task2', name: 'David', status: 2 }, 
        	{x:['2022-10-12', '2022-10-21'], y: 'task3', name: 'Lily', status: 2 }, 
        	{x:['2022-10-15', '2022-10-24'], y: 'task4', name: 'Santino', status: 0 }, 
        	{x:['2022-10-18', '2022-10-30'], y: 'task5', name: 'Bob', status: 1 } 
        ],
        backgroundColor: [
          'rgba(255, 26, 104, 0.2)',
          'rgba(54, 162, 235, 0.2)',
          'rgba(255, 206, 86, 0.2)',
          'rgba(75, 192, 192, 0.2)',
          'rgba(153, 102, 255, 0.2)',
          'rgba(255, 159, 64, 0.2)',
          'rgba(0, 0, 0, 0.2)'
        ],
        borderColor: [
          'rgba(255, 26, 104, 1)',
          'rgba(54, 162, 235, 1)',
          'rgba(255, 206, 86, 1)',
          'rgba(75, 192, 192, 1)',
          'rgba(153, 102, 255, 1)',
          'rgba(255, 159, 64, 1)',
          'rgba(0, 0, 0, 1)'
        ],
        borderWidth: 1,
        borderSkipped: false,
        borderRadius: 10,
        barPercentage: 0.5
      }]
    };
	
    // status plugin block => 상태 정보 표시
    const status = {
      id : 'status',
      afterDatasetsDraw(chart, args, pluginOptions){
        const {ctx, data, chartArea: { top, bottom, left, right }, scales: { x, y} } = chart;
        
        // 아이콘
        const icons=['\uf00d','\uf110','\uf00c'];
        const colors=['rgba(255, 26, 104, 1)','rgba(255, 159, 64, 1)','rgba(75, 192, 192, 1)'];
        const angle = Math.PI / 180;
        
        ctx.save();
        ctx.font = 'bolder 12px FontAwesome';
        ctx.textBaseline = 'middle';
        ctx.textAlign = 'center';
        
        data.datasets[0].data.forEach((datapoint, index) => {
          ctx.beginPath();	
          ctx.fillStyle = colors[datapoint.status];
          //ctx.arc(x, y, radius, angleS, angleE, false);
          ctx.arc(right+ 50, y.getPixelForValue(index), 12, 0, angle*360, false);
          ctx.closePath();
          ctx.fill();
          ctx.fillStyle = 'white';
          
          ctx.fillText(icons[datapoint.status], right+ 50, y.getPixelForValue(index)); // 차트 우측 상태표시 / right+ 10으로 간격 조절
        })
        ctx.restore();
      }
    }
   
    // assignedTasks plugin block => 이름 표시
    const assignedTasks = {
      id : 'assignedTasks',
      afterDatasetsDraw(chart, args, pluginOptions){
        const {ctx, data, chartArea: { top, bottom, left, right }, scales: { x, y} } = chart;

        ctx.font = 'bolder 12px sans-serif';
        ctx.fillStyle = 'black';
        ctx.textBaseline = 'middle';
       	//ctx.textAlign = 'left'; // => ctx.restore() 로 인해 해당 라인을 주석 처리해도 글자 일부가 왼쪽으로 이동해서 가려지는 현상을 없애준다
								  
        data.datasets[0].data.forEach((datapoint, index) => {
          ctx.fillText(datapoint.name, 10, y.getPixelForValue(index)); // 차트 좌측 이름표시
        })

      }
    }
 
    // config 
    const config = {
      type: 'bar',
      data,    
      options: {
        layout: {
          padding: {
            left: 100,	// 이름을 넣기 위해 왼쪽 공간 확보
            right: 100  // 상태정보를 넣기 위해 오른쪽 공간 확보
          }
        },
	    indexAxis:'y',	
	    
        scales: {       	
          x: {       	  
            position: 'top',
            type: 'time',            
            time: {
            	//unit: 'day', // 월 : month / 일 : day
            	displayFormats:{
            		day: 'd'
            	}
            },           
            min: '2022-10-01',	// x축 : 차트 처음 시작일
            max: '2022-10-31'	// x축 : 차트 끝 종료일
          }                  
        },
        plugins:{ 
        	// 그래프에 마우스를 올려놓을 경우 보여지는 정보
        	tooltip: {
        		callbacks: {
        			title: (ctx) => {
        				
        				console.log(ctx[0].raw.x[0])
        				
        				const startDate = new Date(ctx[0].raw.x[0])
        				const endDate = new Date(ctx[0].raw.x[1])
        				
        				const formattedStartDate = startDate.toLocaleString([], {
        					year:'numeric',
        					month:'short',
        					day:'numeric',       					
        				});
        				
        				const formattedEndDate = endDate.toLocaleString([], {
        					year:'numeric',
        					month:'short',
        					day:'numeric',       					
        				});      			
        				
        				return [ctx[0].raw.name, "기간 : " + formattedStartDate + " ~ " + formattedEndDate];
        			}
        		}
        	}
        }
      },
      plugins: [assignedTasks, status]     
    };

    // render init block
    const myChart = new Chart(
      document.getElementById('myChart'),
      config
    );

    // Instantly assign Chart.js version
    const chartVersion = document.getElementById('chartVersion');
    chartVersion.innerText = Chart.version;
    </script>

  </body>
</html>