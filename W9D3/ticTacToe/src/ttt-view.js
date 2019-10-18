class View {
  constructor(game, $el) {
    this.game = game;
    this.el = $el;
    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
    const $liItems = $(".tile");
    let that = this;

    $liItems.on("click", function(e) {      
      //$(e.target).attr('style', 'background-color: white');
      $(e.target).addClass("selected");
      console.log($(e.target).css);
      that.makeMove($(e.target));
    });
  }

  makeMove($square) {
    let dataPos = $square.attr('data-pos');
    let pos = dataPos.split(',').map(el => +el);
    this.game.playMove(pos);
    $square.text(this.game.currentPlayer);
    if (this.game.board.isOver()) {
      
      const $figcaption = $("<figcaption></figcaption>"); 
      let winner = this.game.winner().winner;       
      if (winner) {
        $figcaption.text(`You win, ${winner}!`);
      } else {
        $figcaption.text(`It's a draw!`);
      }
      $(".ttt").after($figcaption);

      this.colorWinner();
      
    }
  }

  colorWinner() {
    let positions = this.game.winner().positions;
    // console.log(positions);
    positions.forEach( el => {
      $(`[data-pos='${el.toString()}']`)
        .attr('style', 'background-color: green; color: white');
      console.log(el);
      
    });
  }

  setupBoard() {
    let $ul = $("<ul></ul>");
    
    $ul.appendTo(this.el);
    $ul.addClass('grid');

    let count = -1, x = 0;
    for (let i = 0; i < 9; i++) {
      let $li = $('<li></li>');
      $li.appendTo($ul);
      $li.addClass('tile');
      count++;
      if(count === 3) {
        x++;
        count = 0;
      }
      let y = i % 3;
      $li.attr("data-pos", [x,y]);
      //$li.text(`${x},${y}`);
      
    }
  }
}

module.exports = View;
