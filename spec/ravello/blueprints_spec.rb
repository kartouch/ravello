
describe  "Ravello::Blueprints" do

  %w(get post put delete).each do |verb|
    context "#{verb.capitalize!} url endpoints" do
      Ravello::Blueprints.send("#{verb.downcase}_endpoints".to_sym).each do |ep,url|
        it "has valid request url for #{ep} matching #{url}" do
          expect(formated_url(url)).to match(regex('blueprints'))
        end
      end
    end
  end

end
