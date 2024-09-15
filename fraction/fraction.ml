open Base

type t = int * int

let rec gcd a b =
  if a = 0 then b
  else if b = 0 then a
  else gcd (b % a) a

let sign x =
  if x < 0 then -1 else 1

let abs x = x * sign x

let abs_gcd a b = gcd (abs a) (abs b)

let simplify n d =
  if d = 0 then assert false
  else
    let divisor = abs_gcd n d in
    (abs n / divisor * sign n * sign d, abs d / divisor)

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
