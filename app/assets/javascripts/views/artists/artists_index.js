ArtStack.Views.ArtistsIndex = Backbone.View.extend({

  template: JST['artists/artists_index'],

  initialize: function () {
    this.listenTo(this.collection, "sync", this.render);
    this.subviews = [];
  },

  render: function () {
    var renderedContent = this.template({ artists: this.collection });
    this.$el.html(renderedContent);
    var that = this;

    this.collection.each(function (artist) {
      artist.artworks.each(function (artwork) {
        var view = new ArtStack.Views.MediumArtworkLI({model: artwork});
        that.subviews.push(view);
        that.$el.find("#" + artist.id).prepend(view.render().$el);
      });
    });

    return this;
  },

  remove: function () {
    this.subviews.forEach(function (sub) {
      sub.remove();
    });
    Backbone.View.prototype.remove.call(this);
  },

});

//TODO REFACTOR OR DELETE
