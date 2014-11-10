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
  this.ul_lengths[shortest_ul_index] += artwork.get('height_small');
};

Backbone.View.prototype.addMediumArtwork = function (artwork) {

  var uls = $('ul.artworks-index-medium')
  var view = new ArtStack.Views.MediumArtworkLI({ model: artwork });
  this.subviews.push(view);

  var shortest_ul_index = this.ul_lengths[0] < this.ul_lengths[1] ? 0 : 1;

  $(uls[shortest_ul_index]).prepend(view.render().$el);
  this.ul_lengths[shortest_ul_index] += artwork.get('height');
  console.log(this.ul_lengths, artwork.id)
};

Backbone.View.prototype.addLargeArtwork = function (artwork) {

  var $ul = $('ul.artworks-index-large')
  var view = new ArtStack.Views.LargeArtworkLI({ model: artwork });
  this.subviews.push(view);

  $ul.prepend(view.render().$el);
};

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

Backbone.View.prototype.toggleFollow = function (event) {
  event.preventDefault();

  if (this.model.get('followed')) {

    this.$("button.follow-button").addClass("followed-false");
    this.$("button.follow-button").removeClass("followed-true");
    this.model.set({ followed: false });

    $.ajax({
      type: "PATCH",
      url: this.model.urlRoot + "/" + this.model.id,
      data: {
        follow: false
      }
    });

  } else {

    this.$("button.follow-button").addClass("followed-true");
    this.$("button.follow-button").removeClass("followed-false");
    this.model.set({ followed: true });

    $.ajax({
      type: "PATCH",
      url: this.model.urlRoot + "/" + this.model.id,
      data: {
        follow: true
      }
    });
  }
};
