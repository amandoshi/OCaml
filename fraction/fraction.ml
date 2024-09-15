open Base

type t = int * int

(** Returns the greatest common denominator of [a] and [b]. *)
let rec gcd a b =
  if a = 0 then b
  else if b = 0 then a
  else gcd (b % a) a

(** Returns -1 if [x] < 0, otherwise 1. *)
let sign x = if x < 0 then -1 else 1

(** Returns the absolute value of [x]. *)
let abs x = x * sign x

(** Computes the gcd on absolute value of [a] and absolute value of [b]. *)
let abs_gcd a b = gcd (abs a) (abs b)

(** Simplifies the fraction [n]/[d]. *)
let simplify n d =
  if d = 0 then assert false
  else
    let divisor = abs_gcd n d * sign d in
    (n / divisor, d / divisor)

let make n d =
  if d = 0 then None
  else Some (simplify n d)

let make_exn n d =
  if d = 0 then failwith "Denominator is 0."
  else simplify n d

let numerator (n, _) = n
let denominator (_, d) = d
let to_string (n, d) = Printf.sprintf "%d/%d" n d
let to_float (n, d) = Float.(of_int n / of_int d)

let add (n1, d1) (n2, d2) = simplify (n1 * d2 + n2 * d1) (d1 * d2)
let mul (n1, d1) (n2, d2) = simplify (n1 * n2) (d1 * d2)
