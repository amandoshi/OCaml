(** A fraction is a rational number p/q, where p and q are co-prime integers and q != 0.
    If p/q < 0, then p < 0. *)
type t

(** [make n d] makes a fraction n/d = p/q, where p/q is the simplified fraction.
    [None] is returned if d == 0. *)
val make : int -> int -> t option

(** [make_exn n d] is similar to [make n d], except an exception is raised if d = 0. *)
val make_exn : int -> int -> t

(** Utility functions. *)
val numerator : t -> int
val denominator : t -> int
val to_string : t -> string
val to_float : t -> float

(** Mathematical operations. *)
val add : t -> t -> t
val mul : t -> t -> t
