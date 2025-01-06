tell application "Terminal"
    if not (exists window 1) then reopen
    activate
    do script "echo SE DIVIRTA" in window 1
end tell