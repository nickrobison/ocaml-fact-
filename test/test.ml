module R = Fact.Reasoner

let binding_test () =
  let k = R.create () in
  let c = R.create_concept k "C" in
  let d = R.create_concept k "D" in
  let i = R.create_individual k "I" in
  let r = R.create_role k "R" in
  let sm = R.object_exists k r (R.top k) in
  R.implies k c sm;
  R.implies k sm d;
  R.instance_of k i c;
  R.classify k;
  print_endline "Checking";
  Alcotest.(check bool) "C [= D" true (R.is_subsumed_by k c d);
  print_endline "Checked"


let () =
  Alcotest.run "FaCT++ binding" [
    "binding tests", [
      "binding", `Quick, binding_test;
    ];
  ]
