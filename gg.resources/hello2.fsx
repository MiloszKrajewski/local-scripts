#r "nuget:Newtonsoft.Json,13.0.1"
#load "./helpers.fsx"

open System
open Newtonsoft.Json

let serialize payload = JsonConvert.SerializeObject(payload)

{| Verb = "Hello"; Noun = "World"; Value = Helpers.method () |} 
|> serialize 
|> printfn "%s"

fsi.CommandLineArgs 
|> Array.skip 1
|> serialize 
|> printfn "%s"
