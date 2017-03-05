#http://stackoverflow.com/questions/9524457/converting-string-from-snake-case-to-camelcase-in-ruby
class String
  def camel_case_lower
    self.split('_').inject([]){ |buffer,e| buffer.push(buffer.empty? ? e : e.capitalize) }.join
  end

  def module_name
    self.to_s.gsub('Ravello::','').downcase
  end

end
