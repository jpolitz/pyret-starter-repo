# A Starter Repo for Pyret Projects

To get started, run:

```
$ npm install
```

This will put an executable, `pyret`, into `node_modules/.bin/pyret`.  It
compiles Pyret files to JavaScript files.  For example:

```
$ ./node_modules.bin/pyret test.arr
```

This will print some information about starting a server, then work for a bit
and generate `test.arr.jarr`.  The first time will take a while; future runs
will be much shorter.  Then you can run:

```
$ node test.arr.jarr
Looks shipshape, your test passed, mate!
```

The program `main.arr` is a little more complicated, and uses the `file`
library to do some real work.
