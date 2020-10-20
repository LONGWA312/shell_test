# shell_test
3.6 处理文件
 
shell提供了很多在Linux文件系统上操作文件的命令。本节将带你逐步了解文件处理所需要 的一些基本的shell命令。 
3.6 处理文件  47 
 
1 
2 
3 
4 
5 
8 
10 
14 
9 
6 
7 
12 
11 
13 
3.6.1 创建文件 
你总会时不时地遇到要创建空文件的情况。例如，有时应用程序希望在它们写入数据之前， 某个日志文件已经存在。这时，可用touch命令轻松创建空文件。 
$ touch test_one $ ls -l test_one -rw-rw-r-- 1 christine christine 0 May 21 14:17 test_one $ touch命令创建了你指定的新文件，并将你的用户名作为文件的属主。注意，文件的大小是 零，因为touch命令只创建了一个空文件。 touch命令还可用来改变文件的修改时间。这个操作并不需要改变文件的内容。 
$ ls -l test_one -rw-rw-r-- 1 christine christine 0 May 21 14:17 test_one $ touch test_one $ ls -l test_one -rw-rw-r-- 1 christine christine 0 May 21 14:35 test_one $ test_one文件的修改时间现在已经从初的时间14:17更新到了14:35。如果只想改变访问时 间，可用-a参数。 
$ ls -l test_one -rw-rw-r-- 1 christine christine 0 May 21 14:35 test_one $ touch -a test_one $ ls -l test_one -rw-rw-r-- 1 christine christine 0 May 21 14:35 test_one $ ls -l --time=atime test_one -rw-rw-r-- 1 christine christine 0 May 21 14:55 test_one $ 在上面的例子中，要注意的是，如果只使用ls –l命令，并不会显示访问时间。这是因为默 认显示的是修改时间。要想查看文件的访问时间，需要加入另外一个参数：--time=atime。有 了这个参数，就能够显示出已经更改过的文件访问时间。 创建空文件和更改文件时间戳算不上你在Linux系统中的日常工作。不过复制文件可是在使 用shell时经常要干的活儿。 
3.6.2 复制文件 
对系统管理员来说，在文件系统中将文件和目录从一个位置复制到另一个位置可谓家常便 饭。cp命令可以完成这个任务。 在基本的用法里，cp命令需要两个参数——源对象和目标对象： 
cp source destination 当source和destination参数都是文件名时，cp命令将源文件复制成一个新文件，并且以 destination命名。新文件就像全新的文件一样，有新的修改时间
