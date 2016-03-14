function debugpull {
	local STRG=$1
	local filename=$2
	grep $STRG $filename
}
