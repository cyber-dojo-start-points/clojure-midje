
# --------------------------------------------------------------
# Text files under /sandbox are automatically returned...
source ~/cyber_dojo_fs_cleaners.sh
function cyber_dojo_exit()
{
  # 2. Remove text dirs/files we don't want returned.
  # The test run creates no files of its own, so there is nothing to remove.
  # Name dirs or files in the calls below when yours does.
  #cyber_dojo_delete_dirs target
  #cyber_dojo_delete_files ...
  true
}
trap cyber_dojo_exit EXIT SIGTERM
# --------------------------------------------------------------

# The facts are checked on a JVM started here rather than through lein. lein's
# only job in a kata would be to work out the classpath, and the image worked
# that out when it was built and wrote it to /.classpath; starting lein to ask
# for it again costs more than checking the facts does.
#
# Loading midje means clojure reading its source and compiling it, which a fresh
# container would do again on every run. The image holds midje compiled already,
# and an archive of the classes that loading it needs. Nothing is lost when that
# archive is missing or unusable; the run is only slower.
JVM_OPTS=()
JVM_OPTS+=(-XX:+TieredCompilation)             # tiered JIT, so a tier can be named
JVM_OPTS+=(-XX:TieredStopAtLevel=1)            # a run is milliseconds; later tiers never repay
JVM_OPTS+=(-XX:SharedArchiveFile=/.midje.jsa)  # replay the archive the image dumped
JVM_OPTS+=('-Xlog:cds*=off')                   # an unusable archive says so, on stdout
JVM_OPTS+=(-Dmidje.pretty-print=false)         # print a load failure's message, not a page of frames
readonly JVM_OPTS

# Facts are checked wherever they are written, in subdirectories as well as
# beside this file, so the glob is recursive. A file in a subdirectory declares
# the namespace its path spells: roman/numerals_test.clj declares
# roman.numerals-test, because the kata's own directory is the root of the
# classpath. A namespace that does not match its path is reported as a load
# failure, naming what could not be found.
#
# run_fact_files.clj is given every one of those files and checks the ones
# declaring a namespace, which is how project.clj drops out.
shopt -s globstar

# The kata's own directory goes last on the classpath. That is where this run's
# source and fact files are, and a JVM replaying an archive needs a classpath
# beginning with the one the archive was dumped from.
#
# Neither MIDJE_COLORIZE=false nor NO_COLOR=1 fully suppresses ANSI escape
# codes from the colorize and io.aviso/pretty libraries used by Midje 1.10.10.
# Strip them from stdout here, preserving the exit status via PIPESTATUS.
java "${JVM_OPTS[@]}" -cp "$(cat /.classpath):." \
  clojure.main /run_fact_files.clj **/*.clj | sed 's/\x1b\[[0-9;]*[a-zA-Z]//g'
exit "${PIPESTATUS[0]}"
