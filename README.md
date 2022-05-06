# concourse-ssh-resource

A resource type for a ssh resource

## Source configuration

```


```

- hostname: *Required*. Servers hostname to connect to.
- port: *Optional*. *Default* `22`. Port the ssh server accepts connections on.
- user: *Required*. User as which to connect.
- identity: *Required*. The private key used to authenticate.
- hostkey: *Required*. The hostkey of the server.
- files: *Optional*. File paths on the remote to get/put
