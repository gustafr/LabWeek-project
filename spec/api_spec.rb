require 'product'
#require 'pry'
require 'product_helper_spec'
require 'spec_helper'
require './spec/support/fake_dabas.rb'

describe 'API' do

  let(:json) { JSON.parse(page.text) }

  before do
    create_products
  end

  context 'GET /api/v1/product_listing' do
    it "should return ALL listings as JSON" do
      visit '/api/v1/product_listing'
      expect(json.length).to eq(4)
      expect(json.class).to eq(Array)
      expect(json[0].class).to eq(Hash)
      expect(json[0]['product_name']).to eq('Lingongrova')
      expect(json[1]['product_name']).to eq('Tekaka')
      expect(json[2]['product_name']).to eq('Rågbröd')
      expect(json[3]['product_name']).to eq('Rostbröd')
    end
  end

  context 'GET /api/v1/product_listing/:barcode' do
    it "should return a SINGLE listing as JSON" do
      visit '/api/v1/product_listing?barcode=1212526767676'
      expect(json[0]['product_name']).to eq('Lingongrova')
    end

    it "should add a beginning 0 in barcode when calling api" do
      visit '/api/v1/product_listing/1212526767679'
      expect(json['barcode']).to eq('01212526767679')
    end

    xit 'queries Dabas API for product information' do
      uri = URI("http://api.dabas.com/DABASService/V1/article/gtin/07311070330090/json?apikey=#{ENV['DABAS_API']}")

      response = JSON.load(Net::HTTP.get(uri))

      expect(response["Artikelbenamning"]).to eq 'Energi'
    end

  end
end
