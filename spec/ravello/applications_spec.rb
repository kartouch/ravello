
describe  "Ravello::Applications" do

  %w(get post put delete).each do |verb|
    context "#{verb.capitalize!} url endpoints" do
      Ravello::Applications.send("#{verb.downcase}_endpoints".to_sym).each do |ep,url|
        it "has valid request url for #{ep} matching #{url}" do
          expect(formated_url(url)).to match(regex('applications'))
        end
      end
    end
  end

  context "Get all endpoint" do
    it "has an array of Application" do
      expect(Ravello::Applications.all.class).to eq Array
      expect(Ravello::Applications.all.first.class).to eq Application
    end
  end

end
