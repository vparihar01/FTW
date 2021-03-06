class QuestLog
  constructor: ->
    @el = $(".quest_log")
    that = @
    @el.find('.btn').click(
      -> that.buttonPressed($(@).parents("li"))
    )
    @el.mouseenter(
      => window.hub.questQuery()
    ).mouseleave(
      => window.hub.questQueryOut()
    )

  buttonPressed: (element) ->
      id = element.data('id')
      action = element.data('action')
      url = element.data('url')

      if action == "start"
        window.hub.questStart()
      else
        window.hub.questEnd()

      if action == "start"
        element.find(".btn").removeClass("btn-warning").addClass("btn-success").text("Done")
        element.data("action", "end")
        element.data("url", url.replace("start","finish"))
      else
        element.fadeOut()

      $.getJSON(url, quest_id: id , (data) =>

        if data.level
          window.characterView.updateUser(data.exp_percent, data.level)
      )





$().ready( =>
    window.questLog= new QuestLog()
)
