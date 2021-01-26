module C = Configurator.V1

let ocamlopt_lines c =
  let cflags =
    try C.ocaml_config_var_exn c "ocamlopt_cflags"
    with _ -> "-O3 -fno-strict-aliasing -fwrapv" in
  C.Flags.extract_blank_separated_words cflags

  let link_flags c =
  let system = C.ocaml_config_var_exn c "system" in
  let libs = match system with
    (* Necessary flags for catching exceptions on MacOS: https://github.com/ocaml/ocaml/issues/9026*)
    | "macosx" -> ["-cclib"; "-Wl,-keep_dwarf_unwind"]
    | _ -> [] in
  libs

let () =
  C.main ~name:"fact++" (fun c ->
      let lines = ocamlopt_lines c in
      let lflags = link_flags c in
      C.Flags.write_lines "cflags" lines;
      C.Flags.write_sexp "library_flags.sexp" lflags
    )
