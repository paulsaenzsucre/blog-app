name: Tests

on: pull_request

jobs:
  rspec:
    name: RSpec
    runs-on: ubuntu-latest
    env:
      RAILS_ENV: test
      BLOG_APP_TEST_DB_URL: postgres://postgres:postgres@localhost/blog_app_test
    services:
      postgres:
        image: postgres:latest
        ports:
        - 5432:5432
        env:
          POSTGRES_USER: postgres
          POSTGRES_PASSWORD: postgres
    steps:
      - name: Checkout Repository
        uses: actions/checkout@v3
      - name: Setup Ruby
        uses: ruby/setup-ruby@v1
        with:
          ruby-version: 3.2.2
      - name: Install postgres client
        run: sudo apt-get install libpq-dev
      - name: Install Gemfile
        run: gem install bundler
      - name: Instal dependencies
        run: bundle install
      - name: Create database
        run: |
          bundler exec rails db:create RAILS_ENV=test
          bundler exec rails db:migrate RAILS_ENV=test
          bundler exec rails db:seed RAILS_ENV=test
      - name: RSpec Report
        run: rspec --force-color --format documentation
        