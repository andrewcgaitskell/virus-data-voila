// Define a module, using RequireJS syntax, called 'viz'. 
// 'viz' is defined as a function with argument 'container' (to append the SVG element to)
// 'viz' draws a 50 x 50 rectangle

define('viz', ['d3'], function (d3) {
    function draw(container) {
        d3.select(container).append("svg").append('rect').attr('id', 'viz_rect').attr('width', 50).attr('height', 50);
        }
    return draw;
});
element.append('Loaded 😄 ');