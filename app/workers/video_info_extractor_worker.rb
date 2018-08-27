class VideoInfoExtractorWorker
  include Sidekiq::Worker

  def perform(id)
    campaign = Campaign.find_by_id id
    video = VideoInfo.new(campaign.video)
    campaign.update(video_id: video.video_id)
  end
end
