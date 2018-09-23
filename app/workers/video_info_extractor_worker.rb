class VideoInfoExtractorWorker
  include Sidekiq::Worker

  def perform(id)
    campaign = Campaign.find id
    video = VideoInfo.new(campaign.video)
    campaign.update(video_id: video.video_id)
  end
end
