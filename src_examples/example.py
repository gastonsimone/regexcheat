import re

r = re.compile("^Subject: (.*)",
               re.IGNORECASE)
m = r.search(text);
if m:
    subject = m.group(1)
