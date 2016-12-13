class CommentsManager
  ui:
    commentForm: "[data-behavior='comment-form']"
    destroyLink: "[data-behavior='comment-destroy']"
    comments: "[data-behavior='comments']"
    commentWrapper: "[data-behavior='comment-wrapper']"
    commentEditForm: "[data-behavior='comment-update']"
    editLink: "[data-behavior='comment-edit']"
    cancelLink: "[data-behavior='cancel-link']"

  constructor: ->
    @_bindEvents()

  _bindEvents: =>
    $(document).on "ajax:success", @ui.destroyLink, @_destroyComment
    $(document).on "ajax:success", @ui.commentForm, @_addComment
    $(document).on "ajax:success", @ui.commentEditForm, @_updateComment
    $(document).on "click", @ui.editLink, @_showEditForm
    $(document).on "click", @ui.cancelLink, @_hideEditForm

  _destroyComment: (event) =>
    @_setCurrentElement(event, @ui.commentWrapper).remove()

  _addComment: (event, data, status, xhr) =>
    $(@ui.comments).prepend xhr.responseText
    $(@ui.commentForm).find("#comment_text").val('')

  _showEditForm: (event) =>
    @_setCurrentElement(event, @ui.commentEditForm).show()
    $(event.currentTarget).hide()

  _hideEditForm: (event) =>
    @_setCurrentElement(event, @ui.commentEditForm).hide()
    @_setCurrentElement(event, @ui.editLink).show()

  _updateComment: (event, data, status, xhr) =>
    @_hideEditForm(event)
    @_setCurrentElement(event, @ui.commentWrapper).find("p").html(data.text)

  _setCurrentElement: (event, target) ->
    comment_id = $(event.currentTarget).data("id")
    $("#{target}[data-id='#{comment_id}']")

if $("[data-behavior='comments']").length
  new CommentsManager
