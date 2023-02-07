require 'swagger_helper'

RSpec.describe 'immunizations', type: :request do
  path '/upcoming' do
    get('upcoming immunization') do
      tags 'Immunizations'
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        # run_test!
      end
    end
  end

  path '/immunization' do
    patch('update immunization') do
      tags 'Immunizations'
      response(401, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
