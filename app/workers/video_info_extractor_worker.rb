# frozen_string_literal: true

class VideoInfoExtractorWorker
  include Sidekiq::Worker

  def perform(id)
    campaign = Campaign.find id
    unless campaign.video.blank?
      video = VideoInfo.new(campaign.video)
      campaign.update(video_id: video.video_id)
    end
  end
end
