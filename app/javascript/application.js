// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "chartkick"
import "Chart.bundle"

// window.parent.soundClick()

// function soundClick() {
//   var audio = new Audio(); // Создаём новый элемент Audio
//   audio.src = 'click.mp3'; // Указываем путь к звуку "клика"
//   audio.autoplay = true; // Автоматически запускаем
// }



///////////////////// Г Р А Ф И К /////////////////////////


// am5.ready(function() {

//   // Create root element
//   // https://www.amcharts.com/docs/v5/getting-started/#Root_element
//   var root = am5.Root.new("chartdiv");
  
  
//   // Set themes
//   // https://www.amcharts.com/docs/v5/concepts/themes/
//   root.setThemes([
//     am5themes_Animated.new(root)
//   ]);
  
  
//   // Create chart
//   // https://www.amcharts.com/docs/v5/charts/xy-chart/
//   var chart = root.container.children.push(am5xy.XYChart.new(root, {
//     panX: true,
//     panY: true,
//     wheelX: "panX",
//     wheelY: "zoomX",
//     pinchZoomX:true
//   }));
  
  
//   // Add cursor
//   // https://www.amcharts.com/docs/v5/charts/xy-chart/cursor/
//   var cursor = chart.set("cursor", am5xy.XYCursor.new(root, {
//     behavior: "none"
//   }));
//   cursor.lineY.set("visible", false);
  
  
//   // Generate random data
//   var date = new Date();
//   date.setHours(0, 0, 0, 0);
//   var value = 100;
  
//   function generateData() {
//     value = Math.round((Math.random() * 10 - 5) + value);
//     am5.time.add(date, "day", 1);
//     return {
//       date: date.getTime(),
//       value: value
//     };
//   }
  
//   function generateDatas(count) {
//     var data = [];
//     for (var i = 0; i < count; ++i) {
//       data.push(generateData());
//     }
//     return data;
//   }
  
  
//   // Create axes
//   // https://www.amcharts.com/docs/v5/charts/xy-chart/axes/
//   var xAxis = chart.xAxes.push(am5xy.DateAxis.new(root, {
//     maxDeviation: 0.2,
//     baseInterval: {
//       timeUnit: "day",
//       count: 1
//     },
//     renderer: am5xy.AxisRendererX.new(root, {}),
//     tooltip: am5.Tooltip.new(root, {})
//   }));
  
//   var yAxis = chart.yAxes.push(am5xy.ValueAxis.new(root, {
//     renderer: am5xy.AxisRendererY.new(root, {})
//   }));
  
  
//   // Add series
//   // https://www.amcharts.com/docs/v5/charts/xy-chart/series/
//   var series = chart.series.push(am5xy.LineSeries.new(root, {
//     name: "Series",
//     xAxis: xAxis,
//     yAxis: yAxis,
//     valueYField: "value",
//     valueXField: "date",
//     tooltip: am5.Tooltip.new(root, {
//       labelText: "{valueY}"
//     })
//   }));
  
  
//   // Add scrollbar
//   // https://www.amcharts.com/docs/v5/charts/xy-chart/scrollbars/
//   chart.set("scrollbarX", am5.Scrollbar.new(root, {
//     orientation: "horizontal"
//   }));
  
  
//   // Set data
//   var data = generateDatas(1200);
//   series.data.setAll(data);
  
  
//   // Make stuff animate on load
//   // https://www.amcharts.com/docs/v5/concepts/animations/
//   series.appear(1000);
//   chart.appear(1000, 100);
  
//   }); // end am5.ready()


//////////////////////////////////////////////////////////////////////






// export function elastic(x, timeFraction) {
//   return Math.pow(2, 10 * (timeFraction - 1)) * Math.cos(20 * Math.PI * x / 3 * timeFraction)
// }

// // document.addEventListener(type: 'mousedown', on_mouse_down, options: false);


// window.paintIt = function(event, backgroundColor, textColor) {
//   event.preventDefault();
//   event.target.style.backgroundColor = backgroundColor;
//   if (textColor) {
//     var audio = new Audio(); // Создаём новый элемент Audio
//     audio.src = 'metr_1.mp3'; // Указываем путь к звуку "клика"
//     audio.autoplay = true; // Автоматически запускаем
//   }
//   var audio = new Audio(); // Создаём новый элемент Audio
//   audio.src = 'metr_1.mp3'; // Указываем путь к звуку "клика"
//   audio.autoplay = true; // Автоматически запускаем
// }



// const newButton = document.getElementById('btn_metr');

// function changeBackground(option){
// 	// var audio_good = document.getElementById(option);
//   // audio_good.play();
//   alert('check')
// }

// newButton.addEventListener('click', changeBackground('metr_2'));

// play('metr_2')


const newButton = document.getElementById('btn_metr');

function changeBackground(){
	// alert('check')
  var audio_good = document.getElementById('metr_2');
  audio_good.play();
}

newButton.addEventListener('click', changeBackground);

