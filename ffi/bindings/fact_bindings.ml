module M(F: Ctypes.FOREIGN) = struct

  let foreign = F.foreign

  module C = struct
    include Ctypes
    let (@->) = F.(@->)
    let returning = F.returning
  end

  module Reasoner = struct
    type t = unit C.ptr
    let t: t C.typ = C.ptr C.void

    let create =
      foreign "fact_reasoning_kernel_new" C.(void @-> returning t)
  end


end
