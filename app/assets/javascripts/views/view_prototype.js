Backbone.View.prototype.toggleStack = function () {

  event.preventDefault();

  if (this.model.get('stacked')) {

    this.$("button").addClass("stacked-false");
    this.$("button").removeClass("stacked-true");
    this.model.set({ stacked: false });

    $.ajax({
      type: "PATCH",
      url: "/api/artworks/" + this.model.id,
      data: {
        stack: false
      }
    });

  } else {

    this.$("button").addClass("stacked-true");
    this.$("button").removeClass("stacked-false");
    this.model.set({ stacked: true });

    $.ajax({
      type: "PATCH",
      url: "/api/artworks/" + this.model.id,
      data: {
        stack: true
      }
    });
  }

};

Backbone.View.prototype.addSmallArtwork = function (artwork) {

  var $uls = this.$('ul');
  var view = new ArtStack.Views.SmallArtworkLI({ model: artwork });
  this.subviews.push(view);
  var shortest_ul_index = 0;

  for (var i = 0; i < 3; i++) {
    if (this.ul_lengths[shortest_ul_index] > this.ul_lengths[i]) {
      shortest_ul_index = i;
    }
  }

  $uls.eq(shortest_ul_index).prepend(view.render().$el);
  this.ul_lengths[shortest_ul_index] += artwork.get('height');

};
