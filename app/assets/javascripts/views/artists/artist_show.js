ArtStack.Views.ArtistShow = Backbone.View.extend({

  template: JST['artists/artist_show'],

  initialize: function () {
    this.listenTo(this.model, "sync", this.render);
  },

  // events: {
//     "click button": "toggleStack"
//   },

  render: function () {
    var renderedContent = this.template({ artist: this.model });
    this.$el.html(renderedContent);
    return this;
  },

  toggleStack: function (event) {
    //TODO
  },

});