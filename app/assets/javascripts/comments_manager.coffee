class CommentsManager
  ui:
    commentEditForm: "[data-behavior='comment-update']"
    editLink: "[data-behavior='comment-edit']"
    cancelLink: "[data-behavior='cancel-link']"

  constructor: ->
    @_bindEvents()

  _bindEvents: =>
    $(document).on "click", @ui.editLink, @_showEditForm
    $(document).on "click", @ui.cancelLink, @_hideEditForm

  _showEditForm: (event) =>
    @_сurrentElement(event, @ui.commentEditForm).show()
    $(event.currentTarget).hide()

  _hideEditForm: (event) =>
    @_сurrentElement(event, @ui.commentEditForm).hide()
    @_сurrentElement(event, @ui.editLink).show()

  _сurrentElement: (event, target) ->
    comment_id = $(event.currentTarget).data("id")
    $("#{target}[data-id='#{comment_id}']")

if $("[data-behavior='comments']").length
  new CommentsManager
