$(document).ready(function() {
  getUploadForm();
  saveUpload();
  getRegistrationForm();
  saveUser();
});

function getUploadForm() {
  	$('#upload-form-div').on('click', '#get-upload-form-btn', function(event) {
	    event.preventDefault();

	    var $aTag = $(this)

	    var $ajax = $.ajax({
	      url: $aTag.attr('href'),
	    });

	    $ajax.done(function(response) {
	      $aTag.closest('#get-upload-form').hide();
	      $('#upload-form-div').append(response);
	    });
  	});
};

function saveUpload() {
	$('#upload-form-div').on('submit', '#upload-form', function(event) {
		event.preventDefault();

		var $form = $(this)

  	var $ajax = $.ajax({
    		url: $form.attr('action'),
    		method: $form.attr('method'),
    		data: $form.serialize()
  	});

  	$ajax.done(function(response) {
  		$form.remove();
    		$('#get-upload-form').show();
    		$('.upload').first().prepend(response);
  	});
	});
};

function getRegistrationForm() {
  $('#get-register-form').on('click', function(event) {
    event.preventDefault();

    var $aTag = $(this)

    var $ajax = $.ajax({
      url: $aTag.attr('href'),
    });

    $ajax.done(function(response) {
      $('#uploads').hide();
      $('#upload-form-div').hide();
      $('#registration-div').append(response);
    });

  });
};

function saveUser() {
  $('#registration-div').on('submit', '#registration-form', function(event) {
    event.preventDefault();

    var $form = $(this)

    var $ajax = $.ajax({
        url: $form.attr('action'),
        method: $form.attr('method'),
        data: $form.serialize()
    });

    $ajax.done(function(response) {
      $form.parent().remove();
      $('#uploads').show();
      $('#upload-form-div').show();
    });
  });
};