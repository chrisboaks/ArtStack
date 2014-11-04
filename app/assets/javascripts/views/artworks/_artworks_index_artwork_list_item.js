ArtStack.Views.ArtworksIndexArtworkLI = Backbone.View.extend({

  template: JST['artworks/_artworks_index_artwork_li'],

  tagName: 'li',

  initialize: function () {
    this.listenTo(this.model, "sync", this.render);
  },

  render: function () {
    var renderedContent = this.template({ artwork: this.model });
    this.$el.html(renderedContent);
    return this;
  },

});
