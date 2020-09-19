mac book air
installed anaconda
tried using the graphical launcher and package installer, did not work as voila packages not there

reverted to command line and much better

## morning wake process

open terminal

deactivate base environment
  conda deactivate

change directory to voila repository

linked to https://github.com/andrewcgaitskell/voila.git

cd ~/Documents/Dashboards/voila

pull any changes made to dev environment
  git pull

push any changes upto git hub
  git push

activate voila environment
  conda activate env_voila
  
launch jupyter notebook
  jupyter notebook
  
using firefox as default browser

working locally

making changes to a note book locally

make changes
save and checkpoint

shutdown hupyter server
add changes to local repo
  git add .
commit changes to local repo
  git commit -m "changes to local repo"
  
push changes to github
  git push


adding libraries

shutdown notebook

pip install matplotlib
pip freeze > requirements.txt
git add .
git commit -m "added matplot lib"
git push

restart note books
jupyter notebook


