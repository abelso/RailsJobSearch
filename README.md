# Rails Job Search

## Software versions used

Ruby 2.7.2p137
Rails 6.0.3.4
Docker 19.03.13

## Configuration

Download and install Ruby on Windows 10
https://rubyinstaller.org/

Install Ruby on Rails by running command
```console
gem install rails
```

Download and install Docker Desktop
https://www.docker.com/products/docker-desktop

Create Postgres container
```console
docker run --name pg -p 5432:5432 -e POSTGRES_PASSWORD=postgres -e POSTGRES_USER=postgres -e POSTGRES_DB=RailsJobSearch postgres
```

Check if Ruby, Rails and Docker are installed by running commands
```console
ruby -v
rails -v
docker -v
```

Download and install pgAadmin
https://www.pgadmin.org/

Connect to postgres (localhost:5432)
If database doesn't exist create a database named RailsJobSearch

Create local_env.yml file in config folder and add environment variables for your gmail account
```console
GMAIL_USERNAME: 'your_gmail_account'
GMAIL_PASSWORD: 'your_gmail_password'
```

Start the Ruby on Rails server by running command
```console
rails server
```