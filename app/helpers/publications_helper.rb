module PublicationsHelper

  def plain_pub(pub)
    if pub.ptype.name == "article"
      return plain_article(pub)
    elsif pub.ptype.name == "chapter"
      return plain_chapter(pub)
  # elsif book ...
    else
      return "No plain text for this type of publication =("
    end
  end
  
  def plain_authors(pub)
    ret = ""
    pub.authors.each_with_index do |a, index|
      ret += a.citation
      if index == pub.authors.size - 1
        ret += " "
      else
        ret += "; "
      end
    end
    return ret
  end

  def plain_article(pub)
    ret = plain_authors(pub)
    ret += pub.title + ". "
    ret += pub.ctitle + ", "
    if !pub.volume.blank?
      ret += "v. " + pub.volume.to_s + ", "
    end
    if (!pub.page_begin.blank?) && (!pub.page_end.blank?)
      ret += "p. " + pub.page_begin.to_s + "-" + pub.page_end.to_s + ", "
    end
    ret += pub.year.to_s + "."
    return ret
  end
  
  def plain_chapter(pub)
    ret = plain_authors(pub)
    ret += pub.title + ". "
    ret += pub.ctitle + ", "
    if !pub.volume.blank?
      ret += "v. " + pub.volume.to_s + ", "
    end
    if (!pub.page_begin.blank?) && (!pub.page_end.blank?)
      ret += "p. " + pub.page_begin.to_s + "-" + pub.page_end.to_s + ", "
    end
    ret += pub.year.to_s + "."
    return ret
  end
  
  
  def bibtex_pub(pub)
    if pub.ptype.name == "article"
      return bibtex_article(pub)
    elsif pub.ptype.name == "chapter"
      return bibtex_chapter(pub)
  # elsif book ...
    else
      return "No bibtex for this type of publication =("
    end
  end

  def bibtex_authors(pub)
    ret = "authors={"
    pub.authors.each_with_index do |a, index|
      ret += a.citation
      if index == pub.authors.size - 1
        ret += " "
      else
        ret += " and "
      end
    end
    ret += "},\n"
    return ret
  end
  
  def bibtex_common_begin(pub)
    ret = "{ "+"xxx"+pub.year.to_s+",\n"
    ret += bibtex_authors(pub)
    ret += "title={ "+ pub.title + " },\n"
    return ret
  end
  
  def bibtex_common_end(pub)
    ret = ""
      if (!pub.page_begin.blank?) && (!pub.page_end.blank?)
      ret += "pages={ " + pub.page_begin.to_s + "--" + pub.page_end.to_s + " },\n"
    end
    if !pub.doi.blank?
      ret += "doi={ "+pub.doi.to_s + " }\n"
    end
    if !pub.url.blank?
      ret += "url={ "+pub.url.to_s + " }\n"
    end
    ret += "year={ "+pub.year.to_s + " }\n"
    ret += "}"
  end
  
  
  def bibtex_article(pub)
    ret  = "@article "
    ret += bibtex_common_begin(pub)
    ret += "journal={ "+pub.ctitle + " },\n"
    if !pub.volume.blank?
      ret += "volume={ " + pub.volume.to_s + " },\n"
    end
    if !pub.number.blank?
      ret += "number={ " + pub.number.to_s + " },\n"
    end
    if !pub.issn.blank?
      ret += "issn={ " + pub.issn + " },\n"
    end
    ret += bibtex_common_end(pub)
    return ret
  end

  def bibtex_chapter(pub)
    ret  = "@article "
    ret += bibtex_common_begin(pub)
    ret += "book={ "+pub.ctitle + " },\n"
    if !pub.volume.blank?
      ret += "volume={ " + pub.volume.to_s + " },\n"
    end
    if !pub.number.blank?
      ret += "number={ " + pub.number.to_s + " },\n"
    end
    if !pub.editor.blank?
      ret += "editor={ " + pub.editor + " },\n"
    end
    if !pub.isbn.blank?
      ret += "isbn={ " + pub.isbn + " },\n"
    end
    ret += bibtex_common_end(pub)
    return ret
  end
    
end
