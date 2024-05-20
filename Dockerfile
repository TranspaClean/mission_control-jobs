# Use an official Ruby runtime as a parent image
FROM ruby:2.7.8

# Set environment variables
ENV RACK_ENV=production
ENV REDIS_URL=localhost

# Install dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Set the working directory
WORKDIR /usr/src/app

# Copy the Gemfile and Gemfile.lock into the image
COPY Gemfile ./

# Install gems
RUN bundle install

# Copy the rest of the application code
COPY . .

# Expose port 3000 for the web server
EXPOSE 3000

# Start the application
CMD ["bundle", "exec", "rackup", "-o", "0.0.0.0"]
