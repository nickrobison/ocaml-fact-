(lang dune 2.3)
(name fact++)

(generate_opam_files true)

(package
  (name fact++)
  (depends
   ctypes
   (alcotest :with-test)))