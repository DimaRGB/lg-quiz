// Generated by CoffeeScript 1.6.3
define({
  renderQuestions: function(data) {
    'use strict';
    var $question, $quiz, question, _i, _len, _ref;
    $quiz = $('.quiz .questions');
    $question = $('<div class="question"><li></li></div>');
    _ref = data.questions;
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      question = _ref[_i];
      $question.clone().find('li').html(question).end().appendTo($quiz);
    }
    return this;
  },
  run: function() {
    'use strict';
    return this;
  }
});
