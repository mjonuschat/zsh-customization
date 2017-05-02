function webify() {
  BASENAME=$(basename "$1")
  BASEDIR=$(dirname "$1")
  FILETYPE="${BASENAME##*.}"
  FILENAME="${BASENAME%.*}"

  WIDTH=${2:-640}
  HEIGHT=${3:-trunc(ow/a/2)*2}
  BITRATE=${4:-2M}
  FILTERS=${5:-",unsharp=5:5:1.0:5:5:0.0"} # ,yadif,unsharp=5:5:1.0:5:5:0.0

  # MP4/AAC Format
  # /usr/local/bin/ffmpeg -i "${BASEDIR}/${BASENAME}" -crf 21 -vf "scale=${WIDTH}:${HEIGHT}${FILTERS}" -pix_fmt yuv420p -channel_layout 2.0 -c:v libx264 -c:a libfaac -b:v ${BITRATE} -ar 22050 -b:a 96k -threads 0 -maxrate ${BITRATE} -bufsize ${BITRATE} -y -map_metadata -1 "${BASEDIR}/${FILENAME}-web.mp4"
  /usr/local/bin/ffmpeg -i "${BASEDIR}/${BASENAME}" -crf:v 21 -vf "scale=${WIDTH}:${HEIGHT}${FILTERS}" -pix_fmt yuv420p -channel_layout stereo -c:v libx264 -c:a libfdk_aac -b:v ${BITRATE} -ar 22050 -b:a 96k -cutoff 18000 -threads 0 -movflags faststart -maxrate ${BITRATE} -bufsize ${BITRATE} -y -map_metadata -1 "${BASEDIR}/${FILENAME}-web.mp4"
  # /usr/local/bin/qtfaststart "${BASEDIR}/${FILENAME}-web.mp4"

  # WEBM Format
  /usr/local/bin/ffmpeg -i "${BASEDIR}/${BASENAME}" -crf 23 -vf "scale=${WIDTH}:${HEIGHT}${FILTERS}" -pix_fmt yuv420p -channel_layout stereo -c:v libvpx -c:a libvorbis -b:v ${BITRATE} -ar 22050 -b:a 96k -threads 8 -maxrate ${BITRATE} -bufsize ${BITRATE} -y -cpu-used 0 -map_metadata -1 "${BASEDIR}/${FILENAME}-web.webm"

  # OGG Format
  /usr/local/bin/ffmpeg -i "${BASEDIR}/${BASENAME}" -crf 23 -vf "scale=${WIDTH}:${HEIGHT}${FILTERS}" -pix_fmt yuv420p -channel_layout stereo -c:v libtheora -c:a libvorbis -b:v ${BITRATE} -ar 22050 -b:a 96k -threads 0 -maxrate ${BITRATE} -bufsize ${BITRATE} -y -map_metadata -1 "${BASEDIR}/${FILENAME}-web.ogg"
}
