ArtStack.Views.UserShow = Backbone.View.extend({

  template: JST['users/show'],

  events: {
    "click button": "toggleStack"
    //TODO
  },

  // render: function () {
  //   var renderedContent = this.template({ user: this.model });
  //   this.$el.html(renderedContent);
  //
  //   if (this.model.user_artworks) { function () {
  //     console.log(this.model.user_artworks)
  //   }};
  //
  //
  //   return this;
  // },

  toggleStack: function (event) {
    //TODO
  },

});