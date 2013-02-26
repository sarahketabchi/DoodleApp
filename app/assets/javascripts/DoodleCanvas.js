var Doodle = (function () {
  var Pic = function(ctx) {
    var drawing = false;
    var that = this;

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

    // $('#save-canvas').click(function () {
    //   alert("yay");
    //   that.save();
    // });

    this.save = function() {
      alert("saving");
      var canvas = document.getElementById('canvas');
      var img = canvas.toDataURL("image/png");

      // open saved img in new window
      //window.open(img);

      // ajax.post to server
    };
  }

  return {
    Pic: Pic
  }

})();