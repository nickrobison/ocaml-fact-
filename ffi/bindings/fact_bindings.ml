module M(F: Ctypes.FOREIGN) = struct

  let foreign = F.foreign

  let const x = x

  module C = struct
    include Ctypes
    let (@->) = F.(@->)
    let returning = F.returning
  end

  module ConceptExpression = struct
    type t = unit C.ptr
    let t: t C.typ = C.ptr C.void
  end

  module IndividualExpression = struct
    type t = unit C.ptr
    let t: t C.typ = C.ptr C.void
  end

  module RoleExpression = struct
    type t = unit C.ptr
    let t: t C.typ = C.ptr C.void
  end

  module ConceptActor = struct
    type t = unit C.ptr
    let t: t C.typ = C.ptr C.void

    let create =
      foreign "fact_concept_actor_new" C.(void @-> returning t)

    let destroy =
      foreign "fact_actor_free" C.(t @-> returning void)

    let get_elements_2d =
      foreign "fact_get_elements_2d" C.(t @-> returning (ptr (ptr (ptr (const char)))))
  end

  module Reasoner = struct
    type t = unit C.ptr
    let t: t C.typ = C.ptr C.void

    let create =
      foreign "fact_reasoning_kernel_new" C.(void @-> returning t)

    let classify =
      foreign "fact_classify_kb" C.(t @-> returning void)

    let destroy =
      foreign "fact_reasoning_kernel_free" C.(t @-> returning void)

    let version =
      foreign "fact_get_version" C.(t @-> returning (const string))

    let top =
      foreign "fact_top" C.(t @-> returning ConceptExpression.t)

    let create_concept =
      foreign "fact_concept" C.(t @-> string @-> returning ConceptExpression.t)

    let create_exists =
      foreign "fact_o_exists" C.(t @-> RoleExpression.t @-> ConceptExpression.t @-> returning ConceptExpression.t)

    let create_implies =
      foreign "fact_implies_concepts" C.(t @-> ConceptExpression.t @-> ConceptExpression.t @-> returning void)

    let create_instance_of =
      foreign "fact_instance_of" C.(t @-> ConceptExpression.t @-> ConceptExpression.t @-> returning void)

  let create_individual =
    foreign "fact_individual" C.(t @-> string @-> returning IndividualExpression.t)

  let create_role =
    foreign "fact_object_role" C.(t @-> string @-> returning RoleExpression.t)

  let is_subsumed_by =
    foreign "fact_is_subsumed_by" C.(t @-> ConceptExpression.t @-> ConceptExpression.t @-> returning bool)

  let super_concepts =
    foreign "fact_get_sup_concepts" C.(t @-> ConceptExpression.t @-> int @-> (ptr ConceptActor.t) @-> returning void)

end


end

