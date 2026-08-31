
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
# The JVM replays a class-data archive the image dumped at build time, which is
# most of what it would otherwise spend its time doing: a fresh container loads
# lein's, clojure's and midje's classes from the jars again. The two compiler
# flags are lein's own defaults, repeated because naming LEIN_JVM_OPTS replaces
# them rather than adding to them. cds logging is off because a JVM that cannot
# use an archive says so on stdout, and that belongs in a build log rather than
# in front of whoever is doing the kata. Nothing is lost when an archive cannot
# be used; the run is only slower.
readonly JVM_OPTS='-XX:+TieredCompilation -XX:TieredStopAtLevel=1 -XX:SharedArchiveFile=/.lein/lein.jsa -Xlog:cds*=off'

# Neither MIDJE_COLORIZE=false nor NO_COLOR=1 fully suppresses ANSI escape
# codes from the colorize and io.aviso/pretty libraries used by Midje 1.10.10.
# Strip them from stdout here, preserving lein's exit code via PIPESTATUS.
LEIN_JVM_OPTS="${JVM_OPTS}" lein midje | sed 's/\x1b\[[0-9;]*[a-zA-Z]//g'
exit "${PIPESTATUS[0]}"
