Run in shell to use utop, dune:
```
test -r /home/opam/.opam/opam-init/init.sh && . /home/opam/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
```

Execute to compile and run OCaml:
```
dune build
dune exec <PROGRAM>
```
