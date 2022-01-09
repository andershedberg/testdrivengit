#!/bin/bash
# Found at https://stackoverflow.com/a/42455282

# update the new origin 
# (or leave the same one if its the same as the original)

##git remote set-url origin <new-url> 

# loop over all the original branches
# 1. check them out as local branches 
# 2. set the origin as the track branch
for branch in `git branch -a | grep remotes | grep -v HEAD | grep -v master `; do
    git branch --track ${branch#remotes/origin/} $branch
done

# now push all branches and tags
git push origin --all  
git push origin --tags