#!/usr/bin/env sh

# 确保脚本抛出遇到的错误
set -e

# 生成静态文件
npm run build

# 进入生成的文件夹
cd docs/.vuepress/dist

# Set CNAME for "gh-pages" branch
# echo 'xxx.com' > CNAME  # 改成你要绑定的域名

msg='deploy'
githubUrl=git@github.com:lineits/VuePress.git  # 按你的代码仓库信息进行修改

git init
git add -A
git commit -m "${msg}"
git push -f $githubUrl master:gh-pages # 推送到github

# 退回开始所在目录
cd -

rm -rf docs/.vuepress/dist