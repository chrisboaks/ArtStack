ArtStack.Views.UserShow = Backbone.View.extend({

  template: JST['users/user_show'],

  profileTemplate: JST['users/_user_profile'],

  initialize: function () {
    this.listenTo(this.model, "sync", this.render);
    this.subviews = [];
    this.ul_lengths = [0, 0];
  },

  render: function () {
    var renderedContent = this.template({ user: this.model });
    var profileContent = this.profileTemplate({ user: this.model });

    this.$el.html(renderedContent);
    this.$el.find('#user-profile').append(profileContent);
    that = this;

    if (this.model.user_artworks) {
      this.model.user_artworks.each(function (artwork) {
        that.addArtwork(artwork);
      });
    };

    return this;
  },

  addArtwork: function (artwork) {
    var uls = $('ul.artist-show-list').toArray();
    var view = new ArtStack.Views.MediumArtworkLI({ model: artwork });
    that.subviews.push(view);

    var shortest_ul_index = that.ul_lengths[0] < that.ul_lengths[1] ? 0 : 1;

    $(uls[shortest_ul_index]).prepend(view.render().$el);
    that.ul_lengths[shortest_ul_index] += artwork.get('height');
  },

});
