ArtStack.Views.ArtworkShow = Backbone.View.extend({

  template: JST['artworks/artwork_show'],

  stackTemplate: JST['stacks/_stack_button'],

  initialize: function () {
    this.listenToOnce(this.model, "sync", this.render);
  },

  events: {
    "click button": "toggleStack"
  },

  render: function () {
    var renderedContent = this.template({ artwork: this.model });
    var button = this.stackTemplate({ artwork: this.model });
    this.$el.html(renderedContent);
    this.$(".art-image").append(button);
    return this;
  },

  toggleStack: function () {

    event.preventDefault();

    if (this.model.get('stacked')) {

      this.$("button").addClass("stacked-false");
      this.$("button").removeClass("stacked-true");
      this.model.set({ stacked: false });

      $.ajax({
        type: "PATCH",
        url: "/api/artworks/" + this.model.id,
        data: {
          stack: false
        }
      });

    } else {

      this.$("button").addClass("stacked-true");
      this.$("button").removeClass("stacked-false");
      this.model.set({ stacked: true });

      $.ajax({
        type: "PATCH",
        url: "/api/artworks/" + this.model.id,
        data: {
          stack: true
        }
      });
    }
  },

});
