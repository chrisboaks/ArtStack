ArtStack.Views.ArtworksIndex = Backbone.View.extend({

  template: JST['artworks/artworks_index'],

  initialize: function () {
    this.listenTo(this.collection, "sync", this.render);
    this.subviews = [];
  },

  events: {
    "click button": "toggleStack"
    //TODO
  },

  render: function () {
    var renderedContent = this.template({ artworks: this.collection });
    this.$el.html(renderedContent);
    var that = this;

    this.collection.each(function (artwork) {
      var view = new ArtStack.Views.ArtworkListItem({ model: artwork });
      that.subviews.push(view);
      that.$el.find("#artworks-index").append(view.render().$el);
    });
    return this;
  },

  remove: function () {
    this.subviews.each(function (sub) {
      sub.remove();
    });
    Backbone.View.prototype.remove.call(this);
  },

  toggleStack: function (event) {
    //TODO
  },

});