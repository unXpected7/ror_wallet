# Use the official Ruby image as a base
FROM ruby:3.1

# Set the working directory inside the container
WORKDIR /app

# Install Node.js and Yarn (required for Rails asset pipeline)
RUN apt-get update -qq && apt-get install -y nodejs yarn

# Copy the Gemfile and Gemfile.lock to the container
COPY Gemfile Gemfile.lock ./

# Install the Rails dependencies specified in the Gemfile
RUN bundle install

# Copy the rest of the application code to the working directory
COPY . .

# Precompile assets if needed (optional, depending on your app)
# RUN bundle exec rake assets:precompile

# Command to start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
