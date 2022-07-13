# Setting up Go

Hard way:

- extracting tarball from [the official guide](https://go.dev/doc/install)

Issues you get by doing that:

- go: go.mod file not found in current directory or any parent directory; see 'go help modules'". [Link](https://stackoverflow.com/questions/66894200/error-message-go-go-mod-file-not-found-in-current-directory-or-any-parent-dire).

  - solution. Change this: `go env -w GO111MODULE=auto` to this: `go env -w GO111MODULE=off`. `GO111MODULE=off` forces Go to behave the GOPATH way, even outside of GOPATH



Easy way on Fedora:

```bash
$ sudo dnf install golang
```

Go code lives in a workspace which is defined by the GOPATH environment variable. A common choice among developers, and the default value of GOPATH starting from the Go 1.8 release, is to use $HOME/go (I used .go):

```bash
$ mkdir -p $HOME/go
$ echo 'export GOPATH=$HOME/go' >> $HOME/.bashrc
$ source $HOME/.bashrc
```

Check that GOPATH is set correctly with this command:

```bash
$ go env GOPATH
/home/user/go
```


Test it by downloading gtree:

```bash
$ go get github.com/kitagry/gtree
``` 

It should be easy.
