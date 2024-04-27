document.addEventListener('DOMContentLoaded', function() {
  document.body.addEventListener('click', function(event) {
    // クリックされた要素が.closeボタンかどうかをチェック
    if (event.target.matches('.atoms-flash_message .close')) {
      // クリックされたボタンの親要素である.atoms-flash_message要素を取得
      const flashMessage = event.target.closest('.atoms-flash_message');

      // 親要素がある場合、それに css を付与して非表示になったら削除
      if (flashMessage) {
        flashMessage.classList.add('fadeout');
        flashMessage.addEventListener('animationend', function() {
          flashMessage.remove();
        });
      }
    }
  });
});
