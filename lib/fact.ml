open Ctypes
module FFi = Fact_ffi.M
module R = FFi.Reasoner
module C = FFi.ConceptActor

module ConceptExpression = struct
  type t = FFi.ConceptExpression.t
end

module RoleExpression = struct
  type t = FFi.RoleExpression.t
end

module IndividualExpression = struct
  type t = FFi.IndividualExpression.t
end

module ConceptActor = struct
  type t = FFi.ConceptActor.t


  let create () =
    let actor = C.create () in
    Gc.finalise (fun t -> C.destroy t) actor;
    actor

  let get_elements_2d _t =
    []
end

module Reasoner = struct

  type t = R.t

  let create () =
    let res = R.create () in
    Gc.finalise (fun t -> R.destroy t) res;
    res

  let classify = R.classify

  let version = R.version

  let top = R.top

  let create_concept = R.create_concept

  let create_individual = R.create_individual

  let create_role = R.create_role

  let object_exists = R.create_exists

  let implies = R.create_implies

  let instance_of = R.create_instance_of

  let is_subsumed_by = R.is_subsumed_by

  let super_concepts t expr direct actor =
    let actr_ptr = allocate FFi.ConceptActor.t actor in
    R.super_concepts t expr direct actr_ptr;
    ()

end
