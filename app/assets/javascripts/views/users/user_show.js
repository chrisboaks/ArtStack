ArtStack.Views.UserShow = Backbone.View.extend({

  template: JST['users/user_show'],

  profileTemplate: JST['users/_user_profile'],

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
    var renderedContent = this.template({ user: this.model });
    var profileContent = this.profileTemplate({ user: this.model });

    if (window.currentUserId !== this.model.id) {
      var followButton = this.followTemplate({ followable: this.model });
    }

    this.$el.html(renderedContent);
    this.$el.find('#user-profile').append(profileContent);
    this.$el.prepend(followButton);

    if (this.model.user_artworks) {
      this.model.user_artworks.each(function (artwork) {
        this.addMediumArtwork(artwork);
      }.bind(this));
    };

    return this;
  },

});
