open Base
open Stdio

let col_width head body =
  let lengths l = List.map ~f:String.length l in
  let combine acc l = List.map2_exn ~f:Int.max acc (lengths l) in
  List.fold ~f:combine ~init:(lengths head) body

let render_sep widths =
  let dashes w = String.make w '-' in
  "+-" ^ String.concat ~sep:"-+-" (List.map ~f:dashes widths) ^ "-+\n"

let render_row widths row =
  let pad s width = s ^ (String.make (width - String.length s) ' ') in
  "| " ^ String.concat ~sep:" | " (List.map2_exn ~f:pad row widths) ^ " |\n"

let render_table head body =
  let widths = col_width head body in
  let sep = render_sep widths in
  let str_of_row = render_row widths in
  let head_str = str_of_row head in
  let body_str = String.concat (List.map ~f:str_of_row body) in
  sep ^ head_str ^ sep ^ body_str ^ sep

(* Test code. *)
let () = print_string
  (render_table
    ["Language";"Architect";"First Release"]
    [ ["Lisp" ;"John McCarthy" ;"1958"] ;
      ["C"    ;"Dennis Ritchie";"1969"] ;
      ["ML"   ;"Robin Milner"  ;"1973"] ;
      ["OCaml";"Xavier Leroy"  ;"1996"]])
