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
  --enable-decoder=aac*,alac,flac,mp4,opus,vorbis,wavpack,mp3
  --enable-encoder=aac*,alac,flac,mp4,wavpack,mp3
  --enable-decoder=pcm_f32le,pcm_f32be,pcm_f64le,pcm_f64be,pcm_s16be,pcm_s16be_planar,pcm_s16le,pcm_s16le_planar,pcm_s24be,pcm_s24le,pcm_s24le_planar,pcm_s32be,pcm_s32le,pcm_s32le_planar,pcm_s8,pcm_s8_planar,pcm_u16be,pcm_u16le,pcm_u24be,pcm_u24le,pcm_u32be,pcm_u32le,pcm_u8
  --enable-encoder=pcm_f32le,pcm_f32be,pcm_f64le,pcm_f64be,pcm_s16be,pcm_s16be_planar,pcm_s16le,pcm_s16le_planar,pcm_s24be,pcm_s24le,pcm_s24le_planar,pcm_s32be,pcm_s32le,pcm_s32le_planar,pcm_s8,pcm_s8_planar,pcm_u16be,pcm_u16le,pcm_u24be,pcm_u24le,pcm_u32be,pcm_u32le,pcm_u8
  --enable-muxer=fifo,flv,mp3,mp4,mov,m4v,matroska,ogg,oga,opus,wav,ipod,pcm_f32le,flac
  --enable-demuxer=fifo,flv,mp3,mp4,mov,m4v,matroska,ogg,oga,opus,wav,ipod,aac,pcm_f32le,flac
  --enable-filter=acompressor,acopy,anull,format,aformat,null,transpose,trim,acue,acrossfade,acrossover,atempo,adelay,adenorm,loudnorm,aemphasis,afade,afreqshift,aloop,amerge,amix,aresample,asplit,atrim
  --enable-filter=channelmap,channelsplit,chorus,crossfeed,dynaudnorm,equalizer,silencedetect,silenceremove,speechnorm,volume
  --enable-gpl            # required by x264
  --enable-nonfree        # required by fdk-aac
  --enable-zlib           # enable zlib
  --enable-libwavpack     # enable libwavpack
  --enable-libmp3lame     # enable libmp3lame
  --enable-libvorbis      # enable libvorbis
  --enable-libopus        # enable opus
#  --enable-libfdk-aac     # disable libfdk-aac, use ffmpeg built-in aac codec
)
echo "FFMPEG_CONFIG_FLAGS=${FLAGS[@]}"
emconfigure ./configure "${FLAGS[@]}"
