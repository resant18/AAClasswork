const FollowToggle = require('./follow_toggle.js');
const APIUtil = require('./api_util.js');
const UserSearch = require('./users_search.js');

const setEventHandlers = () => {
  $('button.follow-toggle').each(function(){
    new FollowToggle(this);  
  });

  $('nav.users-search').each(function() {
    new UserSearch(this);
  });

}; 

$(setEventHandlers);

