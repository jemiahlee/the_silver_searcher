Setup:

  $ . $TESTDIR/setup.sh
  $ mkdir -p ./a/b/c
  $ echo 'whatever1' > ./a/b/c/blah.yml
  $ echo 'whatever2' > ./a/b/foo.yml
  $ echo '/a/b/foo.yml' > ./.gitignore

Ignore foo.yml but not blah.yml:

  $ ag whatever .
  a/b/c/blah.yml:1:whatever1

Dont ignore anything (unrestricted search):

  $ ag -u whatever . | sort
  a/b/c/blah.yml:1:whatever1
  a/b/foo.yml:1:whatever2

Ignore foo.yml given an absolute search path [#448]:

  $ ag whatever $(pwd)
  /.*/a/b/c/blah.yml:1:whatever1 (re)
