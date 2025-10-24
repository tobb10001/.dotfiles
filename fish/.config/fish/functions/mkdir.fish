function mkdir --wraps mkdir
    # Create the directories (respecting all user args)
    command mkdir $argv

    # For every dir created, add it to zoxide if it actually exists now
    for dir in $argv
        if test -d $dir
            zoxide add $dir
        end
    end
end
