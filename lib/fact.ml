module FFi = Fact_ffi.M
module R = FFi.Reasoner


module Reasoner = struct

  type t = R.t

  let create () =
    let res = R.create () in
    Gc.finalise (fun t -> R.destroy t) res;
    res

end

