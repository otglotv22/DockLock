#!/bin/bash

show_menu() {
    echo "Welcome to DockLock!"
    echo "1 - Turn Lock Dock On"
    echo "2 - Turn Lock Dock Off"
    echo "3 - Check Dock Lock Status"
    echo "0 - Exit"
}

turn_lock_on() {
    defaults write com.apple.Dock size-immutable -bool true
    killall Dock
    echo "Dock is now locked."
}

turn_lock_off() {
    defaults delete com.apple.Dock size-immutable
    killall Dock
    echo "Dock lock has been turned off."
}

check_lock_status() {
    locked=$(defaults read com.apple.Dock size-immutable 2>/dev/null)

    if [ "$locked" = "1" ]; then
        echo "Dock is currently locked."
    else
        echo "Dock is currently not locked."
    fi
}

while true; do
    show_menu
    read -p "Enter your choice (1/2/3/0): " choice

    case $choice in
        1) turn_lock_on ;;
        2) turn_lock_off ;;
        3) check_lock_status ;;
        0)
            echo "Exiting DockLock. Goodbye!"
            break
            ;;
        *)
            echo "Invalid choice. Please enter 1, 2, 3, or 0."
            ;;
    esac
done
