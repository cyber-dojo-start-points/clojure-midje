
lambda { |stdout,stderr,status|
  output = stdout + stderr
  return :red if /^FAILURE: .* failed./.match(output)

  # load-facts runs any clojure.test deftest alongside the midje checkables and
  # reports them in a section of their own, which the midje summary above says
  # nothing about. A learner who writes deftest and is, rather than midje's
  # arrow, has their failures counted only here.
  if match = /^(\d+) failures, (\d+) errors\./.match(output)
    return :red if match[1] != '0' || match[2] != '0'
  end

  return :green if /^All checks .* succeeded./.match(output)
  return :amber
}
