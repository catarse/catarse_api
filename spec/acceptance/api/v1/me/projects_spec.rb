require 'spec_helper'
require 'rspec_api_documentation/dsl'

resource 'Me::Projects' do
  parameter :user_email, required: true
  parameter :user_token, required: true

  describe "Get my projects" do
    let(:user) do
      _u = create(:user)
      _u.reload
      _u
    end

    let(:user_email) { user.email }
    let(:user_token) { user.authentication_token }

    before do
      create(:project, user: user)
    end

    get '/api/v1/me/projects' do
      example_request "return my projects" do
        expect(response_body).to have_json_path("projects/0/id")
        expect(response_body).to have_json_path("projects/0/permalink")
        expect(response_body).to have_json_path("projects/0/name")

        expect(status).to eq(200)
      end
    end
  end
end
