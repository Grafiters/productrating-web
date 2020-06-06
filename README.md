# Set up dev environment

- Install Ruby (e.g. see instructions in https://gorails.com/setup/osx/10.15-catalina)
- Install PostgreSQL (e.g. see instructions in https://gorails.com/setup/osx/10.15-catalina)
- Install Rails and dependencies. Run `bundle install` in project directory.

# Set up database
- `bundle exec rake db:reset`
- `bundle exec rake db:fixtures:load`

# Run servers

- Run backend server: `rails s`
- Open `http://localhost:3000/` in a browser.

# Improve the web app

- Search for the word `TODO` within the project
- Follow the instructions on the `TODO` and implement as many as you can
- Fix any bug that you find
- Improve any code that is confusing and repetitive
- UI is not important, no need to improve the UI.

# Submit your changes

- Fork this repository
- Commit and push your changes
- Make a PR from your fork to this repository
