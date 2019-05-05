require "rails_helper"

RSpec.describe Api::V1::TrendingReposController, type: :controller do
  let!(:first_trending_repo) { Trending_repo.create(
    name: "Dog repo",
    description: "Awesome cat and dog skills",
    language: "Ruby",
    contributors: ['Julio', 'Jane', 'Marios']
  ) }
  let!(:second_trending_repo) { Trending_repo.create(
    name: "Miaou repo",
    description: "Awesome flying eagles skills",
    language: "Rails",
    contributors: ['Miriam', 'Annette', 'Lovely']
  ) }

  describe "GET#index" do
    it "should return a list of this week's trending repositories on github" do

      get :index
      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")
      expect(returned_json.length).to eq 2

      expect(returned_json[0]["name"]).to eq "Dog repo"
      expect(returned_json[0]["description"]).to eq "Awesome cat and dog skills"
      expect(returned_json[0]["language"]).to eq "Ruby"
      expect(returned_json[0]["contributors"]).to be_kind_of(Array)
      expect(returned_json[0]["contributors"]).to eq ['Julio', 'Jane', 'Marios']

      expect(returned_json[1]["name"]).to eq "Miaou repo"
      expect(returned_json[1]["description"]).to eq "Awesome flying eagles skills"
      expect(returned_json[1]["language"]).to eq "Rails"
      expect(returned_json[1]["contributors"]).to be_kind_of(Array)
      expect(returned_json[1]["contributors"]).to eq ['Miriam', 'Annette', 'Lovely']
    end
  end
end
