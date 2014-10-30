ArtStack.Models.User = Backbone.Model.extend({
  urlRoot: '/api/users',

  parse: function (json) {
    if (json.user_profile) {
      this.user_profile = new ArtStack.Models.UserProfile(json.user_profile, {parse: true});
      delete json.user_profile;
    }

    return json;
  },

});