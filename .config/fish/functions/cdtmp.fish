function cdtmp --description 'Switch to a temporary directory'
    cd (mktemp -d)
end