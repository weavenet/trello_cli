[![Build Status](https://secure.travis-ci.org/brettweavnet/trello_cli.png)](http://travis-ci.org/brettweavnet/trello_cli)

# trello_cli

Simple Ruby Trello Command Line Interface

## Installation

Install the trello_cli gem

    gem install trello_cli

## Setup

Get API key:

    https://trello.com/1/appKey/generate

Get member token:

    https://trello.com/1/connect?key=$YOUR_API_KEY&name=MY_APP_NAME&response_type=token

Set the environment variables:

    TRELLO_DEVELOPER_PUBLIC_KEY=api_key
    TRELLO_MEMBER_TOKEN=member_token

## Usage

The CLI takes the following form:

    trello TARGET COMMAND OPTIONS

For example, to list the boards available to the given credentials:

    trello board list

to list the lists for a given board id:

    trello list list -b 123

To create a card:

    trello card create -b 123 -l 321 -n 'card name' -d 'card description'

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
