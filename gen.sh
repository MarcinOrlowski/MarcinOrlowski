#!/bin/bash

# Generates README.md markdown

function genStatsCard() {
	local -r username="MarcinOrlowski"

	local params=(
		"username=${username}"
		"show_icons=true"
		"theme=onedark"
		"count_private=true"
		"hide_border=true"
		"bg_color=90,282c34,1f292e"
	)

	local -r joined="$(echo -n "${params[*]}" | sed  's/ /\&/g')"
	echo "![${username}'s stats](https://github-readme-stats.vercel.app/api/?${joined})"
}

function genRepoCard() {
	local -r repo="${1:-REPO}"
	local -r username="MarcinOrlowski"

	local params=(
		"username=${username}"
		"repo=${repo}"
		"theme=default"
		"hide_border=true"
		"title_color=87c9c3"
		"text_color=62696d"
		"icon_color=636a6d"
		"bg_color=30393e"
	)

	local -r joined="$(echo -n "${params[*]}" | sed  's/ /\&/g')"
	local -r url="https://github.com/${username}/${repo}"
	echo "[![${repo}](https://github-readme-stats.vercel.app/api/pin/?${joined})](${url})"
}

# -----

genStatsCard
echo

declare -r repos=(
	"laravel-api-response-builder"
	"Fonty"
	"Mp3VoiceStamp"
	"DateTimeTemplate"
	"weekday-plasmoid"
	"octoprint-monitor"
)

for repo in ${repos[*]}; do
	genRepoCard "${repo}"
done

