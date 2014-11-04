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

    if (this.model.artworks) {
      this.model.artworks.each(function (artwork) {
        var view = new ArtStack.Views.ArtistShowArtworkLI({model: artwork});
        that.subviews.push(view);
        that.$el.find("#" + that.model.id).append(view.render().$el);
      });
    }

    return this;
  },

  toggleStack: function (event) {
    //TODO
  },

});
