# SRW - Stream ReWriter

Implementation of a simple macro processor for text-based languages.

Like `sed` using Ohm instead of REGEX.

![](doc/srw-main.drawio.svg)


This version is intended to rewrite 
```
    zd.append_leaf (leaves, zd.Leaf_Template { name = "1then2", instantiate = deracer_instantiate })
```
to
```
    zd.append_leaf (leaves, zd.Template { name = "1then2", instantiate = deracer_instantiate })
```

zd.Leaf_Template becomes zd.Template.

This isn't as easy at it looks. REGEX will fail or will be less easy, if the code is spread across multiple lines. 

This version recognizes structure and could be used to rewrite heavier examples.

For example, it appears that this specific example could be replaced by a simple replaceAll() that converts "zd.Leaf_Template" into "zd.Template". Yet, if "zd.Leaf_Template" occurs elsewhere in the code, the simple replaceAll() solution will over-replace, while this solution matches context before replacing. You can read this as "if zd.Leaf_Template occurs within the zd.append_leaf function call with exactly the given context, then replace zd.Leaf_Template with zd.Template, otherwise, leave it alone".

Note that, since OhmJS processes any kind of text, one could process other kinds of files, not just code. Like markdown files, etc.
