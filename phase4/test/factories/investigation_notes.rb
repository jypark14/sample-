FactoryBot.define do
  factory :investigation_note do
    investigation nil
    officer nil
    content "MyText"
    date "2018-11-05"
  end
end
