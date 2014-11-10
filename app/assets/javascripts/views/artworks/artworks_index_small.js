ArtStack.Views.ArtworksIndexSmall = Backbone.View.extend({

  template: JST['artworks/artworks_index_small'],

  initialize: function () {
    this.listenTo(this.collection, "add", this.addSmallArtwork);
    this.subviews = [];
    this.ul_lengths = [0, 0, 0];
  },

  render: function () {
    var renderedContent = this.template({ artworks: this.collection });
    this.$el.html(renderedContent);

    this.collection.each(this.addSmallArtwork.bind(this));

    return this;
  },

  remove: function () {
    _(this.subviews).each(function (sub) {
      sub.remove();
    });
    Backbone.View.prototype.remove.call(this);
  },

});
