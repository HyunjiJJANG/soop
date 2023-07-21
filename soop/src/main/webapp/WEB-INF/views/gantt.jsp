<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>gantt chart</title>
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
        width: 40%;
        padding: 20px;
        border-radius: 20px;
        border: solid 3px rgba(54, 162, 235, 1);
        background: white;
      }
    </style>
  </head>
  
  <body>
  
  	<h2>${list }</h2>
  
  
    <div class="chartMenu">
      <!-- <p>WWW.CHARTJS3.COM (Chart JS <span id="chartVersion"></span>)</p> -->
      <p>SOOP</p>
    </div>
    
    <div class="chartCard">
      <div class="chartBox">
        <canvas id="myChart"></canvas>
      </div>
    </div>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/chart.js/dist/chart.umd.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chartjs-adapter-date-fns/dist/chartjs-adapter-date-fns.bundle.min.js"></script>
    
    <script>
    // setup 
    const data = {
      //labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
      datasets: [{
        label: 'Weekly Sales',
        data: [
        	{x:['2022-10-03', '2022-10-06'], y: 'project_name', name: 'James' }, // x : ì²«ë ì§, ëë ì§ë¥¼ ì§ì í  ì ìì / [] ìì ìì´ì¼í¨
        	{x:['2022-10-06', '2022-10-12'], y: 'task1', name: ['Luna' , ' two'] }, // x : ì²«ë ì§, ëë ì§ë¥¼ ì§ì í  ì ìì / [] ìì ìì´ì¼í¨
        	{x:['2022-10-09', '2022-10-12'], y: 'task2', name: 'David' }, // x : ì²«ë ì§, ëë ì§ë¥¼ ì§ì í  ì ìì / [] ìì ìì´ì¼í¨
        	{x:['2022-10-12', '2022-10-21'], y: 'task3', name: 'Lily' }, // x : ì²«ë ì§, ëë ì§ë¥¼ ì§ì í  ì ìì / [] ìì ìì´ì¼í¨
        	{x:['2022-10-15', '2022-10-24'], y: 'task4', name: 'Santino' }, // x : ì²«ë ì§, ëë ì§ë¥¼ ì§ì í  ì ìì / [] ìì ìì´ì¼í¨
        	{x:['2022-10-18', '2022-10-30'], y: 'task5', name: 'Bob' } // x : ì²«ë ì§, ëë ì§ë¥¼ ì§ì í  ì ìì / [] ìì ìì´ì¼í¨
        ],
        backgroundColor: [
          'rgba(255, 26, 104, 0.2)',
          'rgba(54, 162, 235, 0.2)',
          'rgba(255, 206, 86, 0.2)',
          'rgba(75, 192, 192, 0.2)',
          'rgba(153, 102, 255, 0.2)',
          'rgba(255, 159, 64, 1)',
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

    // assignedTasks plugin block
    const assignedTasks = {
      id : 'assignedTasks',
      afterDatasetsDraw(chart, args, pluginOptions){
        const {ctx, data, chartArea: { top, bottom, left, right }, scales: { x, y} } = chart;

        ctx.font = 'bolder 12px sans-serif';
        ctx.fillStyle = 'black';
        ctx.textBaseline = 'middle';

        data.datasets[0].data.forEach((datapoint, index) => {
          ctx.fillText(datapoint.name, 10, y.getPixelForValue(index)); // ì¢ì¸¡ ì´ë¦
        });

      }
    }
 
      // shortYGridLines plugin block (ì©ë : ê·¸ëí ìë ìì ê·¸ëíë¥¼ ë£ì ìì ì´ìì¼ë..ì¤í¨ => íë¡ì í¸ì¥ ì´ë¦ ë°ì¤ì©ëë¡ ì¬ì© )
      const shortYGridLines = {
    	id: 'shortYGridLines',
    	beforeDatasetsDraw(chart, args, pluginOptions){
    		const {ctx, chartArea:{left}, scales:{x,y} } = chart;
    		ctx.save();
    		ctx.beginPath();
    		ctx.lineWidth = 3;
    		ctx.strokeStyle = 'rgba(255, 26, 104, 1)';
    		//console.log(y)
        ctx.moveTo(left, y._gridLineItems[1].ty1);
        ctx.lineTo(x.getPixelForValue(1) ,y._gridLineItems[1].ty1);
        ctx.stroke();
    	}
    }

    // config 
    const config = {
      type: 'bar',
      data,    
      options: {
        layout: {
          padding: {
            left: 100
          }
        },
	    indexAxis:'y',	
	    
        scales: {       	
          x: {       	  
            position: 'top',
            type: 'time',            
            time: {
            	unit: 'day' // ìë³ : month / ì¼ : day
            },           
            min: '2022-10-01',	// ììë ì§ (xì¶ ë§¨ ì²ì ë ì§)
            max: '2022-10-31'	// ëë ì§ (xì¶ ë§¨ ë ë ì§)
          }                  
        },        
        plugins: {
          legend: {
            display : false
          }
        }
      },
      plugins: [assignedTasks, shortYGridLines]
      
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