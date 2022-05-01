// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener('turbo:load', () =>{
    let select_status = document.getElementById("book-status-select");
    let pages_input_div = document.getElementById("book-status-pages");
    
    try {
        select_status.onchange = () => {
            if (select_status.value === "2") {
                pages_input_div.style.display = "block";
            } else {
                pages_input_div.style.display = "none";
            }
        };

    } catch (e) {
        if (!e instanceof TypeError) {
            throw e;
        }
    }
});
