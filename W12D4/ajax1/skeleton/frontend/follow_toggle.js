
function FollowToggle(el) {
  this.$el = $(el);
  this.userId = this.$el.data("user-id");
  this.followState = this.$el.data("initial-follow-state");
  // console.log('Its OVER 9000!!!!!')
  this.render();
  this.handleClick();
}

FollowToggle.prototype.render = function () {
  if (this.followState === "unfollowed") {
    // debugger;
    this.$el.html('Peanut Butta!');
    } else {
    this.$el.html('Unfollow'); 
  }
};

FollowToggle.prototype.handleClick = function() {

  let that = this;

  $(".follow-toggle").on("click", function(e) {
    e.preventDefault();
    
    if ( that.followState === 'unfollowed' ) {
  
      $.ajax({
        method: "POST",
        url: `/users/${that.userId}/follow`,
        dataType: 'json',
        success: () => {
          that.followState = "followed";
          that.render();
        }
      });

    } else {

      $.ajax({
        method: "DELETE",
        url: `/users/${that.userId}/follow`,
        dataType: 'json',
        success: () => {
          that.followState = "unfollowed";
          that.render();
        }
      });
    }
  });
};

module.exports = FollowToggle;
window.FollowToggle = FollowToggle;