module InfohashesHelper
    
  def get_link(item)
    if    item.htype_id == Publication::HTYPE
      return link_to item.htype.name+": "+item.gtitle, publication_path(item.publication)
    elsif item.htype_id == Gfile::HTYPE
      return link_to item.htype.name+": "+item.gtitle, gfile_path(item.gfile)
    elsif item.htype_id == Project::HTYPE
      return link_to item.htype.name+": "+item.gtitle, project_path(item.project)
    elsif item.htype_id == Post::HTYPE
      return link_to item.htype.name+": "+item.gtitle, post_path(item.post)
    elsif item.htype_id == Reminder::HTYPE
      return link_to item.htype.name+": "+item.gtitle, reminder_path(item.reminder)
    elsif item.htype_id == Weblink::HTYPE
      return link_to item.htype.name+": "+item.gtitle, weblink_path(item.weblink)
    elsif item.htype_id == Folder::HTYPE
      return link_to item.htype.name+": "+item.gtitle, folder_path(item.folder)
    else
      return "UNKOWN_HTYPE::"+item.htype.name+": "+item.gtitle
    end
  end
  
  def get_item_path(item)
    if    item.htype_id == Publication::HTYPE
      return publication_path(item.publication)
    elsif item.htype_id == Gfile::HTYPE
      return gfile_path(item.gfile)
    elsif item.htype_id == Project::HTYPE
      return project_path(item.project)
    elsif item.htype_id == Post::HTYPE
      return post_path(item.post)
    elsif item.htype_id == Reminder::HTYPE
      return reminder_path(item.reminder)
    elsif item.htype_id == Weblink::HTYPE
      return weblink_path(item.weblink)
    elsif item.htype_id == Folder::HTYPE
      return folder_path(item.folder)
    else
      return ""
    end
  end
  
end
