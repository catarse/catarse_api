require 'spec_helper'
require 'rspec_api_documentation/dsl'

resource 'Projects' do
  parameter :user_email, required: true
  parameter :user_token, required: true
  parameter :id, required: true

  describe "Get info about one project" do
    let(:user) do
      _u = create(:user)
      _u.reload
      _u
    end

    let(:user_email) { user.email }
    let(:user_token) { user.authentication_token }
    let(:project) { create(:project, user: user) }
    let(:id) { project.id }

    get '/api/v1/projects/:id' do
      example_request "return one project" do
        expect(response_body).to have_json_path("project/id")
        expect(response_body).to have_json_path("project/permalink")
        expect(response_body).to have_json_path("project/name")

        expect(status).to eq(200)
      end
    end
  end
end

