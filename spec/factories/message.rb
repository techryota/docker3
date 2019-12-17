FactoryBot.define do

  factory :message do
    content               {"testtesttest"}
    image                 {Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/image.jpg'))}
    group
    user
  end

end