#!/bin/bash

STYLES=(
  "Bold Italic"
  "Bold"
  "ExtraBold Italic"
  "ExtraBold"
  "Italic"
  "Medium"
  "Regular"
)

LIGATURES="Ligatures" # NoLigatures|Ligatures
for STYLE in "${STYLES[@]}"
do
  wget "https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/$LIGATURES/${STYLE/ /}/complete/JetBrains%20Mono%20NL%20${STYLE/ /%20}%20Nerd%20Font%20Complete%20Mono.ttf"
done
