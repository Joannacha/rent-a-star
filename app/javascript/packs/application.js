// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import { initSweetalert } from 'plugins/init_sweetalert';
// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
import { calendar } from "../plugins/init_flatpickr";

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
<<<<<<< HEAD

  initSweetalert('#fake-delete', {
 title: "Are you sure?",
      text: "You will not be able to recover this imaginary file!",
      icon: "warning",
      buttons: [
        'No, cancel it!',
        'Yes, I am sure!'
      ],
      dangerMode: true,
}, (value) => {
  console.log(value);
  if (value === true ) {
    const link = document.querySelector('#btn_delete');
    link.click();
  } else {
    console.log(value);
  }
});

initSweetalert('#fake_add', {
  text: "Your star have been successfully created",
  icon: "success"
}, (value) => {
  if (value) {
    const link = document.querySelector('#add_star_btn');
    link.click();
  }
=======
  calendar();
>>>>>>> dffad9b63cce8b45c861b00d24255099a7610bf4
});

});


