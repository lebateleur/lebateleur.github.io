function hfun_bar(vname)
  val = Meta.parse(vname[1])
  return round(sqrt(val), digits=2)
end

function hfun_m1fill(vname)
  var = vname[1]
  return pagevar("index", var)
end

function lx_baz(com, _)
  # keep this first line
  brace_content = Franklin.content(com.braces[1]) # input string
  # do whatever you want here
  return uppercase(brace_content)
end


function hfun_blogposts()
    list = readdir("posts")
    filter!(f -> endswith(f, ".md"), list)
    dates = [stat(joinpath("posts", f)).mtime for f in list]
    perm = sortperm(dates)
    idxs = perm[1:min(3, length(perm))+1]
    io = IOBuffer()
    write(io, "<ul>")
    for (i, post) in enumerate(list[idxs])
    
      ps  = splitext(post)[1]
      write(io, "<li>")
      url = "/posts/$ps/"
      surl = strip(url, '/')
      titlepost = pagevar(surl, :title)
      dateofpost = pagevar(surl, :published)
      description = pagevar(surl, :rss)

      write(io, """<b><a href="$url">$titlepost</a></b> &nbsp; <i> ($dateofpost) </i><br>""")
      #write(io, """$description""")
    end
    write(io, "</ul>")
    return String(take!(io))
end


