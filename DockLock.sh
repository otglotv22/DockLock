#!/bin/bash

show_menu() {
    echo "╔═══════════════════════════════════════════════════════════════════════════════════════════╗"
    echo "Welcome to DockLock! - A simple script to lock your macOS dock to prevent resizing" 
    echo "1 - Turn Dock Lock On"
    echo "2 - Turn Dock Lock Off"
    echo "3 - Check Dock Lock Status"
    echo "4 - Clear Terminal"
    echo "0 - Exit"
    echo "╚════════════════════════════════════════════════════════════════════════════════════════════╝"
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

clear_terminal() {
    clear
    echo "Terminal cleared."
}

while true; do
    show_menu
    read -p "Enter your choice (1/2/3/4/0): " choice

    case $choice in
        1) turn_lock_on ;;
        2) turn_lock_off ;;
        3) check_lock_status ;;
        4) clear_terminal ;;
        0)
            echo "Exiting DockLock. Goodbye!"
            break
            ;;
        *)
            echo "Invalid choice. Please enter 1, 2, 3, 4, or 0."
            ;;
    esac
done
