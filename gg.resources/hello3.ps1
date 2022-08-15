param ([int] $value = 1337)

$data = @{ "Verb" = "Hello"; "Noun" = "World"; "Value" = $value }
Write-Host $(ConvertTo-Json $data)
Write-Host $args 
