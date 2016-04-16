# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'
#find_asset("foo.svg", as: "application/vnd.ms-fontobject")
# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( bootstrap.min.js)
Rails.application.config.assets.precompile += %w( bootstrap.min.css animate.min.css custom.css jquery-jvectormap-2.0.1.css green.css floatexamples.css jquery.min.js nprogress.js bootstrap.min.js gauge.min.js gauge_demo.js bootstrap-progressbar.min.js chart.min.js jquery.nicescroll.min.js icheck.min.js moment.min.js daterangepicker.js custom.js jquery.min.js)