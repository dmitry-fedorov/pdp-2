class AssessmentManager
  ui:
    assessment: "[data-behavior='assessment']"

  constructor: ->
    @_showAssessment()

  _showAssessment: =>
    $(@ui.assessment).each ->
      $(this).raty
        cancel: true,
        path: "/assets/",
        click: (event, data) ->
          console.log(data.target.alt)
          console.log($(this).attr("data-article-id"))
          $.post("/assessments",
          { assessment: {
              article_id: $(this).attr("data-article-id")
              assessment: data.target.alt
            }
          })

if $("[data-behavior='articles']").length
  new AssessmentManager
