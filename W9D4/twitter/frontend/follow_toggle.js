const APIUtil = require('./api_util.js');

class FollowToggle {
  constructor (el) {
    this.$el = $(el);
    
    this.userId = this.$el.data("user-id");
    this.followState = this.$el.data("follow-state");    
    this.render();
    this.handleClick();
  }
  render() {
    if (this.followState === "unfollowing") {
      this.$el.prop("disabled", true);
      this.$el.html("Unfollowing...");
      this.$el.data("follow-state", "unfollowing");
    }

    else if (this.followState === "following") {
      this.$el.prop("disabled", true);
      this.$el.html("Following...");
      this.$el.data("follow-state", "following");
    }
    
    else if (this.followState === "unfollowed") {
      this.$el.prop("disabled", false);
      this.$el.html("Follow!");
      this.$el.data("follow-state", "unfollowed");
    }
    else {
      this.$el.prop("disabled", false);
      this.$el.html("Unfollow!");
      this.$el.data("follow-state", "followed");
    }
  }
  handleClick() {
    const that = this;
    this.$el.on('click', e => {
    e.preventDefault();
    if (this.followState === "unfollowed") {
      this.followState = "following";
      that.render();
      APIUtil.followUser(this.userId)
      .then(res => {
        that.followState = "followed";
        that.render();
      });
    }
    else  {
      this.followState = "unfollowing";
      that.render();
      APIUtil.unfollowUser(this.userId)
        .then(res => {
          that.followState = "unfollowed";
          that.render();
          
        });
    }
    });
  }
}

module.exports = FollowToggle;