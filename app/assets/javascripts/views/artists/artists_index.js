ArtStack.Views.ArtistsIndex = Backbone.View.extend({

  template: JST['artists/artists_index'],

  initialize: function () {
    this.listenTo(this.collection, "sync", this.render);
    this.subviews = [];
  },

  events: {
    "click button": "toggleStack"
    //TODO
  },

  render: function () {
    var renderedContent = this.template({ artists: this.collection });
    this.$el.html(renderedContent);
    var that = this;

    this.collection.each(function (artist) {
      artist.artworks.each(function (artwork) {
        var view = new ArtStack.Views.ArtworkListItem({model: artwork});
        that.subviews.push(view);
        that.$el.find("#" + artist.id).append(view.render().$el);
      });
    });

    return this;
  },

  toggleStack: function (event) {
    //TODO
  },

  remove: function () {
    this.subviews.each(function (sub) {
      sub.remove();
    });
    Backbone.View.prototype.remove.call(this);
  },

});