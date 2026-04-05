
# --------------------------------------------------------------
# Text files under /sandbox are automatically returned...
source ~/cyber_dojo_fs_cleaners.sh
function cyber_dojo_exit()
{
  # 2. Remove text dirs/files we don't want returned.
  cyber_dojo_delete_dirs target # ...
  #cyber_dojo_delete_files ...
}
trap cyber_dojo_exit EXIT SIGTERM
# --------------------------------------------------------------

ln -sf /.lein ~/
ln -sf /.m2 ~/
# Neither MIDJE_COLORIZE=false nor NO_COLOR=1 fully suppresses ANSI escape
# codes from the colorize and io.aviso/pretty libraries used by Midje 1.10.10.
# Strip them from stdout here, preserving lein's exit code via PIPESTATUS.
lein midje | sed 's/\x1b\[[0-9;]*[a-zA-Z]//g'
exit "${PIPESTATUS[0]}"
