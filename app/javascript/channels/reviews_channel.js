import consumer from "channels/consumer"

document.addEventListener('turbo:load', () =>{

  const contentInput = document.getElementById("content-input");
  const rateInput = document.getElementById("rate-input");

  let reviews = document.getElementsByClassName("reviews")[0];
  let reviewForm = document.getElementById("review-form");

  let book_id = reviews?.getAttribute("data-book-id");
  let user_id = reviews?.getAttribute("data-user-id");
  

  let subscription = consumer.subscriptions.create({channel: "ReviewsChannel", book_id: book_id, user_id: user_id}, {
    connected() {
      // Called when the subscription is ready for use on the server
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      // Called when there's incoming data on the websocket for this channel
      console.log(data.data)
      reviews.innerHTML = data.data + reviews.innerHTML;
      contentInput.value = ''
      rateInput.value = '0.0'
    },

    post: function(data) {
      return this.perform('post', data);
    }
  });

  reviewForm?.addEventListener('submit', (e) => {
    e.preventDefault();
    contentInput.parentElement.classList.remove("field_with_errors");
    if (!contentInput.value) {
      let parent = contentInput.parentNode;
      let wrapper = document.createElement('div');

      wrapper.classList.add("field_with_errors");

      parent.replaceChild(wrapper, contentInput);

      wrapper.appendChild(contentInput);
      contentInput.focus();
      return;
    }
    subscription.post({
      content: contentInput.value,
      rate: rateInput.value
    });
  });

});