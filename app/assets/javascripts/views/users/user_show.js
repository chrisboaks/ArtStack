ArtStack.Views.UserShow = Backbone.View.extend({

  template: JST['users/show'],

  initialize: function () {
    this.listenTo(this.model, "sync", this.render);
    this.subviews = [];
  },
  //
  // events: {
  //   "click button": "toggleStack"
  //   //TODO
  // },
  //
  render: function () {
    var renderedContent = this.template({ user: this.model });
    this.$el.html(renderedContent);
    that = this;

    if (this.model.user_artworks) {
      this.model.user_artworks.each(function (artwork) {
        var view = new ArtStack.Views.ArtworkListItem({ model: artwork });
        that.subviews.push(view);
        that.$el.find("#artworks-index").append(view.render().$el);
      });
    }
    return this;
  },
  //
  // toggleStack: function (event) {
  //   //TODO
  // },

});