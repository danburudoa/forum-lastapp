import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html =
     `<div class="comments_wrap">
        <p class="comment_info"> 
         <a comment_user>${data.user.nickname}</a>
         ${data.date}
        </p>
        <p class="comment_text">
         ${data.content.text} 
        </p>
      </div>`;
    const comments = document.getElementById('comments');
    const newComment = document.getElementById('comment_text');
    comments.insertAdjacentHTML('afterbegin', html);
    newComment.value = '';
  }
});
