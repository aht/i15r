$:.unshift File.join(File.expand_path(File.dirname(__FILE__)), "..", "lib")

require 'i15r/pattern_matcher'
require "spec"

describe I15R::PatternMatchers::Base do
  it "should not replace a simple haml div tag with an id" do
    plain = %(#main)
    I15R::PatternMatchers::Base.run(plain, "users.new").should == plain
  end
  it "should properly replace a line with two matches" do
    plain = %(This is it: <a title="site root" href="/"><img src="site_logo.png" /></a>)
    i18ned = %(<%= I18n.t("users.new.this_is_it") %>: <a title="<%= I18n.t("users.new.site_root") %>" href="/"><img src="site_logo.png" /></a>)
    I15R::PatternMatchers::Base.run(plain, "users.new").should == i18ned
  end
  
end
