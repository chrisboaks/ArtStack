ArtStack.Views.ArtistShow = Backbone.View.extend({

  template: JST['artists/artist_show'],

  initialize: function () {
    this.listenTo(this.model, "sync", this.render);
    this.subviews = [];
    this.ul_lengths = [0, 0];
  },

  render: function () {
    var renderedContent = this.template({ artist: this.model });
    this.$el.html(renderedContent);
    var that = this;
    var uls = $('ul.artist-show-list').toArray();

    if (this.model.artworks) {
      this.model.artworks.each(function (artwork) {
        var view = new ArtStack.Views.MediumArtworkLI({ model: artwork });
        that.subviews.push(view);

        var shortest_ul_index = that.ul_lengths[0] < that.ul_lengths[1] ? 0 : 1;

        $(uls[shortest_ul_index]).prepend(view.render().$el);
        that.ul_lengths[shortest_ul_index] += artwork.get('height');
        console.log(that.ul_lengths);
      });
    };

    return this;
  },

});
