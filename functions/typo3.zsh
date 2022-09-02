# Run TYPO3 unit tests
function t3u() {
  phpunit -d memory_limit=-1 -c typo3/sysext/core/Build/UnitTests.xml $*
}

# Run TYPO3 functional tests
function t3f() {
  rm -rf typo3temp/functional-* typo3temp/var/tests/functional-*

  if [[ -n $* ]]; then
    phpunit -d memory_limit=-1 -c typo3/sysext/core/Build/FunctionalTests.xml $*
  else
    time find -L . -name '*Test.php' -path '*typo3/sysext/*/Tests/Functional*' | \
      grep -v 'typo3temp/var/tests/functional' | \
      parallel --halt-on-error 2 --jobs 8 'echo "" && echo "Running {}" && phpunit -d memory_limit=-1 -c typo3/sysext/core/Build/FunctionalTests.xml {}'
  fi
}

function psr2-format() {
  [[ -f Build/.php_cs ]] && git show --name-status|grep -E '^(A|M)\s+.*\.php$'|cut -f2|xargs -n1 php-cs-fixer fix --config=Build/.php_cs
}
