import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

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