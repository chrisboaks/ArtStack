ArtStack.Views.ArtistsIndex = Backbone.View.extend({

  template: JST['artists/index'],

  initialize: function () {
    this.listenTo(this.collection, "add edit sync", this.render);
  },

  events: {
    "click button": "toggleStack"
    //TODO
  },

  render: function () {
        console.log(this.collection)
    var renderedContent = this.template({ artists: this.collection });
    this.$el.html(renderedContent);
    return this;
  },

  toggleStack: function (event) {
    //TODO
  },

});