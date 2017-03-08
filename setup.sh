#!/bin/bash

container_name=${1}

run (){
    cmd=${1} 
    echo ${cmd} | lxc exec ${container_name} --mode=non-interactive -- /bin/bash
}

copy (){
    from=${1}
    to=${2} # only absolute path
    lxc file push ${from} ${container_name}${to}
}

copy '.bashrc' '/root/.bashrc'
copy '.vimrc' '/root/.vimrc'
run 'apt update' 
run 'apt upgrade -y'
run 'apt install source-highlight unzip vim bash-completion -y'
run 'update-alternatives --set editor /usr/bin/vim.basic'


