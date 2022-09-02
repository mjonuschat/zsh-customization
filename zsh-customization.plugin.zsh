0="${ZERO:-${${0:#$ZSH_ARGZERO}:-${(%):-%N}}}"
0="${${(M)0:#/*}:-$PWD/$0}"

source ${0:h}/functions/better-tar.zsh
source ${0:h}/functions/direnv.zsh
source ${0:h}/functions/editor.zsh
source ${0:h}/functions/ffmpeg.zsh
source ${0:h}/functions/lsd.zsh
source ${0:h}/functions/paths.zsh
source ${0:h}/functions/starship.zsh
source ${0:h}/functions/typo3.zsh
