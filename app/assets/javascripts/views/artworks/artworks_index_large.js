ArtStack.Views.ArtworksIndexLarge = Backbone.View.extend({

  template: JST['artworks/artworks_index_large'],

  initialize: function () {
    this.listenTo(this.collection, "add", this.addLargeArtwork);
    this.subviews = [];
  },

  render: function () {
    var renderedContent = this.template({ artworks: this.collection });
    this.$el.html(renderedContent);

    this.collection.each(this.addLargeArtwork.bind(this));

    return this;
  },

  remove: function () {
    _(this.subviews).each(function (sub) {
      sub.remove();
    });
    Backbone.View.prototype.remove.call(this);
  },

});
