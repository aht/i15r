require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe I15R::PatternMatchers::Haml::TagContentMatcher do
  it "should replace a tag's content where the tag is an implicit div" do
    plain = %(#form_head My account)
    i18ned = %(#form_head I18n.t("users.edit.my_account"))
    I15R::PatternMatchers::Haml::TagContentMatcher.run(plain, "users.edit").should == i18ned
  end
end