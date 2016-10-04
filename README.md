[![Build Status](https://secure.travis-ci.org/weavenet/trello_cli.png)](http://travis-ci.org/weavenet/trello_cli)

# trello_cli

Simple Ruby Trello Command Line Interface

## Installation

Install the trello_cli gem

    gem install trello_cli

Or install using docker via the instructions provided by **@jamesmstone**.

    docker pull jamesmstone/trello

## Setup

Sign-in to trello.com as the user you want to use for trello_cli.

Get API key (open this link in a web browser):

    https://trello.com/1/appKey/generate

The top field contains your Developer API Key.  Use it to replace **YOUR_API_KEY** in the member token links below as well as the **TRELLO_DEVELOPER_PUBLIC_KEY** environment variable.

Next, get a member token. You will need to replace **YOUR_API_KEY** in the links below with the API key obtained in the previous step.

To get a read only member token:

    https://trello.com/1/connect?key=YOUR_API_KEY&name=trello-cli&response_type=token

To get a read / write member token:

    https://trello.com/1/authorize?key=YOUR_API_KEY&name=trello-cli&expiration=never&response_type=token&scope=read,write

Set the api key and member token environment variables:

    export TRELLO_DEVELOPER_PUBLIC_KEY=api_key
    export TRELLO_MEMBER_TOKEN=member_token

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

### Usage with docker

    docker run -it --rm \
        -e TRELLO_DEVELOPER_PUBLIC_KEY=$TRELLO_DEVELOPER_PUBLIC_KEY \
        -e TRELLO_MEMBER_TOKEN=$TRELLO_MEMBER_TOKEN \
        jamesmstone/trello

### Output Formatters

To allow for piping output to other utilies, the output of any command can
be format as either TSV (Tab Seperated Values) or JSON.

**JSON Output**

```
# trello board list -o json
[{"name":"board1","id":"123456781234567812345678"},{"name":"board2","id":"876543218765432187654321"}]
```

This can be used with tools like [jq](http://stedolan.github.io/jq/) to parse the data:

```
# trello board list -o json |jq '.[0] | {id}'
{
  "id": "123456781234567812345678"
}
```

**TSV Output**

```
# trello board list -o tsv
123456781234567812345678  board1
876543218765432187654321  board2
```

For example, you can grep out specific cards and then cut specific fields:

```
# trello board list -o tsv |grep board1 |cut -d$'\t' -f 1
123456781234567812345678
```

The default is currently set to output as legacy to match previous versions
of the trello CLI. This will be changed to TSV or another human format in a
future release.

## Examples

List the boards available to the given credentials:

    trello board list

List the lists for a given board id and output as a TSV list:

    trello list list -b 123 -o tsv

Create a card and output as JSON:

    trello card create -b 123 -l 321 -n 'card name' -d 'card description' -o json

## Wrapper Script

If you find yourself adding the same arguments, it can be helpful to create a
wrapper script. For example see [trello.sh](https://gist.github.com/weavenet/af002bde11adc8fb7b31).

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
