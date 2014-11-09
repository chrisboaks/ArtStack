ArtStack.Views.ArtworkShow = Backbone.View.extend({

  template: JST['artworks/artwork_show'],

  stackTemplate: JST['stacks/_stack_button'],

  initialize: function () {
    this.listenToOnce(this.model, "sync", this.render);
  },

  events: {
    "click button": "toggleStack"
  },

  render: function () {
    var renderedContent = this.template({ artwork: this.model });
    var button = this.stackTemplate({ artwork: this.model });
    this.$el.html(renderedContent);
    this.$(".art-image").append(button);
    return this;
  },

});
