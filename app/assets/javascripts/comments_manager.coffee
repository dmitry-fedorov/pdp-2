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
    comment_id = $(event.currentTarget).data("id")
    $("#{@ui.commentWrapper}[data-id='#{comment_id}']").remove()

  _addComment: (event, data, status, xhr) =>
    $(@ui.comments).append xhr.responseText
    $(@ui.commentForm).find("#comment_text").val('')

  _showEditForm: (event) =>
    comment_id = $(event.currentTarget).data("id")
    $("#{@ui.commentEditForm}[data-id='#{comment_id}']").show()
    $(event.currentTarget).hide()

  _hideEditForm: (event) =>
    comment_id = $(event.currentTarget).data("id")
    $("#{@ui.commentEditForm}[data-id='#{comment_id}']").hide()
    $("#{@ui.editLink}[data-id='#{comment_id}']").show()

  _updateComment: (event, data, status, xhr) =>
    @_hideEditForm(event)
    comment_id = $(event.currentTarget).data("id")
    $("#{@ui.commentWrapper}[data-id='#{comment_id}']").find("p").html(JSON.parse(xhr.responseText).text)

if $("[data-behavior='comments']").length
  new CommentsManager
