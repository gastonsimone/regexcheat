# Highlight double words
# perl -w finddbl file.txt

# Chunk with dot-newline combination
$/ = ".\n"

while (<>) { # Put input "line" in $_
	next unless s{
		\b
		( \w+ ) (?# grab word in $1 and \1 )
		(?# Any number of spaces or <TAGS> )
		(
			(?:
				\s
				|
				<[^>]+>
			)+
		)
		(\1\b) (?# match the first word again)
	}
	{\e[7m$1\e[m$2\e[7m$3\e[m}igx;

	# Remove unmarked lines
	s/^(?:[^\e]*\n)+//mg;

	# Insert file name
	s/^/$ARGV: /mg;

	# Print $_
	print;
}
