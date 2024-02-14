#!/bin/bash

ZEUSCLOUD_DIR="ZeusCloud"

check_zeuscloud_installed() {
    if [ -d "$ZEUSCLOUD_DIR" ]; then
        return 0
    else
        return 1
    fi
}

install_zeuscloud() {
    if check_zeuscloud_installed; then
        echo "ZeusCloud is already installed on your system."
    else
        # Clone ZeusCloud repository
        git clone --recurse-submodules https://github.com/Zeus-Labs/ZeusCloud.git
        
        # Change directory to ZeusCloud
        cd "$ZEUSCLOUD_DIR" || exit
        
        # Run make quick-deploy to deploy ZeusCloud
        make quick-deploy
        
        echo "ZeusCloud has been successfully installed on your local system!"
    fi
}

install_zeuscloud
