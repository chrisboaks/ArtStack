ArtStack.Views.ArtworkListItem = Backbone.View.extend({

  template: JST['artworks/_list_item'],

  tagName: 'li',

  initialize: function () {
    this.listenTo(this.model, "sync", this.render);
  },

  render: function () {
    var renderedContent = this.template({ artwork: this.model });
    this.$el.html(renderedContent);
    return this;
  },

})