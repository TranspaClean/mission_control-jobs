FROM ruby:2.7

# Set working directory
WORKDIR /app

# Copy the Gemfile, Gemfile.lock, and gemspec file
COPY Gemfile *.gemspec ./

# Install dependencies
RUN bundle install

# Copy the rest of the application code
COPY . .

# Set environment variable
ENV REDIS_URL=localhost

# Expose the port the app runs on
EXPOSE 3000

# Command to run the application
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
