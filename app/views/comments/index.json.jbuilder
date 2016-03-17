json.array!(@comments) do |comment|
  json.extract! comment, :id, :story, :user_id, :commentable, :commentable_type
  json.url comment_url(comment, format: :json)
end
