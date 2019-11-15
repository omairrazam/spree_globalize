module SpreeGlobalize
  module LocaleHelper
    def select_supported_locales
      select_tag(
        'supported_locales[]',
        options_for_select(available_locales_options, Config.supported_locales),
        common_options
      )
    end

    def select_available_locales_fields
      select_tag(
        'locale',
        options_for_select(available_locales_options, SpreeI18n::Config.available_locales),
        common_options
      )
    end

    def select_available_locales
      select_tag('available_locales[]', options_for_select(
        all_locales_options,
        Config.available_locales
      ), common_options)
    end


    # Need to manually add en to the array because the en.yml was moved from
    # this project. spree/spree now has those keys.
    def all_locales_options
      SpreeI18n::Locale.all.map { |locale| self.locale_presentation(locale) }.push(['English (EN)', :en])
    end

    def available_locales_options
      Config.available_locales.map { |locale| self.locale_presentation(locale) }
    end

    def locale_presentation(locale)
      [Spree.t(:'i18n.this_file_language', locale: locale), locale]
    end
    
    def supported_locales_options
      Config.supported_locales.map { |locale| locale_presentation(locale) }
    end

    def common_options
      { class: 'fullwidth', multiple: 'true' }
    end
  end
end
