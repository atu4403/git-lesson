function fn
    set v $argv[1]
    git switch test$v
    echo test$v
    test$v >test$v.txt
    git add --all
    git commit -m "commit $v"
    git pull --rebase origin main
end

# git switch -c test1 main
# git switch --no-track -c test2 main
# git switch -c test3 origin/main
# git switch --no-track -c test4 origin/main
# git br -vv
#   main  487b38f [origin/main] Initial commit
#   test1 487b38f Initial commit
#   test2 487b38f Initial commit
#   test3 487b38f [origin/main] Initial commit
# * test4 487b38f Initial commit
set -l vals 1 2 3 4
for i in $vals
    fn $i
end
