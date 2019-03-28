
const FollowToggle = require('./follow_toggle.js');


$(function () {
  $('.follow-toggle').each(function(i, button) {
    new FollowToggle(button); 
  });

  $('.users-search').each(function(i, search) {
    new UsersSearch(search);
  })
  
});