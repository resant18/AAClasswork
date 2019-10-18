const Game = require('./game.js');
const View = require('./hanoiView.js');

$(() => {
  const rootEl = $('.hanoi');
  const game = new Game();
  const view = new View(game, rootEl);
});