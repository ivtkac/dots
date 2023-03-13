function mvntest --description 'Run java test with maven'
    mvn -Dtest=$argv[1] test;
end
