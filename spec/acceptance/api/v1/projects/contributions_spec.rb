require 'spec_helper'
require 'rspec_api_documentation/dsl'

resource 'Contributions' do
  parameter :user_email, required: true
  parameter :user_token, required: true
  parameter :id, required: true

  describe "Get contributions from project" do
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
      create(:contribution, project: project, user: user)
    end

    get '/api/v1/projects/:id/contributions' do
      example_request "return one project" do
        expect(response_body).to have_json_path("contributions/0/id")

        expect(status).to eq(200)
      end
    end
  end
end



