# rails console
# load 'db/qualis_seeds.rb'

QualisArea.create     :name => "Ciência da Computação"
cc = QualisArea.where(:name => "Ciência da Computação").first
QualisArea.create     :name => "Engenharias I"
e1 = QualisArea.where(:name => "Engenharias I").first
QualisArea.create     :name => "Engenharias II"
e2 = QualisArea.where(:name => "Engenharias II").first
QualisArea.create     :name => "Engenharias III"
e3 = QualisArea.where(:name => "Engenharias III").first
QualisArea.create     :name => "Engenharias IV"
e4 = QualisArea.where(:name => "Engenharias IV").first
QualisArea.create     :name => "Interdisciplinar"
ii = QualisArea.where(:name => "Interdisciplinar").first
QualisArea.create    :name => "ADMINISTRAÇÃO, CIÊNCIAS CONTÁBEIS E TURISMO"
ad = QualisArea.where(:name => "ADMINISTRAÇÃO, CIÊNCIAS CONTÁBEIS E TURISMO").first

QualisJournal.create :journal => "European Journal of Operational Research (EJOR)", :issn => "0377-2217"
ejor = QualisJournal.where(:issn => "0377-2217").first
QualisJournal.create :journal => "Renewable Energy"                               , :issn => "0960-1481"
rene = QualisJournal.where(:issn => "0960-1481").first
QualisJournal.create :journal => "Electronic Notes in Discrete Mathematics"       , :issn => "1571-0653"
endm = QualisJournal.where(:issn => "1571-0653").first
QualisJournal.create :journal => "Applied Energy"                                 , :issn => "0306-2619"
apen = QualisJournal.where(:issn => "0306-2619").first
QualisJournal.create :journal => "International Journal of Production Research"   , :issn => "0020-7543"
ijpr = QualisJournal.where(:issn => "0020-7543").first
QualisJournal.create :journal => "Evolutionary Computation                    "   , :issn => "1063-6560"
evco = QualisJournal.where(:issn => "1063-6560").first


QualisClassification.create :classification => "A1", :qualis_area => cc, :qualis_journal => ejor
QualisClassification.create :classification => "B1", :qualis_area => e2, :qualis_journal => ejor
QualisClassification.create :classification => "B1", :qualis_area => e2, :qualis_journal => ejor
QualisClassification.create :classification => "A1", :qualis_area => e3, :qualis_journal => ejor
QualisClassification.create :classification => "B1", :qualis_area => e4, :qualis_journal => ejor
QualisClassification.create :classification => "A1", :qualis_area => ii, :qualis_journal => ejor # ?

QualisClassification.create :classification => "A1", :qualis_area => e1, :qualis_journal => rene
QualisClassification.create :classification => "A2", :qualis_area => e2, :qualis_journal => rene
QualisClassification.create :classification => "A2", :qualis_area => e3, :qualis_journal => rene
QualisClassification.create :classification => "A1", :qualis_area => e4, :qualis_journal => rene
QualisClassification.create :classification => "A1", :qualis_area => ii, :qualis_journal => rene

QualisClassification.create :classification => "B1", :qualis_area => ad, :qualis_journal => endm
QualisClassification.create :classification => "B3", :qualis_area => cc, :qualis_journal => endm # qualis 2013 ?
QualisClassification.create :classification => "B2", :qualis_area => ii, :qualis_journal => endm # qualis 2013 ?
QualisClassification.create :classification => "B2", :qualis_area => e3, :qualis_journal => endm # qualis 2013 ?

QualisClassification.create :classification => "A2", :qualis_area => cc, :qualis_journal => ijpr
QualisClassification.create :classification => "A2", :qualis_area => e3, :qualis_journal => ijpr 
QualisClassification.create :classification => "A2", :qualis_area => ii, :qualis_journal => ijpr

QualisClassification.create :classification => "B1", :qualis_area => e4, :qualis_journal => evco 
QualisClassification.create :classification => "B1", :qualis_area => ii, :qualis_journal => evco

QualisClassification.create :classification => "A1", :qualis_area => e1, :qualis_journal => apen 
QualisClassification.create :classification => "A1", :qualis_area => e3, :qualis_journal => apen 
QualisClassification.create :classification => "A1", :qualis_area => ii, :qualis_journal => apen

