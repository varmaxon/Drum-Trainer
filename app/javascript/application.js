// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

// window.parent.soundClick()

// function soundClick() {
//   var audio = new Audio(); // Создаём новый элемент Audio
//   audio.src = 'click.mp3'; // Указываем путь к звуку "клика"
//   audio.autoplay = true; // Автоматически запускаем
// }

window.paintIt = function(event, backgroundColor, textColor) {
  event.preventDefault();
  event.target.style.backgroundColor = backgroundColor;
  if (textColor) {
    var audio = new Audio(); // Создаём новый элемент Audio
    audio.src = 'metr_1.mp3'; // Указываем путь к звуку "клика"
    audio.autoplay = true; // Автоматически запускаем
  }
  var audio = new Audio(); // Создаём новый элемент Audio
  audio.src = 'metr_1.mp3'; // Указываем путь к звуку "клика"
  audio.autoplay = true; // Автоматически запускаем
}


