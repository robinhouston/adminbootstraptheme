jQuery ->
    $('.locales a:first').tab('show')
    $('.accordion-body').on('hidden', ->
        $(@).prev().find('i').first().removeClass().addClass('icon-chevron-right')
        )
    $('.accordion-body').on('shown', ->
        $(@).prev().find('i').first().removeClass().addClass('icon-chevron-down'))
    $('.toggle-hidden').live('click', ->
        $(@).parents('td').find('div:hidden').show()
        false)
    $('#request_hidden_user_explanation_reasons input').live('click', ->
        $('#request_hidden_user_subject, #request_hidden_user_explanation').show()
        info_request_id = $('#hide_request_form').attr('info_request_id')
        reason = $(this).val()
        $('#request_hidden_user_explanation_field').attr("value", "[loading default text...]")
        $.ajax "<%= MySociety::Config.get 'ADMIN_PUBLIC_URL' %>/hidden_user_explanation?reason=" + reason + "&info_request_id=" + info_request_id,
          type: "GET"
          dataType: "text"
          error: (data, textStatus, jqXHR) ->
            $('#request_hidden_user_explanation_field').attr("value", "Error: #{textStatus}")
          success: (data, textStatus, jqXHR) ->
            $('#request_hidden_user_explanation_field').attr("value", data)
      )

