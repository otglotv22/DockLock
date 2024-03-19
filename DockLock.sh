#!/bin/bash

# DockLock Programme by otglot. Please visit otglot.weebly.com for more. 

# Function to display the main menu

show_menu() {
    echo "╔════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╗"
    echo "Welcome to DockLock! - A simple Terminal script to lock your macOS dock to prevent changes. You can lock the dock position, size, and contents." 
    echo "1 - Lock Dock Position"
    echo "2 - Lock Dock Size"
    echo "3 - Lock Dock Contents"
    echo "4 - Clear Terminal"
    echo "0 - Exit"
    echo "╚════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╝"
}

lock_dock_position() {
    while true; do
        echo "╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮"
        echo "Lock Dock Position - Menu"
        echo "1 - Turn On"
        echo "2 - Turn Off"
        echo "3 - Check Status"
        echo "4 - Clear Terminal"
        echo "0 - Go Back to Main Menu"
        echo "╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯"
        read -p "Enter your choice (1/2/3/4/0): " choice

        case $choice in
            1) 
                defaults write com.apple.Dock position-immutable -bool true
                killall Dock
                echo "Dock position is now locked."
                ;;
            2) 
                defaults write com.apple.Dock position-immutable -bool false
                killall Dock
                echo "Dock position lock has been turned off."
                ;;
            3) 
                locked=$(defaults read com.apple.Dock position-immutable 2>/dev/null)
                if [ "$locked" = "1" ]; then
                    echo "Dock position is currently locked."
                else
                    echo "Dock position is currently not locked."
                fi
                ;;
            4) 
                clear
                echo "Terminal cleared."
                ;;
            0) 
                break
                ;;
            *)
                echo "Invalid choice. Please enter 1, 2, 3, 4, or 0."
                ;;
        esac
    done
}

lock_dock_size() {
    while true; do
        echo "╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮"
        echo "Lock Dock Size - Menu"
        echo "1 - Turn On"
        echo "2 - Turn Off"
        echo "3 - Check Status"
        echo "4 - Clear Terminal"
        echo "0 - Go Back to Main Menu"
        echo "╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯"
        read -p "Enter your choice (1/2/3/4/0): " choice

        case $choice in
            1) 
                defaults write com.apple.Dock size-immutable -bool true
                killall Dock
                echo "Dock size is now locked."
                ;;
            2) 
                defaults write com.apple.Dock size-immutable -bool false
                killall Dock
                echo "Dock size lock has been turned off."
                ;;
            3) 
                locked=$(defaults read com.apple.Dock size-immutable 2>/dev/null)
                if [ "$locked" = "1" ]; then
                    echo "Dock size is currently locked."
                else
                    echo "Dock size is currently not locked."
                fi
                ;;
            4) 
                clear
                echo "Terminal cleared."
                ;;
            0) 
                break
                ;;
            *)
                echo "Invalid choice. Please enter 1, 2, 3, 4, or 0."
                ;;
        esac
    done
}

lock_dock_contents() {
    while true; do
        echo "╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮"
        echo "Lock Dock Contents - Menu"
        echo "1 - Turn On"
        echo "2 - Turn Off"
        echo "3 - Check Status"
        echo "4 - Clear Terminal"
        echo "0 - Go Back to Main Menu"
        echo "╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯"
        read -p "Enter your choice (1/2/3/4/0): " choice

        case $choice in
            1) 
                defaults write com.apple.Dock contents-immutable -bool true
                killall Dock
                echo "Dock contents are now locked."
                ;;
            2) 
                defaults write com.apple.Dock contents-immutable -bool false
                killall Dock
                echo "Dock contents lock has been turned off."
                ;;
            3) 
                locked=$(defaults read com.apple.Dock contents-immutable 2>/dev/null)
                if [ "$locked" = "1" ]; then
                    echo "Dock contents are currently locked."
                else
                    echo "Dock contents are currently not locked."
                fi
                ;;
            4) 
                clear
                echo "Terminal cleared."
                ;;
            0) 
                break
                ;;
            *)
                echo "Invalid choice. Please enter 1, 2, 3, 4, or 0."
                ;;
        esac
    done
}

while true; do
    show_menu
    read -p "Enter your choice (1/2/3/4/0): " choice

    case $choice in
        1) lock_dock_position ;;
        2) lock_dock_size ;;
        3) lock_dock_contents ;;
        4)
            clear
            echo "Terminal cleared."
            ;;
        0)
            echo "Exiting DockLock. Goodbye!"
            break
            ;;
        *)
            echo "Invalid choice. Please enter 1, 2, 3, 4, or 0."
            ;;
    esac
done
