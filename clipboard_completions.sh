_clipboard(){
    local cur prev words cword

#    echo "comp_key" "$COMP_KEY"
#    echo "comp type" "$COMP_TYPE"
#    echo "cur" "$cur"
    # we want to tell the diff between a completion
    # invoke via "TAB" and the keybinding mapped
    # to clipboard completion (let's say, \C-h for
    # example. If we are the clipboard config, we
    # search the clipboard history, otherwise we
    # just pass to the default completion here
    if [ $COMP_KEY == 9 ] ; then
        if [ $COMP_TYPE == 37 ] ; then
            COMPREPLY=()
            #COMPREPLY=( abba babba cabba dabba easy foobar glippy )
            #COMPREPLY=( $( compgen -F _clips -- "$cur") )
            mapfile -t CLIPS < ~/.local/clipbored/clips
            IFS=$'\n';
            COMPREPLY=( $( compgen -W "${CLIPS[*]}" -- "$cur") )
            #unset IFS
            #COMPREPLY=( "$CLIPS[@]" )
        fi
    fi
}

# complete on empty so we can paste an
# entire command
#complete -E -F _clipboard ''
complete -E -F _clipboard
complete -D -F _clipboard
#complete -F -o default _clipboard
