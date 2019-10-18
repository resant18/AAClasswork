const APIUtil = require('./api_util.js');

class UserSearch {
  constructor(el) {
    this.$el = $(el);
    this.$input = $($(el).find("input"));
    this.$ul = $($(el).find("ul"));
    this.handleInput();
  }

  handleInput() {    
    const that = this;

    this.$input.on('keyup', e => {
      e.preventDefault();
      APIUtil.searchUsers(that.$input.val())
        .then( res => that.renderResults(res) );
    });

  }

  renderResults(users) {
    const that = this;
    this.$ul.empty();

    //we have two pass 2 params here, with index being the first params
    $(users).each( (index, user) => {
      console.log(user);
      const li = `<li><a href="/users/${user.id}">${user.username}</a></li>`;
      that.$ul.append(li);
    });
  }
}

module.exports = UserSearch;