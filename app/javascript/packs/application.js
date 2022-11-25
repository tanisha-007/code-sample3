// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.


import '../../../node_modules/chart.js/dist/chart.js';
import '../../../node_modules/bootstrap/dist/js/bootstrap.js';

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require('datatables.net-bs4')
require("@popperjs/core")
require("bootstrap")

import JQuery from 'jquery';
window.$ = window.JQuery = JQuery;

$(document).ready(function() {
  $('table').DataTable();
});