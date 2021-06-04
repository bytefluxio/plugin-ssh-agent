function __add_private_keys -d "adds all private keys in ~/.ssh/"
    for public_key in ~/.ssh/*.pub
        set private_key (string replace '.pub' '' $public_key)
        if test -e $private_key
            ssh-add $private_key >/tmp/ssh-add.log ^ /tmp/ssh-add.err
        end
    end
end

function __ssh_agent_start -d "start a new ssh agent"
    set -x SSH_ENV (nohup ssh-agent -c 2>/dev/null| string replace -r -a '^echo' '#echo')
    eval $SSH_ENV
    chmod 600 $SSH_AUTH_SOCK
    set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
    set -Ux SSH_AGENT_PID $SSH_AGENT_PID

    __add_private_keys
end

function fish_ssh_agent --description "Start ssh-agent if not started yet, or uses already started ssh-agent."
    # If there is a ssh-agent running
    if test (ps -a | grep 'ssh-agent' | tr '\n' ' ')
        # Try to connect to ssh-agent
        if string match 'Could not open a connection*' (ssh-add -l 2>&1) >/dev/null
        or string match 'Error connecting to agent*' (ssh-add -l 2>&1) >/dev/null
            # Could not connect
            # Kill all ssh-agent processes
            for ssh_agent_pid in (ps -a | grep ssh-agent | awk '{print $1;}')
                kill $ssh_agent_pid
            end
            __ssh_agent_start
        end
    else
        __ssh_agent_start
    end
end

