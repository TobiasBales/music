// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"
import "trix"
import "@rails/actiontext"
import { formatDistanceToNow } from "date-fns";

document.addEventListener('turbo:load', function() {
  const elements = document.querySelectorAll('abbr.timeago');
  elements.forEach((element) => {

    const localDate = new Date(element.title);
    const date = new Date(localDate.getTime() + localDate.getTimezoneOffset() * 60000);
    element.innerText = formatDistanceToNow(date);
  });
})
