class View {
  constructor(game, $el) {
    this.game = game;
    this.el = $el;
    this.setupTowers();
  }

  setupTowers() {
    const $list = $("<ul><li class='disk-1'></li><li class='disk-2'></li><li class='disk-3'></li></ul>");
    $(".hanoi").append($list);

    for (let i=0; i<2; i++) {
      const $list = $("<ul><li></li><li></li><li></li></ul>");
      $(".hanoi").append($list);
    }
    
  }

  render() {

  }
}

module.exports = View;