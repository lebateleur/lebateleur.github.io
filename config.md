<!--
Add here global page variables to use throughout your website.
-->
+++
author = "Robin Piedeleu"
mintoclevel = 2

# Add here files or directories that should be ignored by Franklin, otherwise
# these files might be copied and, if markdown, processed by Franklin which
# you might not want. Indicate directories by ending the name with a `/`.
# Base files such as LICENSE.md and README.md are ignored by default.
ignore = ["node_modules/"]

# RSS (the website_{title, descr, url} must be defined to get RSS)
generate_rss = true
website_title = "Robin Piedeleu"
website_descr = "Robin Piedeleu's academic webpage"
website_url   = "https://piedeleu.com"
+++

<!--
Add here global latex commands to use throughout your pages.
-->
\newcommand{\R}{\mathbb R}

\newcommand{\figenv}[2]{~~~<img src="!#1" style="padding:0;display:inline;width:#2;vertical-align:middle;" alt=""/>~~~}

\newcommand{\figinline}[2]{~~~<img src="!#1" style="padding:0;display:inline;width:#2;vertical-align:top;" alt=""/>~~~}

\newcommand{\styletext}[2]{~~~<span style="#1">#2</span>~~~}

