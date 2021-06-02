#!/bin/bash

set -euo pipefail
source $(dirname $0)/var.sh

FLAGS=(
  "${FFMPEG_CONFIG_FLAGS_BASE[@]}"
  --disable-avdevice
  --disable-postproc
  --disable-everything
  --disable-swscale
  --disable-network
  --enable-protocol=file
  # --enable-gpl            # required by x264
  # --enable-nonfree        # required by fdk-aac
  # --enable-zlib           # enable zlib
  # --enable-libx264        # enable x264
  # --enable-libx265        # enable x265
  # --enable-libvpx         # enable libvpx / webm
  # --enable-libwavpack     # enable libwavpack
  # --enable-libmp3lame     # enable libmp3lame
  # --enable-libfdk-aac     # enable libfdk-aac
  # --enable-libtheora      # enable libtheora
  # --enable-libvorbis      # enable libvorbis
  # --enable-libfreetype    # enable freetype
  # --enable-libopus        # enable opus
  # --enable-libwebp        # enable libwebp
  # --enable-libass         # enable libass
  # --enable-libfribidi     # enable libfribidi
  # --enable-libaom         # enable libaom
  --enable-decoder=aac
  --enable-decoder=alac
  --enable-decoder=flac
  --enable-decoder=libmp3lame
  --enable-decoder=pcm_f32le
  --enable-decoder=pcm_f32be
  --enable-decoder=pcm_f64le
  --enable-decoder=pcm_f64be
  --enable-decoder=pcm_s16be
  --enable-decoder=pcm_s16be_planar
  --enable-decoder=pcm_s16le
  --enable-decoder=pcm_s16le_planar
  --enable-decoder=pcm_s24be
  --enable-decoder=pcm_s24le
  --enable-decoder=pcm_s24le_planar
  --enable-decoder=pcm_s32be
  --enable-decoder=pcm_s32le
  --enable-decoder=pcm_s32le_planar
  --enable-decoder=pcm_s8
  --enable-decoder=pcm_s8_planar
  --enable-decoder=pcm_u16be
  --enable-decoder=pcm_u16le
  --enable-decoder=pcm_u24be
  --enable-decoder=pcm_u24le
  --enable-decoder=pcm_u32be
  --enable-decoder=pcm_u32le
  --enable-decoder=pcm_u8
  # --enable-decoder=vorbis
  --enable-decoder=wavpack
  --enable-encoder=aac
  --enable-encoder=alac
  --enable-encoder=flac
  --enable-encoder=libmp3lame
  --enable-encoder=pcm_f32le
  --enable-encoder=pcm_f32be
  --enable-encoder=pcm_f64le
  --enable-encoder=pcm_f64be
  --enable-encoder=pcm_s16be
  --enable-encoder=pcm_s16be_planar
  --enable-encoder=pcm_s16le
  --enable-encoder=pcm_s16le_planar
  --enable-encoder=pcm_s24be
  --enable-encoder=pcm_s24le
  --enable-encoder=pcm_s24le_planar
  --enable-encoder=pcm_s32be
  --enable-encoder=pcm_s32le
  --enable-encoder=pcm_s32le_planar
  --enable-encoder=pcm_s8
  --enable-encoder=pcm_s8_planar
  --enable-encoder=pcm_u16be
  --enable-encoder=pcm_u16le
  --enable-encoder=pcm_u24be
  --enable-encoder=pcm_u24le
  --enable-encoder=pcm_u32be
  --enable-encoder=pcm_u32le
  --enable-encoder=pcm_u8
  --enable-encoder=vorbis
  --enable-encoder=wavpack

  --enable-muxer=f32be
  --enable-muxer=f32le
  --enable-muxer=f64be
  --enable-muxer=f64le
  --enable-muxer=fifo
  --enable-muxer=flv
  --enable-muxer=mp3
  --enable-muxer=mp4
  --enable-muxer=ogg
  --enable-muxer=oga
  --enable-muxer=opus
  --enable-muxer=wav
  --enable-demuxer=aac
  --enable-demuxer=ape
  --enable-demuxer=avi
  --enable-demuxer=f32be
  --enable-demuxer=f32le
  --enable-demuxer=f64be
  --enable-demuxer=f64le
  --enable-demuxer=flac
  --enable-demuxer=flv
  --enable-demuxer=mp4
  --enable-demuxer=m4a
  --enable-demuxer=mp3
  --enable-demuxer=mpeg
  --enable-demuxer=ogg
  --enable-demuxer=wav
  --enable-filter=acompressor
  --enable-filter=acopy
  --enable-filter=acue
  --enable-filter=acrossfade
  --enable-filter=acrossover
  --enable-filter=adeclick
  --enable-filter=adeclip
  --enable-filter=adelay
  --enable-filter=adenorm
  --enable-filter=aemphasis
  --enable-filter=aeval
  --enable-filter=afade
  --enable-filter=afftdn
  --enable-filter=aformat
  --enable-filter=agate
  --enable-filter=afreqshift
  --enable-filter=aloop
  --enable-filter=amerge
  --enable-filter=amix
  --enable-filter=anequalizer
  --enable-filter=apad
  --enable-filter=aresample
  --enable-filter=asplit
  --enable-filter=atrim
  --enable-filter=channelmap
  --enable-filter=channelsplit
  --enable-filter=chorus
  --enable-filter=crossfeed
  --enable-filter=drmeter
  --enable-filter=dynaudnorm
  --enable-filter=equalizer
  --enable-filter=silencedetect
  --enable-filter=silenceremove
  --enable-filter=speechnorm
  --enable-filter=volume
  --enable-gpl            # required by x264
  --enable-nonfree        # required by fdk-aac
  --enable-zlib           # enable zlib
  --enable-libwavpack     # enable libwavpack
  --enable-libtheora      # enable libtheora
  --enable-libvorbis      # enable libvorbis
  --enable-libopus        # enable opus
  --enable-libfdk-aac     # enable libfdk-aac
)
echo "FFMPEG_CONFIG_FLAGS=${FLAGS[@]}"
EM_PKG_CONFIG_PATH=${EM_PKG_CONFIG_PATH} emconfigure ./configure "${FLAGS[@]}"
