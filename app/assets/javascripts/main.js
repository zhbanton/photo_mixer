$(document).ready( function() {
    $('#new-comment').submit(createComment);
    $('#favorite-button').click(favorite);
    $('.close').click(function(event){
      $(this).parent().remove();
      event.preventDefault();
    });
    if(document.getElementById('myCanvas')){
      $('#submitBtn').click(CanvasApp.init());
    }
    $('body').on('click', '.upvote', vote);
    $('body').on('click', '.downvote', vote);


});

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
      var mouseX = event.pageX - this.offsetLeft - 275;
      var mouseY = event.pageY - this.offsetTop - 40;

      that.paint = true;
      that.addClick(event.pageX - this.offsetLeft - 275, event.pageY - this.offsetTop - 40);
      that.redraw();
    };

    this.canvas.onmousemove = function(event){
      if (that.paint) {
        that.addClick(event.pageX - this.offsetLeft - 275, event.pageY - this.offsetTop - 40, true);
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

  loadImage: function(){
    var context = this.canvas.getContext('2d');
    var imgWidth = $('#imageShow').width();
    var imgHeight = $('#imageShow').height();

    $('#myCanvas').attr({
      width: imgWidth,
      height: imgHeight,
      style: 'background: url(' + gon.image_path + ") no-repeat;"
    });
    $('#imageShow').hide();
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
