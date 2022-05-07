// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "channels"

document.addEventListener('turbo:load', () =>{
    let select_status = document.getElementById("book-status-select");
    let pages_input_div = document.getElementById("book-status-pages");
    
    select_status?.addEventListener('change', () => {
        if (select_status.value === "2") {
            pages_input_div.style.display = "block";
        } else {
            pages_input_div.style.display = "none";
        }
    });

    let coverInput = document.getElementById("cover-input");
    let coverPreviewer = document.getElementById("cover-previewer");

    coverInput?.addEventListener('change', (e) => {
        var files = e.target.files;
        var image = files[0]
        var reader = new FileReader();
        reader.onload = function(file) {
          var img = new Image();
          console.log(file);
          img.src = file.target.result;
          img.style.height = "200px";
          coverPreviewer.innerHTML = "";
          coverPreviewer.appendChild(img);
        }
        reader.readAsDataURL(image);
        console.log(files);
      });
});