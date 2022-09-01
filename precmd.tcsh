setenv TGIT_BRANCH "sh -c 'git branch --show-current 2> /dev/null'"
setenv TGIT_LEFT "sh -c 'git branch --show-current > /dev/null 2>&1 && echo ":"'"
setenv TGIT_RIGHT "sh -c 'git branch --show-current > /dev/null 2>&1 && echo ":"'"
setenv TGIT_CLEAN "sh -c 'git branch --show-current > /dev/null 2>&1 && (git diff --quiet --exit-code 2> /dev/null || echo \\\\!)'"

set prompt = "%{\e]2;%n@%m: %~ `$TGIT_LEFT``$TGIT_CLEAN``$TGIT_BRANCH``$TGIT_RIGHT`\a%}%S%{\033[0;33m%}%n@%m %#%{\033[1;36m%} "
