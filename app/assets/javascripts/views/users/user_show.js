ArtStack.Views.UserShow = Backbone.View.extend({

  template: JST['users/user_show'],

  initialize: function () {
    this.listenTo(this.model, "sync", this.render);
    this.subviews = [];
  },

  render: function () {
    var renderedContent = this.template({ user: this.model });
    this.$el.html(renderedContent);
    that = this;

    if (this.model.user_artworks) {
      this.model.user_artworks.each(function (artwork) {
        var view = new ArtStack.Views.SmallArtworkLI({ model: artwork });
        that.subviews.push(view);
        that.$el.find("#artworks-index").append(view.render().$el);
      });
    }
    return this;
  },

});
