# rails console
# load 'db/qualis_seeds.rb'

cc = QualisArea.create    :name => "Ciência da Computação"
e1 = QualisArea.create    :name => "Engenharias I"
e2 = QualisArea.create    :name => "Engenharias II"
e3 = QualisArea.create    :name => "Engenharias III"
e4 = QualisArea.create    :name => "Engenharias IV"
ii = QualisArea.create    :name => "Interdisciplinar"

ejor = QualisJournal.create :journal => "European Journal of Operational Research (EJOR)", :issn => "0377-2217"
rene = QualisJournal.create :journal => "Renewable Energy"                               , :issn => "0960-1481"

QualisClassification.create :classification => "A1", :qualis_area => cc, :qualis_journal => ejor
QualisClassification.create :classification => "B1", :qualis_area => e2, :qualis_journal => ejor
QualisClassification.create :classification => "B1", :qualis_area => e2, :qualis_journal => ejor
QualisClassification.create :classification => "A1", :qualis_area => e3, :qualis_journal => ejor
QualisClassification.create :classification => "B1", :qualis_area => e4, :qualis_journal => ejor
QualisClassification.create :classification => "A1", :qualis_area => ii, :qualis_journal => ejor

QualisClassification.create :classification => "A1", :qualis_area => e1, :qualis_journal => rene
QualisClassification.create :classification => "A2", :qualis_area => e2, :qualis_journal => rene
QualisClassification.create :classification => "A2", :qualis_area => e3, :qualis_journal => rene
QualisClassification.create :classification => "A1", :qualis_area => e4, :qualis_journal => rene
QualisClassification.create :classification => "A1", :qualis_area => ii, :qualis_journal => rene




