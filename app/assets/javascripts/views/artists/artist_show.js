ArtStack.Views.ArtistShow = Backbone.View.extend({

  template: JST['artists/artist_show'],

  initialize: function () {
    this.listenTo(this.model, "sync", this.render);
    this.subviews = [];
  },

  render: function () {
    var renderedContent = this.template({ artist: this.model });
    this.$el.html(renderedContent);
    var that = this;
    var uls = $('ul.artist-show-list').toArray();

    if (this.model.artworks) {
      this.model.artworks.each(function (artwork) {
        var view = new ArtStack.Views.MediumArtworkLI({model: artwork});
        that.subviews.push(view);

        var shortest = ($(uls[0]).height() < $(uls[1]).height() ? uls[0] : uls[1]);
        $(shortest).prepend(view.render().$el);
      });
    };

    return this;
  },

});
