FactoryBot.define do
  factory :image do
    author
    file      { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'support', 'sample.jpeg'), 'image/jpeg') }
  end
end
