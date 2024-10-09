function mvcd --description 'Rename the current working directory to the given name'
    set cwd $PWD
    set newcwd $argv[1]
    cd ..
    mv $cwd $newcwd
    cd $newcwd
    pwd
end
