(** Internal ratelimit route mapping. *)

open Core
open Async

(** Type for mapping route -> {!rl}. *)
module RouteMap : module type of Map.Make (String)

(** Type representing ratelimit information. *)
type rl = {limit: int; remaining: int; reset: int} [@@deriving sexp]

(** Type representing the specific case of {!RouteMap}. *)
type t = (rl, read_write) Mvar.t RouteMap.t

val get_rl :
     [`Get | `Delete | `Post | `Patch | `Put]
  -> string
  -> t
  -> (rl, read_write) Mvar.t * t

val rl_of_header : Cohttp.Header.t -> rl option
(** Converts Cohttp header data into ratelimit information.
    @return Some of ratelimit information or None on bad headers
*)

val default : rl
(** Default for type rl. Used for prepopulating routes. *)

val empty : t
(** Empty ratelimit route map. *)

val update : 'a RouteMap.t -> string -> f:('a option -> 'a) -> 'a RouteMap.t
(** Analogous to {!RouteMap.update}. *)

val find : 'a RouteMap.t -> string -> 'a option
(** Analogous to {!RouteMap.find}. *)

val find_exn : 'a RouteMap.t -> string -> 'a
(** Analogous to {!RouteMap.find_exn}. *)
