## Commands
* Start(at first): `run.sh`
* Start: `podman start minecraft-server`
* Stop: `podman stop minecraft-server`
* Logs: `podman logs -f minecraft-server`

Using console
* `podman exec minecraft-server rcon-cli 'command'`
* i.e. `podman exec minecraft-server rcon-cli '/gamerule disableRaids true'`
