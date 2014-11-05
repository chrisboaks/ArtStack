ArtStack.Views.ArtistShow = Backbone.View.extend({

  template: JST['artists/artist_show'],

  initialize: function () {
    this.listenTo(this.model, "sync", this.render);
    this.subviews = [];
  },

  // events: {
//     "click button": "toggleStack"
//   },

  render: function () {
    var renderedContent = this.template({ artist: this.model });
    this.$el.html(renderedContent);
    var that = this;
    var uls = $('ul.artist-show-list').toArray();

    if (this.model.artworks) {
      this.model.artworks.each(function (artwork) {
        var view = new ArtStack.Views.ArtistShowArtworkLI({model: artwork});
        that.subviews.push(view);

        var shortest = ($(uls[0]).height() < $(uls[1]).height() ? uls[0] : uls[1]);
        $(shortest).append(view.render().$el);
      });
    };

    return this;
  },

  toggleStack: function (event) {
    //TODO
  },

});
