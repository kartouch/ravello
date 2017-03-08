
describe  "Ravello::Applications" do

  def formated_url(url)
    url.gsub(':id',79332353.to_s)
       .gsub(':vmId', 2038081066755688448.to_s)
       .gsub(':view', 'deployment')
       .gsub(':action','start')
  end

  regex = /applications($|\/\d{8,20}($|(;|\/)\w{1,25}(|\/)($|((\d{1,25}|\w{1,25})|(\d{1,25}|\w{1,25}))\/\w{1,25})($|;\w{1,25})))/

  %w(get post put delete).each do |verb|
    context "#{verb.capitalize!} url endpoints" do
      Ravello::Applications.send("#{verb.downcase}_endpoints".to_sym).each do |ep,url|
        it "has valid request url for #{ep} matching #{url}" do
          expect(formated_url(url)).to match(regex)
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
