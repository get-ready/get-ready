@test "starting and stopping project image" {
  mkdir -p /root/.config/get-ready/default && echo "FROM ubuntu" >> /root/.config/get-ready/default/Dockerfile
  run ./get-ready.sh
  [ "$status" -eq 0 ]
  [[ "$output" == *"Environment started."* ]]
  run ./get-ready.sh stop
  [ "$status" -eq 0 ]
  [[ "$output" == *"Environment stopped."* ]]
}