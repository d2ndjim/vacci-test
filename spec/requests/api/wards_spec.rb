require 'swagger_helper'

RSpec.describe 'wards', type: :request do
  path '/ward' do
    post('create ward') do
      tags 'Wards'
      response(200, 'successful') do
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

  path '/user/wards' do
    get('index ward') do
      tags 'Wards'
      response(200, 'successful') do
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

  path '/ward/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'id'
    get('user_child ward') do
      tags 'Wards'
      response(200, 'successful') do
        let(:id) { '123' }
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

  path '/ward/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'id'

    delete('destroy ward') do
      tags 'Wards'
      response(401, 'successful') do
        let(:id) { '123' }

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
