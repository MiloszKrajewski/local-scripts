using System.Text.Json;
using SimpleExec;

Console.WriteLine(JsonSerializer.Serialize(new { Noun = "Hello", Verb = "World", Value = 1337 }));
Console.WriteLine(JsonSerializer.Serialize(args));

Command.Run("cmd", "/c dir");