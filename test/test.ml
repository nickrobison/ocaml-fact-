module R = Fact.Reasoner
module A = Fact.ConceptActor

let binding_test () =
  let k = R.create () in
  Alcotest.(check string) "Should have correct version" "1.7.0-SNAPSHOT" (R.version k);
  let c = R.create_concept k "C" in
  let d = R.create_concept k "D" in
  let i = R.create_individual k "I" in
  let r = R.create_role k "R" in
  let sm = R.object_exists k r (R.top k) in
  R.implies k c sm;
  R.implies k sm d;
  R.instance_of k i c;
  R.classify k;
  Alcotest.(check bool) "C [= D" true (R.is_subsumed_by k c d);
  let a = A.create () in
  R.super_concepts k c 0 a;
  Alcotest.(check (list string)) "Should have concepts" [] (A.get_elements_2d a)

let () =
  Alcotest.run "FaCT++ binding" [
    "binding tests", [
      "binding", `Quick, binding_test;
    ];
  ]
