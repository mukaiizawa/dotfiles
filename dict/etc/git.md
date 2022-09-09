git

# repository
## clone remote repository
    git clone https://github.com/mukaiizawa/dotfiles dotfiles

# branch
## display all branches
    git branch -a

## create branch
    git checkout <original_branch>
    git checkout -b <new_branch>
    git push -u origin <branch_name>

## rename branch
    git branch -m <old_branch_name> <new_branch_name>

## checkout remote branch
    git checkout -b <local_branch> origin/<remote_branch>
