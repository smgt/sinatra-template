if [ -a .git ];then
  echo "A git repository already exists"
  exit 1
fi
git clone git@github.com:smgt/sinatra-template.git .
rm -rf .git
rm install.sh
git init .
git add .
git commit -m "Initial commit"
