json.array!(@qualis_evaluate_journals) do |qualis_evaluate_journal|
  json.extract! qualis_evaluate_journal, :id, :profile_id, :year_begin, :year_end, :evaluation_id, :target_qualis
  json.url qualis_evaluate_journal_url(qualis_evaluate_journal, format: :json)
end
