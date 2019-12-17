FactoryBot.define do

  factory :user do
    name               {"test"}
    email              {"te@st"}
    password           {"testtest"}
    image              {Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/image.jpg'))}
  end

end