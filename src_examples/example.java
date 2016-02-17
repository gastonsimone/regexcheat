import java.util.regex.*;

String text;

// Extract subject
Pattern re = Pattern.compile("^Subject: (.*)",
		Pattern.CASE_INSENSITIVE);
Matcher m = re.matcher(text);

if (m.find()) {
	subject = m.group(1);
}

// Insert prefix
Pattern re = Pattern.compile("^(.*)$");
re.matcher(text).replaceAll(">> $1");
