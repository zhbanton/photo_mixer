$(document).ready( function() {
  $('#new-comment').submit(createComment);
  $('#favorite-button').click(favorite);
  $('.close').click(function(event){
    $(this).parent().remove();
  });

  CanvasApp.init();

  event.preventDefault();
});

// $canvas.offset().top
// $canvas.offset().left

var CanvasApp = {
  init : function(){
    this.clickX = [];
    this.clickY = [];
    this.clickDrag = [];
    this.paint = false;

    this.canvas = document.getElementById('myCanvas');
    this.$submitBtn = $('#submitBtn');

    var that = this;
    this.canvas.onmousedown = function(event) {
     var mouseX = event.x - this.offsetLeft;
     var mouseY = event.y - this.offsetTop;
     //var mouseX = this.offsetLeft;
     //var mouseY = this.offsetTop;

      that.paint = true;
      that.addClick(mouseX, mouseY);
      that.redraw();
    };

    this.canvas.onmousemove = function(event){
      if (that.paint) {
        that.addClick(event.x - this.offsetLeft, event.y - this.offsetTop, true);
        //that.addClick(this.offsetLeft, this.offsetTop, true);
        that.redraw();
      }
    };

    this.canvas.onmouseup = function(){
      that.paint = false;

    };

    this.canvas.onmouseleave = function() {
      that.paint = false;
    };

    this.$submitBtn.click(function(event){
      that.loadImage();
      event.preventDefault();
    });
  },

  loadImage : function(){
    var context = this.canvas.getContext('2d');
    var imgWidth = $('#imageShow').width();
    var imgHeight = $('#imageShow').height();
    console.log(imgWidth);



    $('#myCanvas').attr({
      //width: imgWidth,
      //height: imgHeight,
      style: 'background: url(' + gon.image_path + ") no-repeat;"
    });
    $('#imageShow').hide();

    //context.drawImage($('#imageShow'),0,0,imgWidth,imgHeight);
    //.drawImage($('#imageShow'), 0, 0)
  },

  addClick : function(x, y, dragging){
    this.clickX.push(x);
    this.clickY.push(y);
    this.clickDrag.push(dragging);
  },

  redraw : function(){

    var context = this.canvas.getContext('2d');
    context.clearRect(0, 0, context.canvas.width, context.canvas.height);
    this.loadImage();
    context.strokeStyle = "#000000";
    context.lineJoin = "round";
    context.lineWidth = 5;

    var that = this;
    for(var i = 0; i < this.clickX.length; i++) {
      context.beginPath();
      if(this.clickDrag[i] && i) {
        context.moveTo(this.clickX[i - 1], this.clickY[i - 1]);
      } else {
        context.moveTo(this.clickX[i] - 1, this.clickY[i]);
      }
      context.lineTo(this.clickX[i], this.clickY[i]);
      context.closePath();
      context.stroke();
    }
  }
};

