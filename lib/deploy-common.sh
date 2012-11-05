dest_dir="$HOME"
reposname="${PWD##*/}"

clean_find () {
	find "$@" \
		\! \( -type d -iname .svn -prune \) \
		\! \( -type d -iname .git -prune \) \
		\! \( -type d -iname CVS -prune \) \
		-type f \
		\! -name '*~' \
		\! -name '.*~' \
		\! -name '*#' \
		\! -name '.*#' \
		\! -iname '*.bak' \
		\! -iname '*.orig' \
		-print
}
sanity_check () {
	local project="$1"
	if [ -e "$project/.nodeploy" ] ; then
		>&2 echo "$0: not processing '$project': '$project/.nodeploy' exists."
		exit 1
	elif [ ! -d "$project" ] ; then
		>&2 echo "$0: not processing '$project': is not a directory."
		exit 1
	fi
}
require_arguments () {
	if [ $# -lt 1 ] ; then
		>&2 echo "$0: No arguments specified.  Type '$0 -h' for help."
		exit 1
	fi
}
require_in_git_repos () {
	if [ ! -d .git ] ; then
		>&2 echo "$0: must be used in root directory of a git repos."
		exit 1
	fi
}
foreach_project_file_in () {
	local project="$1"; shift
	local function_to_run="$1"; shift
	local filename
	local src
	local dest
	clean_find "$project" | while read filename ; do
		filename="${filename##$project/}" # remove <project>/ prefix
		dest="$dest_dir/$filename"
		src="$PWD/$project/$filename"
		"$function_to_run" "$filename" "$src" "$dest" "$@"
	done
}
belongs_to_us () {
	local link="$1"
	local dest="$(readlink "$link")"
	[[ "$dest" = */"$reposname"/* ]]
}
_run_ () {
	if (( $dryrun )) ; then
		>&2 echo "+++ $@"
	else
		(( $verbose )) && >&2 echo "+++ $@"
		"$@"
	fi
}
