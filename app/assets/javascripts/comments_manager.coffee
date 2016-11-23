class CommentsManager
  ui:
    commentForm: "[data-behavior='comment-form']"
    destroyLink: "[data-behavior='comment-destroy']"
    comments: "[data-behavior='comments']"
    commentWrapper: "[data-behavior='comment-wrapper']"

  constructor: ->
    @_bindEvents()

  _bindEvents: =>
    $(document).on "ajax:success", @ui.destroyLink, @_destroyComment
    $(document).on "ajax:success", @ui.commentForm, @_addComment

  _destroyComment: (event) =>
    comment_id = $(event.currentTarget).data("id")
    $("#{@ui.commentWrapper}[data-id='#{comment_id}']").remove()

  _addComment: (event, data, status, xhr) =>
    $(@ui.comments).append xhr.responseText
    $(@ui.commentForm).find("#comment_text").val('')

if $("[data-behavior='comments']").length
  new CommentsManager
