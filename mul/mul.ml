open Base
open Stdio

let rec read_and_mul total =
  let line = In_channel.input_line In_channel.stdin in
  match line with
  | None -> total
  | Some x -> read_and_mul (total * Int.of_string x)

let () = printf "Total: %d\n" (read_and_mul 1)
