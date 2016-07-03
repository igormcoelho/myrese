class MainpageController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def index
    @gfiles       = Gfile.joins(:infohash_users).joins(:infohash).where("infohash_users.user_id = ?", current_user.id).or(
                    Gfile.joins(:infohash_users).joins(:infohash).where("infohashes.user_id = ?", current_user.id)
    ).uniq
    
    @publications  = Publication.joins(:infohash_users).joins(:infohash).where("infohash_users.user_id = ?", current_user.id)
    @publications += Publication.joins(:infohash).where("infohashes.user_id = ?", current_user.id)
    @publications.uniq!
    
    @projects  = Project.joins(:infohash_users).joins(:infohash).where("infohash_users.user_id = ?", current_user.id)
    @projects += Project.joins(:infohash).where("infohashes.user_id = ?", current_user.id)
    @projects.uniq!
    
  end
  
end
