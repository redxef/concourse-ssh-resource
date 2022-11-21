# concourse-ssh-resource

A resource type for a ssh resource

## Source configuration

```
resource_types:
- name: ssh
  type: registry-image
  source:
    repository: redxef/concourse-ssh-resource
resources:
- name: my-server
  type: ssh
  source:
    hostname: ((my-server.hostname))
    port: ((my-server.port))
    user: ((my-server.user))
    identity: ((my-server.identity))
    hostkey: ((my-server.hostkey))
    files: []
```

- hostname: *Required*. Servers hostname to connect to.
- port: *Optional*. *Default* `22`. Port the ssh server accepts connections on.
- user: *Required*. User as which to connect.
- identity: *Required*. The private key used to authenticate.
- hostkey: *Required*. The hostkey of the server.
- files: *Optional*. File paths on the remote to get/put
- directory: *Optional*. *Default* `$HOME`. The remote directory from which to base paths on.

## `check`

Check if any of the listed files on the remote server have been updated.

## `in` receive files

Receive all configured files.

## `out` push files and run command

Push all configured files to the server and run the specified command afterwards.

### Configuration

```
- put: my-server
  params:
    command:
    - ls
    - -la
```

### parameters

- workdir: *Optional*. *Default* `$HOME`. The remote directory to use as `cwd` when running commands.
- command: *Optional*. *Default* `[true]`. A command to execute on the remote, given as list.
- stderr_file: *Optional*. *Default* `-`. A file on the remote which should contain the stderr of the command. If `-` is given it will be redirected to stderr and available in concourse.
- stdout_file: *Optional*. *Default* `-`. See `stderr_file` for more info. `stderr_file` and `stdout_file` can be the same.
