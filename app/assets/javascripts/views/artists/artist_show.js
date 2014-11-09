ArtStack.Views.ArtistShow = Backbone.View.extend({

  template: JST['artists/artist_show'],

  followTemplate: JST['follows/_follow_button'],

  initialize: function () {
    this.listenTo(this.model, "sync", this.render);
    this.subviews = [];
    this.ul_lengths = [0, 0];
  },

  events: {
    "click button.follow-button": "toggleFollow"
  },

  render: function () {
    var renderedContent = this.template({ artist: this.model });
    var followButton = this.followTemplate({ followable: this.model });
    this.$el.html(renderedContent);
    this.$el.prepend(followButton);

    if (this.model.artworks) {
      this.model.artworks.each(function (artwork) {
        this.addMediumArtwork(artwork);
      }.bind(this));
    };

    return this;
  },

});
