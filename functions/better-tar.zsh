if hash pbzip2 2>/dev/null; then
  alias btar='COPY_EXTENDED_ATTRIBUTES_DISABLE=true COPYFILE_DISABLE=true tar --exclude="._*" --exclude="typo3temp/Cache" --exclude=".DS_Store" --exclude="*.bak" --exclude="*~" --exclude="*.old" --exclude="Thumbs.db" --use-compress-program=pbzip2 $*'
  alias btar-prod='COPY_EXTENDED_ATTRIBUTES_DISABLE=true COPYFILE_DISABLE=true tar --exclude="._*" --exclude="typo3temp/Cache" --exclude=".svn" --exclude=".DS_Store" --exclude="*.bak" --exclude="*~" --exclude=".git" --exclude="*.old" --exclude="Thumbs.db" --use-compress-program=pbzip2 $*'
elif hash pigz 2>/dev/null; then
  alias btar='COPY_EXTENDED_ATTRIBUTES_DISABLE=true COPYFILE_DISABLE=true tar --exclude="._*" --exclude="typo3temp/Cache" --exclude=".DS_Store" --exclude="*.bak" --exclude="*~" --exclude="*.old" --exclude="Thumbs.db" --use-compress-program=pigz $*'
  alias btar-prod='COPY_EXTENDED_ATTRIBUTES_DISABLE=true COPYFILE_DISABLE=true tar --exclude="._*" --exclude="typo3temp/Cache" --exclude=".svn" --exclude=".DS_Store" --exclude="*.bak" --exclude="*~" --exclude=".git" --exclude="*.old" --exclude="Thumbs.db" --use-compress-program=pigz $*'
else
  alias btar='COPY_EXTENDED_ATTRIBUTES_DISABLE=true COPYFILE_DISABLE=true tar --exclude="._*" --exclude="typo3temp/Cache" --exclude=".DS_Store" --exclude="*.bak" --exclude="*~" --exclude="*.old" --exclude="Thumbs.db" -z $*'
  alias btar-prod='COPY_EXTENDED_ATTRIBUTES_DISABLE=true COPYFILE_DISABLE=true tar --exclude="._*" --exclude="typo3temp/Cache" --exclude=".svn" --exclude=".DS_Store" --exclude="*.bak" --exclude="*~" --exclude=".git" --exclude="*.old" --exclude="Thumbs.db" -z $*'
fi
