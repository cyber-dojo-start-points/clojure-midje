
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
lein midje
