class Publication < ActiveRecord::Base
  HTYPE = 1
  def getHTYPE
    return HTYPE
  end
  
  belongs_to :infohash   , autosave: true
  
  delegate :user         , to: :infohash # belongs_to through (doesn't exist!)
  delegate :members      , to: :infohash
  has_many :infohash_users  , through: :infohash
  
  delegate :gtitle       , to: :infohash
  delegate :gdescription , to: :infohash
  delegate :visibility   , to: :infohash
  delegate :visibility_id, to: :infohash
  
  has_many :publication_profiles                   , dependent: :destroy
  has_many :authors, through: :publication_profiles, source: :profile
  
  #attr_reader(:mainauthor)
  #validates_presence_of :mainauthor, message: "At least one author must be provided"
  #def mainauthor
  #  self.authors.first
  #end
  
  belongs_to :pubtype
  #has_many :pauthors
  #has_many :pkeywords
  
  #validates_presence_of :gtitle        , message: "General title is missing"
  #validates_presence_of :gdescription  , message: "General description is missing"
  #validates_presence_of :visibility    , message: "Visibility is missing"
  
  validates_associated  :infohash      , message: "Failed to validate general information"
  
  validates_presence_of :infohash      , message: "Infohash reference is missing"
  validates_presence_of :pubtype       , message: "Publication type is missing"
  validates_presence_of :title         , message: "Publication title is missing"
  validates_presence_of :year          , message: "Publication year is missing"
  
  validate :ctitle_for_collections

  def ctitle_for_collections # journal, book, proceedings, chapter, inproceedings
    if ctitle.blank? && (pubtype.id >= 1) &&  (pubtype.id <= 5) 
      errors.add(:ctitle, 'Journal/Book/Collection title is missing')
    end
  end
  
  def format_as_article
    ret = ""
    authors.each_with_index do |a, index|
      ret += a.citation
      if index == authors.size - 1
        ret += " "
      else
        ret += "; "
      end
    end
    ret += title + ". "
    ret += ctitle + ", "
    if !volume.blank?
      ret += "v. " + volume.to_s + ", "
    end
    if (!page_begin.blank?) && (!page_end.blank?)
      ret += "p. " + page_begin.to_s + "-" + page_end.to_s + ", "
    end
    ret += year.to_s + "."
    return ret
  end
  
      #t.string :ctitle      #collection title {journal name, book title when chapters, conference proceedings}
      #t.string :editor
      #t.string :publisher
      #t.string :organization
      #t.string :address
      #t.string :month
      #t.integer :volume
      validates_numericality_of :volume      , :allow_blank => true
      #t.integer :number
      validates_numericality_of :number      , :allow_blank => true
      #t.string :series
      #t.integer :page_begin
      validates_numericality_of :page_begin  , :allow_blank => true
      validates_numericality_of :page_end    , :allow_blank => true
      #t.integer :page_end
      #t.string :howpublished
      #t.string :doi
      #t.string :keywords    # all keywords together
      #t.text :other
      #t.references :infohash, index: true, foreign_key: true
  

end
