require 'spec_helper'
require 'rspec_api_documentation/dsl'

resource 'Rewards' do
  parameter :user_email, required: true
  parameter :user_token, required: true
  parameter :id, required: true

  describe "Get rewards from project" do
    let(:user) do
      _u = create(:user)
      _u.reload
      _u
    end

    let(:user_email) { user.email }
    let(:user_token) { user.authentication_token }
    let(:project) { create(:project, user: user) }
    let(:id) { project.id }

    before do
      create(:reward, project: project)
    end

    get '/api/v1/projects/:id/rewards' do
      example_request "return one project" do
        expect(response_body).to have_json_path("rewards/0/id")
        expect(response_body).to have_json_path("rewards/0/minimum_value")
        expect(response_body).to have_json_path("rewards/0/description")
        expect(response_body).to have_json_path("rewards/0/maximum_contributions")
        expect(response_body).to have_json_path("rewards/0/deliver_estimate")
        expect(response_body).to have_json_path("rewards/0/sold_out")
        expect(response_body).to have_json_path("rewards/0/remaining")

        expect(status).to eq(200)
      end
    end
  end
end


