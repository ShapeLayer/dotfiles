rem This script is written for Windows environment for adjust and configure configurations.
rem At batch environments, use run.sh

set INSTANCE_NAME="minecraft-server"
set SERVER_NAME="failed-aimless-gamers"
set HOST_DATA_CONN_PATH=./

rem Configs that depends on host spec
set INSTANCE_MEMORY_LIMIT=10g
set INSTANCE_MEMORY_RESERVATION=1g
set MINECRAFT_MIN_MEMORY=1g
set MINECRAFT_MAX_MEMORY=8g
set MINECRAFT_VIEW_DISTANCE=10

rem Minecraft server side
set MINECRAFT_JAVA_ARGS="-d64 -server -Xms%MINECRAFT_MIN_MEMORY -Xmx%MINECRAFT_MAX_MEMORY -XX:+AggressiveOpts -XX:ParallelGCThreads=3 -XX:+UseConcMarkSweepGC -XX:+UnlockExperimentalVMOptions -XX:+UseParNewGC -XX:+ExplicitGCInvokesConcurrent -XX:MaxGCPauseMillis=10 -XX:GCPauseIntervalMillis=50 -XX:+UseFastAccessorMethods -XX:+OptimizeStringConcat -XX:NewSize=84m -XX:+UseAdaptiveGCBoundary -XX:NewRatio=3 -Dfml.readTimeout=90 -Dfml.queryResult=confirm"
set MINECRAFT_RUNNER_TYPE=VANILLA
set MINECRAFT_PORT=25565
set MINECRAFT_ENABLE_RCON=false

rem Ingame
set MINECRAFT_DIFFICULTY=normal
set MINECRAFT_DEFAULT_GAMEMODE=survival
set MINECRAFT_ANNOUNCE_PLAYER_ACHIEVEMENTS=true
set MINECRAFT_ENABLE_COMMAND_BLOCK=false
set MINECRAFT_ALLOW_NETHER=true
set MINECRAFT_GENERATE_STRUCTURES=true
set MINECRAFT_MAX_BUILD_HEIGHT=256
set MINECRAFT_SPAWN_ANIMALS=true
set MINECRAFT_SPAWN_MONSTERS=true
set MINECRAFT_SPAWN_NPCS=true

rem Auto defined using other definitions
set INSTANCE_PUBLISH_PORT="%MINECRAFT_PORT%:%MINECRAFT_PORT%"
set MINECRAFT_MOTD=%SERVER_NAME%

rem Pre-start Minecraft server

if not exist %HOST_DATA_CONN_PATH%/instance mkdir %HOST_DATA_CONN_PATH%/instance

rem Start Minecraft server
podman run -it --name %INSTANCE_NAME% ^
  --volume %HOST_DATA_CONN_PATH%/instance:/data ^
  --publish %INSTANCE_PUBLISH_PORT% ^
  --memory=%INSTANCE_MEMORY_LIMIT% ^
  --memory-reservation=%INSTANCE_MEMORY_RESERVATION% ^
  --restart=on-failure:3 ^
  -e INIT_MEMORY=%MINECRAFT_MIN_MEMORY% ^
  -e MIN_RAM=%MINECRAFT_MIN_MEMORY% ^
  -e MAX_MEMORY=%MINECRAFT_MAX_MEMORY% ^
  -e MAX_RAM=%MINECRAFT_MAX_MEMORY% ^
  -e JAVA_ARGS=%MINECRAFT_JAVA_ARGS% ^
  -e TYPE=%MINECRAFT_RUNNER_TYPE% ^
  -e SERVER_PORT=%SERVER_PORT% ^
  -e EULA=true ^
  -e OVERRIDE_SERVER_PROPERTIES=true ^
  -e SERVER_NAME=%SERVER_NAME% ^
  -e TZ='Asia/Seoul' ^
  -e MOTD=%MINECRAFT_MOTD% ^
  -e DIFFICULTY=%MINECRAFT_DIFFICULTY% ^
  -e MODE=%MINECRAFT_DEFAULT_GAMEMODE% ^
  -e PVP=true ^
  -e HARDCORE=false ^
  -e MAX_TICK_TIME=-1 ^
  -e VIEW_DISTANCE=%MINECRAFT_VIEW_DISTANCE% ^
  -e SNOOPER_ENABLED=false ^
  -e ALLOW_FLIGHT=true ^
  -e ANNOUNCE_PLAYER_ACHIEVEMENTS=%MINECRAFT_ANNOUNCE_PLAYER_ACHIEVEMENTS% ^
  -e ENABLE_COMMAND_BLOCK=%MINECRAFT_ENABLE_COMMAND_BLOCK% ^
  -e ALLOW_NETHER=%MINECRAFT_ALLOW_NETHER% ^
  -e GENERATE_STRUCTURES=%MINECRAFT_GENERATE_STRUCTURES% ^
  -e MAX_BUILD_HEIGHT=%MINECRAFT_MAX_BUILD_HEIGHT% ^
  -e SPAWN_ANIMALS=%MINECRAFT_SPAWN_ANIMALS% ^
  -e SPAWN_MONSTERS=%MINECRAFT_SPAWN_MONSTERS% ^
  -e SPAWN_NPCS=%MINECRAFT_SPAWN_NPCS% ^
  -e LEVEL=world ^
  itzg/minecraft-server:latest
