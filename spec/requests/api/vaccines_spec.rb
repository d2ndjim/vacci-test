require 'swagger_helper'

RSpec.describe 'vaccines', type: :request do
  path '/vaccines' do
    get('index vaccine') do
      tags 'Vaccines'
      response(401, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
      end
    end
  end

  path '/upcoming' do
    get('upcoming immunization') do
      tags 'Immunizations'
      response(401, 'successful') do
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
end
