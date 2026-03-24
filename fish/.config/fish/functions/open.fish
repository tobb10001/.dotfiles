function open
    echo Running (mimeo --command $argv)
    setsid mimeo --quiet $argv
end
