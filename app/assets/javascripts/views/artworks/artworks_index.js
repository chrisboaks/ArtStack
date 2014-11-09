ArtStack.Views.ArtworksIndex = Backbone.View.extend({

  template: JST['artworks/artworks_index'],

  initialize: function () {
    this.listenTo(this.collection, "add", this.addSmallArtwork);
    this.subviews = [];
    this.ul_lengths = [0, 0, 0];
  },

  render: function () {
    var renderedContent = this.template({ artworks: this.collection });
    this.$el.html(renderedContent);
    var that = this;

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
