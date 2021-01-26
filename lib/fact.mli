module ConceptExpression: sig
  type t
end

module IndividualExpression: sig
  type t
end

module RoleExpression: sig
  type t
end

module ConceptActor: sig
  type t

  val create: unit -> t

  val get_elements_2d: t -> string list


end


module Reasoner: sig
  type t

  val create: unit -> t
  val classify: t -> unit
  val version: t -> string

  val top: t -> ConceptExpression.t

  (* Concept methods*)
  val create_concept: t -> string -> ConceptExpression.t
  val create_individual: t -> string -> IndividualExpression.t
  val create_role: t -> string -> RoleExpression.t
  val object_exists: t -> RoleExpression.t -> ConceptExpression.t -> ConceptExpression.t
  val implies: t -> ConceptExpression.t -> ConceptExpression.t -> unit
  val instance_of: t -> IndividualExpression.t -> ConceptExpression.t -> unit

  val is_subsumed_by: t -> ConceptExpression.t -> ConceptExpression.t -> bool

  val super_concepts: t -> ConceptExpression.t -> int -> ConceptActor.t -> unit

end

