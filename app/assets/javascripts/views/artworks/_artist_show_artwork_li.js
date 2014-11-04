ArtStack.Views.ArtistShowArtworkLI = Backbone.View.extend({

  template: JST['artworks/_artist_show_artwork_li'],

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
