Victorykit::Application.config.social_media = YAML.load_file(Rails.root.join('config', 'social_media.yml'))[Rails.env].with_indifferent_access