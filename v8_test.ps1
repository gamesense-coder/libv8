if ( -not ( Test-Path -Path "$PSScriptRoot\v8" ) ) {
    Write-Error "v8 not found"
    Exit 1
}

g++ -I"${dir}\v8" -I"${dir}\v8\include" \
    "${dir}\v8\samples\hello-world.cc" -o hello_world.exe \
    -lv8_monolith -L"$dir" -L"${dir}\v8\out\release\obj" \
    -pthread -std=c++17 -ldl -DV8_COMPRESS_POINTERS

Invoke-Expression -Command ".\hello_world.exe"
