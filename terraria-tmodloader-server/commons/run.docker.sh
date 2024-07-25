TMOD_AUTOSAVE_INTERVAL='15'
TMOD_MOTD='tModLoader Server'
TMOD_PASS='secret'
TMOD_MAXPLAYERS='16'
TMOD_WORLDNAME='Earth'
TMOD_WORLDSIZE='3'
TMOD_DIFFICULTY='2'

# Pull the image
docker pull jacobsmile/tmodloader1.4:latest

# Execute the container
docker run -p 7777:7777 --name tmodloader --rm \
  -v ./data:/data \
  -e TMOD_AUTOSAVE_INTERVAL=$TMOD_AUTOSAVE_INTERVAL \
  -e TMOD_MOTD="$TMOD_MOTD" \
  -e TMOD_PASS=$TMOD_PASS \
  -e TMOD_MAXPLAYERS=$TMOD_MAXPLAYERS \
  -e TMOD_WORLDNAME=$TMOD_WORLDNAME \
  -e TMOD_WORLDSIZE=$TMOD_WORLDSIZE \
  -e TMOD_DIFFICULTY=$TMOD_DIFFICULTY \
  jacobsmile/tmodloader1.4:latest
