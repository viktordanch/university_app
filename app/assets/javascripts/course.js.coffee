# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->

	# loads chosen for searchable selection of courses
	$('#enrollment_course_id').chosen({ width: "75%" })

	# changes slider's score value as you move the slider
	$('[data-slider]').bind 'slider:changed', (event, data) ->
		$(this).parent('form').find('#score-display').text(data.value)
		return

	# load best in place for in-place editing of fields
	$('.best_in_place').best_in_place()

	return
