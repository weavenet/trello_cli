[![Build Status](https://secure.travis-ci.org/brettweavnet/trello_cli.png)](http://travis-ci.org/brettweavnet/trello_cli)

# trello_cli

Simple Ruby Trello Command Line Interface

## Installation

Install the trello_cli gem

    gem install trello_cli

## Setup

Get API key:

    https://trello.com/1/appKey/generate

Get read only member token:

    https://trello.com/1/connect?key=YOUR_API_KEY&name=trello-cli&response_type=token

Get read / write member token:

    https://trello.com/1/authorize?key=YOUR_API_KEY&name=trello-cli&expires=1day&response_type=token&scope=read,write

Set the environment variables:

    TRELLO_DEVELOPER_PUBLIC_KEY=api_key
    TRELLO_MEMBER_TOKEN=member_token

## Usage

The CLI takes the following form:

    trello TARGET COMMAND OPTIONS

To see a list of targets:

    # trello -h
    trello [board|card|list] [command] OPTIONS
    Append -h for help on specific target.

To see a list of commands for a given target:

    # trello card -h
    Valid commands for card: create, list
    For further help, append -h to sub command.

To see help for a specific command:

    # trello card create -h
    Usage: trello card [create] [options]
        -b, --board [BOARD]              Trello Board Id
        -d, --description [DESCRIPTION]  Description Of Card
        -l, --list [LIST]                List Of Card
        -n, --name [NAME]                Name Of Card

## Examples

List the boards available to the given credentials:

    trello board list

List the lists for a given board id:

    trello list list -b 123

Create a card:

    trello card create -b 123 -l 321 -n 'card name' -d 'card description'

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
