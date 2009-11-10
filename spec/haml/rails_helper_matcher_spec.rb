require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe I15R::PatternMatchers::Haml::RailsHelperMatcher do
  it "should replace a title in a link_to helper in a %tag row" do
    plain = %(%p= link_to 'New user', new_user_path)
    i18ned = %(%p= link_to I18n.t("users.index.new_user"), new_user_path)
    I15R::PatternMatchers::Haml::RailsHelperMatcher.run(plain, "users.index").should == i18ned
  end
  
  it "should replace a title in a link_to helper in an implicit div row" do
    plain = %(#new_user_link= link_to 'New user', new_user_path)
    i18ned = %(#new_user_link= link_to I18n.t("users.index.new_user"), new_user_path)
    I15R::PatternMatchers::Haml::RailsHelperMatcher.run(plain, "users.index").should == i18ned
  end
  
  it "should replace the label text in a label helper" do
    plain = %(= f.label :password, "Password")
    i18ned = %(= f.label :password, I18n.t("users.new.password"))
    I15R::PatternMatchers::Haml::RailsHelperMatcher.run(plain, "users.new").should == i18ned
  end
  
end