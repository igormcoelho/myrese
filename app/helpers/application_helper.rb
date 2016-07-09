module ApplicationHelper
    
    def avatar_url(user)
      gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
      "http://gravatar.com/avatar/#{gravatar_id}.png?s=48&d=mm"
    end
    
    def instanceName
      return "http://myrese.org"
    end
    
    def instanceUserPath(userref)
      return link_to(userref, instanceName+"/u/"+userref[1..-1])
    end

    def instanceItemPath(itemref)
      item = Infohash.where(:code => itemref[1..-1]).first
      title = item.gtitle
      return link_to(title, instanceName+"/h/"+itemref[1..-1])
    end
    
    def getGoodLinks(text)
      text2 = findReplaceUserRef(text)
      text3 = findReplaceItemRef(text2)
      return sanitize text3.html_safe, :tags => %w(a)
    end
    
    def verifyList(list, value)
      return list.include?value
    end
    
    def findReplaceUserRef(text)
      uall = User.all
      userlist = []
      uall.each do |u|
        userlist << "@"+u.username
      end
      return text.gsub(/[@][a-zA-Z][\w]+/) { |m| verifyList(userlist,m) ? instanceUserPath(m).html_safe : m } 
    end
    
    def findReplaceItemRef(text)
      uall = Infohash.all
      ilist = []
      uall.each do |u|
        ilist << ":"+u.code
      end
      return text.gsub(/[:][a-zA-Z][\w]+/) { |m| verifyList(ilist,m) ? instanceItemPath(m).html_safe : m } 
    end
    
end
