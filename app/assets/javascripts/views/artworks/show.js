ArtStack.Views.ArtworkShow = Backbone.View.extend({

  template: JST['artworks/index'],

  initialize: function () {
    this.listenTo(this.model, "sync", this.render);
  },

  // events: {
//     "click button": "toggleStack"
//   },

  render: function () {
    var renderedContent = this.template({ artwork: this.model });
    this.$el.html(renderedContent);
    return this;
  },

  toggleStack: function (event) {
    //TODO
  },

});