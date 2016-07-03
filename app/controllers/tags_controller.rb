class TagsController < ApplicationController

  # GET /tags
  # GET /tags.json
  def index
    @tags  = Tag.joins(:infohash_users).joins(:infohash).where("infohash_users.user_id = ?", current_user.id)
    @tags += Tag.joins(:infohash).where("infohashes.user_id = ?", current_user.id)
    @tags += Tag.where(:user_id => current_user.id)
    @tags.uniq!
    taglist = []
    @tags.each do |tag|
      taglist << tag.tagname
    end
    @infohashes = Infohash.joins(:tags).where(:tagname => taglist)
  end

  private
  
end
