(lang dune 2.6)
(name fact++)

(generate_opam_files true)

(package
  (name fact++)
  (depends
   ctypes
   dune-configurator
   (alcotest :with-test)))