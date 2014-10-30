ArtStack.Views.ArtworksIndex = Backbone.View.extend({

  template: JST['artworks/index'],

  initialize: function () {
    /// TODO
  },

  events: {
    /// TODO
  },

  render: function () {
    var renderedContent = this.template({ artworks: this.collection });
    this.$el.html(renderedContent);
    return this;
  },

});