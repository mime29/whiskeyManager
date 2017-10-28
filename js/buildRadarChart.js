
function drawChart() {
    /* Radar chart design created by Nadieh Bremer - VisualCinnamon.com */

    ////////////////////////////////////////////////////////////// 
    //////////////////////// Set-Up ////////////////////////////// 
    ////////////////////////////////////////////////////////////// 

    var margin = {top: 100, right: 100, bottom: 100, left: 100},
    width = Math.min(700, window.innerWidth - 10) - margin.left - margin.right,
    height = Math.min(width, window.innerHeight - margin.top - margin.bottom - 20);

    ////////////////////////////////////////////////////////////// 
    ////////////////////////// Data ////////////////////////////// 
    ////////////////////////////////////////////////////////////// 

    var data = [
                  [//current user
                  {axis:"Attack",value:0.22},
                  {axis:"Strength",value:0.50},
                  {axis:"Length",value:0.29},
                  {axis:"Sweetness",value:0.17},
                  {axis:"Depth",value:0.70},
                  {axis:"Complexity",value:0.02}      
                  ],[//all users
                  {axis:"Attack",value:0.10},
                  {axis:"Strength",value:0.33},
                  {axis:"Length",value:0.90},
                  {axis:"Sweetness",value:0.17},
                  {axis:"Depth",value:0.0},
                  {axis:"Complexity",value:0.28} 
                  ]
              ];

    ////////////////////////////////////////////////////////////// 
    //////////////////// Draw the Chart ////////////////////////// 
    ////////////////////////////////////////////////////////////// 

    var color = d3.scale.ordinal()
    .range(["#EDC951","#CC333F","#00A0B0"]);

    var radarChartOptions = {
      w: width,
      h: height,
      margin: margin,
      maxValue: 0.5,
      levels: 5,
      roundStrokes: true,
      color: color
  };
    //Call function to draw the Radar chart
    RadarChart(".radarChart", data, radarChartOptions);
}