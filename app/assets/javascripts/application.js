// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require active_storage_drag_and_drop
//= require turbolinks
//= require_tree .

const toggleNotification = (ev => {
    const notificationContainer = document.querySelector('.notifications')
    const note = document.querySelector('[note]');
    const note1 = document.querySelector('[note1]');
    if(notificationContainer != undefined){
      if(notificationContainer.style.display === 'none'){
        notificationContainer.style.display = 'block';
        document.querySelector("#down").style.display = 'none'
        document.querySelector("#up").style.display = 'inline-block'
        note1.style.display = 'none';
        note.style.display = 'none';
      }
      else{
        notificationContainer.style.display = 'none';
        document.querySelector("#down").style.display = 'inline-block'
        document.querySelector("#up").style.display = 'none'
      }
    }
  })
  