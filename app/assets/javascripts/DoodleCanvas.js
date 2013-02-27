// REV: file should be named underscorized
var Doodle = (function () {
  var Pic = function(ctx) {
    var drawing = false;
    var that = this;

    // REV: This isn't very OO, because creating a Pic object will
    // bind to *every* canvas element on the page; I'd pass the
    // element in.
    // REV: though I suppose there's only one canvas el.
    $('#canvas').mousedown(function (event) {
      console.log(event.pageX - $(this).parent().offset().left);
      var x = event.pageX - $(this).parent().offset().left;
      var y = event.pageY - $(this).parent().offset().top;

      that.drawing = true;
      ctx.moveTo(x, y);
      ctx.beginPath();
    });

    $('#canvas').mousemove(function (event) {
      var x = event.pageX - $(this).parent().offset().left;
      var y = event.pageY - $(this).parent().offset().top;

      if (that.drawing == true) {
        ctx.lineTo(x, y);
        ctx.stroke();
      };
    });

    $('#canvas').mouseup(function (event) {
      that.drawing = false;
    });  

    // this.save = function() {
    //   alert("saving");
    //   var canvas = document.getElementById('canvas');
    //   var img = canvas.toDataURL("image/png");
    // };
  }

  return {
    Pic: Pic
  }

})();
