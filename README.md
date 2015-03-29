#docker_ruby_development

I want to experiment with using Docker containers as short-lived, sandboxed development environments. This repo can be used to create a Docker image containing my usual Ruby/Rails development toolchain of:

* rvm (with Ruby 1.9.3, 2.0.0, 2.1.5, and 2.2.0 installed)
* tmux
* vim
* zsh

It is also available as an image on DockerHub: [https://registry.hub.docker.com/u/robertjlooby/ruby_dev/](https://registry.hub.docker.com/u/robertjlooby/ruby_dev/)

Some example usages:

    //create a new container, starts you in a zsh shell in the ruby_dev user's home dir
    docker run -it robertjlooby/ruby_dev
    
    //create a new container with your ssh keys mounted for the ruby_dev user
    //(ex. to push to git repos from inside the container)
    //this works for me on OSX because the ruby_dev UID is hard-coded to 1000, YMMV
    docker run -it -v /Users/your-user/.ssh:/home/ruby_dev/.ssh:ro robertjlooby/ruby_dev
    
    //create a new container to edit/run code from your host machine in the container
    docker run -it -v /Users/your-user/project:/home/ruby_dev/project robertjlooby/ruby_dev
