# Emacs Code Snippet

用来记录自己写的一些`Elisp`函数



## Misc

[source](init-misc.el)

### Read source only
用来在阅读源码的时候以`只读`的方式打开文件，而不必每次打开一个文件就按快捷键`C-x C-q`

### Kill All Buffers
杀掉除了`exclu_buffers`指定的buffer之外的所有buffer（正则匹配），默认不杀掉terminal和scratch。
