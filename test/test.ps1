$formats = @("wav","aac","mp4","mkv","flv","mov","avi")
foreach ($format in $formats) {
  $outfile = "test-muxing.$format"
  Echo "muxing to $outfile..."
  # muxing.exe writes to stderr, which powershell considers as a failure
  # so execute with cmd and redirect stderr within cmd to hide from powershell
  cmd /c ".\muxing.exe $outfile > nul 2>&1"
  if (!(Test-Path $outfile)) {
    Echo "test failed: output file $outfile not found"
    $host.SetShouldExit(1)
  }
}
