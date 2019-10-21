# Example of how to use the chef waiter

## Files missing for Dockerfile

When you first download this repo you will need to create your node in chef. This will yield 2 files that you need to create BEFORE the container will build.

Make sure that you create your node on chef and then make the below 2 files.

* client.pem
* client.rb

## Setup your chef node

```sh
export EDITOR=vim
knife node create node1 -c knife.rb
knife client create node1 -c knife.rb -f /etc/chef/client.pem
```

When asked, make sure you set the run list for node1 to `recipe[helloworld]`.

You may also need to allow your node to update itself in the chef permissions. You will know if you need to do this if the runs fail at the end when uploading the run state.

## Cookbooks to use in the example

The cookbooks directory has 2 very simple cookbooks that you can execute on your node to see the chef waiter in action. Upload them to your chef server before starting.

## Upload the cookbooks

You need to upload the cookbooks in the example.

```sh
knife upload helloworld -c knife.rb
knife upload oneshot -c knife.rb
```