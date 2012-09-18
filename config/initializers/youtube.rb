require 'youtube_it'
@client ||= YouTubeIt::Client.new(:dev_key => "AI39si48veFGm5Z9I60P9ShD8EQh9VI7m5ba_DDYPzHUiTp9kEgHENcvEbxGTsnGkg-3PD9VI5yfaDFJT0EsuwnyCYuhaFFNKQ")

# client.videos_by(query: "Finding Nemo 3D", max_results: 1, most_popular: true) !!