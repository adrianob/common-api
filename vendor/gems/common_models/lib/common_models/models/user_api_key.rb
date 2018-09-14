# coding: utf-8
module CommonModels
  class UserApiKey < ActiveRecord::Base
    self.table_name = 'community_service.user_api_keys'
    belongs_to :platform
    belongs_to :user

    validates :platform_id, :user_id, :token, presence: true

    scope :enabled, -> { where(disabled_at: nil) }

    def self.gen_random_key
      "user_api_key_#{SecureRandom.hex(50)}"
    end
  end
end
