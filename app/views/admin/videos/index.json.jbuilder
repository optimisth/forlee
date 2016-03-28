json.array!(@videos) do |video|
  json.extract! video, :id, :post_id, :video_url
  json.url video_url(video, format: :json)
end
