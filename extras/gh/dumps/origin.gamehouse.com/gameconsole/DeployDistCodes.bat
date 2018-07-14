pushd \\games-dl.stage.real.com\gameconsole
diff -s -w BundleFiles/Support/DistCodes_new.xml BundleFiles/Support/DistCodes.xml

REM ===  Check differences before approving copy

COPY /-Y \BundleFiles\Support\DistCodes_new.xml  \BundleFiles\Support\DistCodes.xml
popd
