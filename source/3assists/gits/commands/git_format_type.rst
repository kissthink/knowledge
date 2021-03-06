.. _git_format_type:

git中format的格式列表
##########################

The placeholders are::

    :%H: commit hash
    %h: abbreviated commit hash
    %T: tree hash
    %t: abbreviated tree hash
    %P: parent hashes
    %p: abbreviated parent hashes
    %an: author name
    %aN: author name (respecting .mailmap, see git-shortlog(1) or git-blame(1))
    %ae: author email
    %aE: author email (respecting .mailmap, see git-shortlog(1) or git-blame(1))
    %ad: author date (format respects --date= option)
    %aD: author date, RFC2822 style
    %ar: author date, relative
    %at: author date, UNIX timestamp
    %ai: author date, ISO 8601 format
    %cn: committer name
    %cN: committer name (respecting .mailmap, see git-shortlog(1) or git-blame(1))
    %ce: committer email
    %cE: committer email (respecting .mailmap, see git-shortlog(1) or git-blame(1))
    %cd: committer date
    %cD: committer date, RFC2822 style
    %cr: committer date, relative
    %ct: committer date, UNIX timestamp
    %ci: committer date, ISO 8601 format
    %d: ref names, like the --decorate option of git-log(1)
    %e: encoding
    %s: subject
    %f: sanitized subject line, suitable for a filename
    %b: body
    %B: raw body (unwrapped subject and body)
    %N: commit notes
    %gD: reflog selector, e.g., refs/stash@{1}
    %gd: shortened reflog selector, e.g., stash@{1}
    %gn: reflog identity name
    %gN: reflog identity name (respecting .mailmap, see git-shortlog(1) or git-blame(1))
    %ge: reflog identity email
    %gE: reflog identity email (respecting .mailmap, see git-shortlog(1) or git-blame(1))
    %gs: reflog subject
    %Cred: switch color to red
    %Cgreen: switch color to green
    %Cblue: switch color to blue
    %Creset: Reset color
    %C(…): color specification, as described in color.branch.* config option
    %m: left, right or boundary mark
    %n: newline
    %%: a raw %
    %x00: print a byte from a hex code
    %w([<w>[,<i1>[,<i2>]]]): switch line wrapping, like the -w option of git-shortlog(1).
    %H: commit hash
    %h: abbreviated commit hash
    %T: tree hash
    %t: abbreviated tree hash
    %P: parent hashes
    %p: abbreviated parent hashes
    %an: author name
    %aN: author name (respecting .mailmap, see git-shortlog(1) or git-blame(1))
    %ae: author email
    %aE: author email (respecting .mailmap, see git-shortlog(1) or git-blame(1))
    %ad: author date (format respects --date= option)
    %aD: author date, RFC2822 style
    %ar: author date, relative
    %at: author date, UNIX timestamp
    %ai: author date, ISO 8601 format
    %cn: committer name
    %cN: committer name (respecting .mailmap, see git-shortlog(1) or git-blame(1))
    %ce: committer email
    %cE: committer email (respecting .mailmap, see git-shortlog(1) or git-blame(1))
    %cd: committer date
    %cD: committer date, RFC2822 style
    %cr: committer date, relative
    %ct: committer date, UNIX timestamp
    %ci: committer date, ISO 8601 format
    %d: ref names, like the --decorate option of git-log(1)
    %e: encoding
    %s: subject
    %f: sanitized subject line, suitable for a filename
    %b: body
    %B: raw body (unwrapped subject and body)
    %N: commit notes
    %gD: reflog selector, e.g., refs/stash@{1}
    %gd: shortened reflog selector, e.g., stash@{1}
    %gn: reflog identity name
    %gN: reflog identity name (respecting .mailmap, see git-shortlog(1) or git-blame(1))
    %ge: reflog identity email
    %gE: reflog identity email (respecting .mailmap, see git-shortlog(1) or git-blame(1))
    %gs: reflog subject
    %Cred: switch color to red
    %Cgreen: switch color to green
    %Cblue: switch color to blue
    %Creset: reset color
    %C(…): color specification, as described in color.branch.* config option
    %m: left, right or boundary mark
    %n: newline
    %%: a raw %
    %x00: print a byte from a hex code
    %w([<w>[,<i1>[,<i2>]]]): switch line wrapping, like the -w option of git-shortlog(1).
