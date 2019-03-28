

function UsersSearch (el) {
  
  this.$el = $(el);
  this.$input = this.$el.find('input[name=username]');
  this.$ul = this.$el.find('.users');

}

function handleInput () {
  $(".users-search").on("input", function (e) {
    e.preventDefault();
    searchUsers(this.$input);
  })  
}

function searchUsers(queryVal) {
  
  $(".users-search").on("input", function(e) {
    e.preventDefault();
    
    $.ajax({
      method: "GET",
      data: queryVal,
      url: `/users/search`,
      dataType: 'json',
      success: () => {
        
      }
    });
  });
}