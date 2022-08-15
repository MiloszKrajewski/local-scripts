#r "nuget:Newtonsoft.Json,13.0.1"
#load "./helpers.csx"

using System;
using Newtonsoft.Json;

string Serialize(object payload) => JsonConvert.SerializeObject(payload);

Console.WriteLine(Serialize(new { Verb = "Hello", Noun = "World", Value = Method() }));

Console.WriteLine(Serialize(Args));