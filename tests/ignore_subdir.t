Setup:

  $ source $TESTDIR/setup.sh
  $ mkdir -p ./a/b/c
  $ mkdir -p ./a/test
  $ mkdir -p ./a/tests
  $ echo 'whatever1' > ./a/b/c/blah.yml
  $ echo 'whatever2' > ./a/b/foo.yml
  $ echo 'a/b/*.yml' > ./.gitignore
  $ echo 'whatever3' > ./a/test/tests.txt
  $ echo 'whatever4' > ./a/tests/tests.txt

Ignore foo.yml but not blah.yml:

  $ ag whatever .
  a/b/c/blah.yml:1:whatever1
  a/test/tests.txt:1:whatever3
  a/tests/tests.txt:1:whatever4

Dont ignore anything (unrestricted search):

  $ ag -u whatever .
  a/b/c/blah.yml:1:whatever1
  a/b/foo.yml:1:whatever2
  a/test/tests.txt:1:whatever3
  a/tests/tests.txt:1:whatever4

Ignore things that have "test" in their names:

  $ ag --ignore test whatever
  a/b/c/blah.yml:1:whatever1

Ignore things that have "tests" in their names:

  $ ag --ignore tests whatever
  a/b/c/blah.yml:1:whatever1

Only ignore things that have "tests" in their names:

  $ ag -D -u --ignore tests whatever
  a/b/c/blah.yml:1:whatever1
  a/b/foo.yml:1:whatever2
