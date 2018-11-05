module Contexts
  module Officers
    def create_officers
      @jblake   = FactoryBot.create(:officer, unit: @major_crimes)
      @jgordon  = FactoryBot.create(:officer, first_name: "Jim", last_name: "Gordon", rank: "Commissioner", unit: @headquarters, ssn: "064-23-0511")
      @gloeb    = FactoryBot.create(:officer, first_name: "Gillian", last_name: "Loeb", rank: "Commissioner", unit: @headquarters, active: false)
      @msawyer  = FactoryBot.create(:officer, first_name: "Maggie", last_name: "Sawyer", rank: "Captain", unit: @major_crimes)
      @jazeveda = FactoryBot.create(:officer, first_name: "Josh", last_name: "Azeveda", rank: "Detective", unit: @major_crimes)
    end
    
    def destroy_officers
      @jblake.delete
      @jgordon.delete
      @gloeb.delete
      @msawyer.delete
      @jazeveda.delete
    end
  end
end