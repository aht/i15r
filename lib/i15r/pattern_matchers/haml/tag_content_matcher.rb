module I15R
  module PatternMatchers
    module Haml
      class TagContentMatcher < Base
        def self.match_haml_implicit_div_tag_content
          #FIXME: really ugly. so many negative groups
          # to prevent #new-user-link= link_to '...', new_user_path to match
          patt = /^(.*#[^\s=]+\s*)([^\s=]+[^=]*)$/
          matches do |text, prefix|
            if m = patt.match(text)
              i18n_string = I15R::Base.get_i18n_message_string(m[2], prefix)
              i18ned_row = %(#{m[1]}I18n.t("#{i18n_string}"))
              [m[0], i18ned_row]
            end
          end
        end
        register_matcher :match_haml_implicit_div_tag_content

      end

    end
  end
end
