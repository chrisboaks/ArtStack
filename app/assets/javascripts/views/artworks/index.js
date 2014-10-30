ArtStack.Views.ArtworksIndex = Backbone.View.extend({

  template: JST['artworks/index'],

  initialize: function () {
    this.listenTo(this.collection, "add edit sync", this.render);
  },

  events: {
    "click button": "toggleStack"
  },

  render: function () {
    var renderedContent = this.template({ artworks: this.collection });
    this.$el.html(renderedContent);
    return this;
  },

  toggleStack: function (event) {
    //TODO
  },

});