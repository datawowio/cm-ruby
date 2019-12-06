# Content Moderation Ruby Client

# Installation

Installing via rubygems:

```ruby
gem 'cm-datawow', '~> 0.0.2'
```

### Rails

```bash
$ rails generate cm:install
```

# Configuration

First configure your project key:

```ruby
require 'cm'

CM.project_key = YOUR_PROJECT_KEY
```
# Usage

There are 3 methods available in moderation class (`create`, `all`, `find_by`). Each
method returns a response of type `CM::Response`, which has two attributes,
`body` and `code`. You can simply access response's body by calling `.body`

### Create
```ruby
require 'cm'

CM.project_key = YOUR_PROJECT_KEY
params = {
  data: data,
  postback_url: postback_url,
  postback_method: postback_method,
  custom_id: custom_id
}
CM.moderation.create(params)
```

`data` could be text or image's url depends on your project's template.

#### params

| Field        | Type           | Required  | Description |
| ------------- |:-------------:| :-----:| :-----|
| data | string | **Yes** | URL of image |
| postback_url| string| No | URL for answer callback once image has been checked |
| postback_method| string | No | Configuration HTTP method GET POST PUT PATCH |
| custom_id | string | No | Custom ID that used for search |

#### result
```
response = CM.moderation.create({
  data: YOUR_DATA,
  custom_id: 'data-1'
})

print(response.body)
```

You will receive response like below, once you created moderation successfully.

```ruby
{
  "data" => {
    "id" => "5dbab19ebbadfc32kefb56bf",
    "type" => "moderation",
    "attributes" => {
      "custom_id" => "data-1",
      "data" => YOUR_DATA,
      "postback" => false,
      "postback_url" => YOUR_POSTBACK_URL,
      "postback_method" => YOUR_POSTBACK_METHOD,
      "answer" => nil,
      "created_at" => "2019-10-31T17:04:14.540+07:00",
      "processed_at" => nil,
      "status" => "unprocessed",
      "id" => "5dbab19ebbadfc32kefb56bf",
      "project_template" => YOUR_PROJECT_TEMPLATE,
      "project_id" => YOUR_PROJECT_ID
    }
  },
  "meta" => {
    "code" => 201,
    "message" => "Created"
  }
}
```

### All
Method `all` is used to retrieve all of your moderations

```ruby
require  'cm'

CM.project_key = YOUR_PROJECT_KEY
CM.moderation.all
```

#### result
```ruby
{
  "data" => [
    {
      "id" => "5dbab19ebbadfc32kefb56bf",
      "type" => "moderation",
      "attributes" => {
        "custom_id" => "data-1",
        "data" => YOUR_DATA,
        "postback" => false,
        "postback_url" => YOUR_POSTBACK_URL,
        "postback_method" => YOUR_POSTBACK_METHOD,
        "answer" => "approved",
        "project_template" => YOUR_PROJECT_TEMPLATE,
        "created_at" => "2019-10-31T17:15:15.302+07:00",
        "processed_at" => "2019-10-31T17:16:15.814+07:00",
        "status" => "processed",
        "id" => "5dbab19ebbadfc32kefb56bf",
        "project_template" => YOUR_PROJECT_TEMPLATE,
        "project_id" => YOUR_PROJECT_ID,
      }
    }
  ],
  "meta" => {
    "code" => 200,
    "message" => "OK"
  }
}
```

Fields `result` and `processed_at` will be present if your data was successfully processed.

### Find by
Method `find_by` is used to find a particular moderation. You can use either its
ID or Custom ID. This method will return only moderation with fully matched ID.

```ruby
require 'cm'

CM.project_key = YOUR_PROJECT_KEY
id = 'data-1' # or use an ID from creation response (example: '5dbab19ebbadfc32kefb56bf')
CM.moderation.find_by(id: id)
```

#### params

| Field        | Type           | Required  | Description |
| ------------- |:-------------:| :-----:| :-----|
| id | string | **Yes** | ID or Custom ID of a moderation |

#### result
```ruby
{
  "data" => {
    "id" => "5dbab19ebbadfc32kefb56bf",
    "type" => "moderation",
    "attributes" => {
      "custom_id" => "tp-1",
      "data" => YOUR_DATA,
      "postback" => false,
      "postback_url" => YOUR_POSTBACK_URL,
      "postback_method" => YOUR_POSTBACK_METHOD,
      "answer" => "approved",
      "project_template" => YOUR_PROJECT_TEMPLATE,
      "created_at" => "2019-10-31T17:04:14.540+07:00",
      "processed_at" => "2019-10-31T17:05:16.243+07:00",
      "status" => "processed",
      "id" => "5dbab19ebbadfc32kefb56bf",
      "project_template" => YOUR_PROJECT_TEMPLATE,
      "project_id" => YOUR_PROJECT_ID,
    }
  },
  "meta" => {
    "code" => 200,
    "message" => "OK"
  }
}
```
