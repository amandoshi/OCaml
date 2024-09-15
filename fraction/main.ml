open Base
open Stdio

let () =
  match Fraction.make 9 (-12) with
  | None -> ()
  | Some f ->
    f |> Fraction.to_string |> print_endline

let () =
  match Fraction.make 9 (-12) with
  | None -> ()
  | Some f ->
    f |> Fraction.to_float |> Float.to_string |> print_endline

let () =
  match Fraction.make (-50) 75 with
  | None -> ()
  | Some f ->
    let double_f = Fraction.add f f in
    let () = double_f |> Fraction.to_string |> print_endline in
    double_f |> Fraction.to_float
    |> Float.round_significant ~significant_digits:3
    |> Float.to_string |> print_endline

let () =
  let f1 = Fraction.make_exn 1 2 in
  let f2 = Fraction.make_exn (-1) 2 in
  Fraction.add f1 f2 |> Fraction.to_string |> print_endline

let () =
  let f = Fraction.make_exn (-3) 2 in
  Fraction.mul f f |> Fraction.to_string |> print_endline
