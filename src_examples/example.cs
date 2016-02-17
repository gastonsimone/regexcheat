using System.Text.RegularExpressions;

string text;

// Extract subject
Regex re = new Regex("^Subject: (.*)",
		RegexOptions.IgnoreCase);
Match m = re.Match(text);

if (m.Success) {
	subject = m.Groups(1).Value;
}

// Insert prefix
Regex re = new Regex("^(.*)$");
re.Replace(text, ">> ${1}");
