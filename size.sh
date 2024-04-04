#!/bin/bash
# 开始一个 Bash 脚本
#set -x 
# 如果需要调试，可以取消注释上面的行
 
# Shows you the largest objects in your repo's pack file.
# Written for osx.
# 显示你的仓库中打包文件中最大的对象。
# 为了在 OSX 上编写的脚本。
#
# @see https://stubbisms.wordpress.com/2009/07/10/git-script-to-show-largest-pack-objects-and-trim-your-waist-line/
# @author Antony Stubbs
提供了一个参考链接，该链接指向了一个与此脚本功能相关的文章。
# 指出脚本的作者是 Antony Stubbs。
 
# set the internal field spereator to line break, so that we can iterate easily over the verify-pack output
# 设置内部字段分隔符为换行符，以便在后续的循环中轻松地迭代
IFS=$'\n';
 
# list all objects including their size, sort by size, take top 10
# 使用 git 命令获取打包文件中的对象详细信息，然后通过 grep 命令排除与 "chain" 相关的行，排序后取前10个最大的对象
objects=`git verify-pack -v .git/objects/pack/pack-*.idx | grep -v chain | sort -k3nr | head`

 # 输出提示信息
echo "All sizes are in kB's. The pack column is the size of the object, compressed, inside the pack file."

 # 初始化输出字符串的标题行
output="size,pack,SHA,location"
# 遍历每个选定的对象
for y in $objects
do
    # extract the size in bytes  # 提取对象的大小并转换为 kB
    size=$((`echo $y | cut -f 5 -d ' '`/1024))
    # extract the compressed size in bytes  # 提取对象的压缩大小并转换为 kB
    compressedSize=$((`echo $y | cut -f 6 -d ' '`/1024))
    # extract the SHA   # 提取对象的 SHA 值
    sha=`echo $y | cut -f 1 -d ' '`
    # find the objects location in the repository tree  # 查找对象在仓库中的位置
    other=`git rev-list --all --objects | grep $sha`
    #lineBreak=`echo -e "\n"` # 将提取的信息添加到输出字符串中
    output="${output}\n${size},${compressedSize},${other}"
done
 # 格式化输出信息，使用 column 命令进行列对齐
echo -e $output | column -t -s ', '
