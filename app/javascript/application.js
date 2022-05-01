// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

let select_status = document.getElementById("book-status-select");
let pages_input_div = document.getElementById("book-status-pages");

// if (select_status?.value === 2) {
//     pages_input_div.style.display = "block";
// } else {
//     pages_input_div.style.display = "none";
// }

select_status.onchange = () => {
    if (select_status.value === "2") {
        pages_input_div.style.display = "block";
    } else {
        pages_input_div.style.display = "none";
    }
};