var Doodle = (function () {
  var Pic = function(ctx) {
    var drawing = false;
    var that = this;

    $('canvas').mousedown(function (event) {
      console.log(event.pageX - $(this).parent().offset().left);
      var x = event.pageX - $(this).parent().offset().left;
      var y = event.pageY - $(this).parent().offset().top;

      that.drawing = true;
      // moveTo() starting position
      ctx.moveTo(x, y);
      // begin drawing
      ctx.beginPath();
    });

    $('canvas').mousemove(function (event) {
      var x = event.pageX - $(this).parent().offset().left;
      var y = event.pageY - $(this).parent().offset().top;

      if (that.drawing == true) {
        // add new point to path with lineTo()
        ctx.lineTo(x, y);
        // color last segment with stoke()
        ctx.stroke();
      };
    });

    $('canvas').mouseup(function (event) {
      // set flag to stop drawing
      that.drawing = false;
    });  

    $('#save-canvas').click(function () {
      alert("yay");
      that.save();
    });

    this.save = function() {
      var canvas = document.getElementById('canvas');
      var img = canvas.toDataURL("image/png");
      // ajax.post to server

    };

    this.draw = function() {
      // ctx.fillStyle = "800080";
      // ctx.fillRect(250, 250, 50, 20);
    };
  }

  return {
    Pic: Pic
  }

})();