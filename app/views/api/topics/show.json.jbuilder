json.partialStories @stories do |story|
  json.id story.id
  json.author do
    json.id story.author.id
    json.name story.author.name
    json.imageUrl asset_path(story.author.image.url(:original))
  end
  json.title story.title
  json.splice story.splice
  json.date story.created_at.strftime("%b %d")
  json.response_count story.responses.count

end

json.topic do
  json.id @topic.id
  json.title @topic.title
end
