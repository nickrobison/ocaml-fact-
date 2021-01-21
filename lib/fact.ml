module FFi = Fact_ffi.M
module R = FFi.Reasoner

module ConceptExpression = struct
  type t = FFi.ConceptExpression.t
end

module RoleExpression = struct
  type t = FFi.RoleExpression.t
end

module IndividualExpression = struct
  type t = FFi.IndividualExpression.t
end

module Reasoner = struct

  type t = R.t

  let create () =
    let res = R.create () in
    Gc.finalise (fun t -> R.destroy t) res;
    res

  let classify = R.classify

  let top = R.top

  let create_concept = R.create_concept

  let create_individual = R.create_individual

  let create_role = R.create_role

  let object_exists = R.create_exists

  let implies = R.create_implies

  let instance_of = R.create_instance_of

  let is_subsumed_by = R.is_subsumed_by


end


