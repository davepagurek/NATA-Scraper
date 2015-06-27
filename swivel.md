# Unofficial Swivel command-line API

`Swivel file.swf`
Convert `file.swf` with the default settings

`Swivel file.swf -s 1280x720`
Set the output width and height

```
Swivel file.swf -vb 1.5m
Swivel file.swf -vb 256k
```
Set the video bitrate

```
Swivel file.swf -ab 1.5m
Swivel file.swf -ab 256k
```
Set the audio bitrate

```
Swivel file.swf -sm letterbox
Swivel file.swf -sm crop
Swivel file.swf -sm stretch
```
Set the video scale mode

```
Swivel file.swf -a none
Swivel file.swf -a swf
Swivel file.swf -a audio.mp3
```
Set the audio for the exported video (No audio, audio from the swf, or an external file)

`Swivel file.swf -o converted.mp4`
Set the output file

`Swivel file.swf -t`
Set transparent background

