
var margin = {top: 10, right: 10, bottom: 10, left: 10};
var w = 500 - margin.left - margin.right;
var h = 325 - margin.top - margin.bottom;
var barPadding = 2;

// var dataset = <%= raw(@bootcamps.to_json) %>

// console.log(dataset);

var graphDraw = function(sub, multiplier) {

  var xPlot = function(d, i) { return i * (w / dataset.length); };
  var yPlot = function(d) { return h - (d[sub] * multiplier); };

//create x and y axes

  var xScale = d3.scale.ordinal()
    .domain(dataset.map(function (d) {return d.name; }))
    .rangeRoundBands([barPadding, w + margin.left + margin.right], 0);

  var xAxis = d3.svg.axis()
    .scale(xScale)
    .orient("top");


  var svg = d3.select("#statsbox1").append("svg")
    .attr("width", w)
    .attr("height", h)
    .attr("padding", 20)
    .attr("margin", 20);
 


var rects = svg.selectAll("rect")
    .data(dataset)
    .enter()
    .append("rect")
    .attr("x", xPlot)
    .attr("y", yPlot)
    .attr("transform", "translate(20,0)")
    .attr("id", function(d){ return d.slug; })
    .attr("width", w / dataset.length - barPadding*2)
    .attr("height", function(d) { return (d[sub]+2000) * multiplier ;})
    .attr("fill", function(d) {
      return "rgb(150, " + (Math.round(d[sub] * multiplier)) + ", 30)";
    })
    .on("mouseover", function(){
      d3.select(this).attr("stroke", "orange");
    })
    .on("mouseout", function(){
      d3.select(this).attr("stroke", "green");
    });
    

var color = function(d) { return "rgb(150, " + (Math.round(d[sub] * multiplier)) + ", 30)" };    

// add text to show attributes on hover 
var texts = svg.selectAll("text")
    .data(dataset)
    .enter();



// name of school
texts.append("text")
  .text(function(d) { return d.name;})
  .attr("x", 15)
  .attr("y", 25)
  .attr("id", function (d){ return d.slug + "_label"; })
  .attr("class", "xLabels")
  .attr("fill", color);

// data attribute (tuition, hours etc)
texts.append("text")
  .text(function(d) { return "Tuition: $" + d[sub]; })
  .attr("x", 15)
  .attr("y", 50)
  .attr("id", function (d){ return d.slug + "_label2"; })
  .attr("class", "xLabels2")
  .attr("fill", color); 

texts.append("text")
  .text(function(d) { return "Aprox Cost/Hour: $" + (d.tuition/d.hours).toFixed(2); })
  .attr("x", 15)
  .attr("y", 70)
  .attr("id", function (d){ return d.slug + "_label3"; })
  .attr("class", "xLabels3")
  .attr("fill", color); 


};

$(document).ready(function() {




});
