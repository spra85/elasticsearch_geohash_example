== Zip Code Example

## Getting Started

Install some applications with Homebrew:

```
brew install postgresql
brew install elasticsearch
```

```
bundle install
rake db:create
rake db:migrate
```

# Seeding Sample data

```
rake db:seed
```

Run foreman:

```
bundle exec foreman start -f Procfile.local
```

# Dataset Creds

Using Zip Code database from [PopularData.com](http://www.populardata.com/downloads.html).

Loads ~ 42,741 zip codes

Example record: 

```
 {
	 "id"=>42741,
	 "zip"=>"99950",
	 "latitude"=>55.542007,
	 "longitude"=>-131.432682,
	 "city"=>"KETCHIKAN",
	 "state"=>"AK",
	 "county"=>"KETCHIKAN GATEWAY",
	 "zip_class"=>"STANDARD",
	 "created_at"=>Wed, 19 Feb 2014 20:51:59 UTC +00:00,
	 "updated_at"=>Wed, 19 Feb 2014 20:51:59 UTC +00:00
 }
```