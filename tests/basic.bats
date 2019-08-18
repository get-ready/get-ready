@test "docker not installed yet" {
  run ./get-ready.sh
  [ "$status" -eq 127 ]
  [[ "$output" == *docker* ]]
  run ./get-ready.sh stop
  [ "$status" -eq 127 ]
  [[ "$output" == *docker* ]]
}