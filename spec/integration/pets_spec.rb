require 'swagger_helper'

describe "Pets API" do

  path '/api/v1/pets' do

    post 'Creates a pet' do
      tags 'Pets'
      consumes 'application/json', 'application/xml'
      parameter name: :pet, in: :body, schema: {
        type: :object,
        properties: {
          name: {type: :string},
          photo_url: {type: :string},
          status: {type: :string}
        },
        required: ['name', 'status']
      }

      response '201', 'pet created' do
        let(:pet) {{ name: 'DoDo', status: "avilable" }}
        run_test!
      end

      response '422', 'invalid request' do
        let(:pet) {{ name: "Foo" }}
        run_test!
      end

    end


  end


end