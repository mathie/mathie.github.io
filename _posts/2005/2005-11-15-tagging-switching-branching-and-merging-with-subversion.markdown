---
layout: post
status: publish
published: true
title: Tagging, switching, branching and merging with subversion
author: Graeme Mathieson
author_login: mathie
author_email: mathie@woss.name
author_url: http://woss.name/
date: 2005-11-15 18:33:41.000000000 +00:00
categories:
- Geekery
- Work
tags: []
comments: []
---
I've spent too long typing out long, laborious commands with <a href="http://subversion.tigris.org/">Subversion</a> to do various operations, and having to look up the documentation each time I do tag/branch related commands, so I spent a wee while this afternoon tidying up my shell shortcuts and adding to them.  All of these commands assume that you are currently sitting in a checked out working copy of the code you're dealing with, and that you follow the regular naming scheme for projects inside your svn repository (ie for <code>project</code>, <code>project/trunk</code><code> is the mainline development, </code><code>project/tags</code> contains all your tags and <code>project/branches</code> contains all your branches).

[code]_svn_project_root()
{
    echo `svn info |awk '/^URL: / {sub( /\/(tags|branches|trunk).*$/, "", $2); print $2}'`
}

_svn_wc_root()
{
    echo `svn info|awk '/^URL: / {print $2}'`
}

svn_switch() { svn switch $(_svn_project_root)/$1; }
alias svn_switch_trunk="svn_switch trunk"
svn_switch_branch() { svn_switch branches/$1; }
svn_switch_tag() { svn_switch tags/$1; }

svn_ls_branches() { svn ls $(_svn_project_root)/branches; }
svn_ls_tags() { svn ls $(_svn_project_root)/tags; }

_svn_merge_to_here() { svn merge $(_svn_wc_root) $(_svn_project_root)/$1 ; }
svn_merge_head_to_here() { _svn_merge_to_here trunk; }
svn_merge_branch_to_here() { _svn_merge_to_here branches/$1; }
svn_merge_tag_to_here() { _svn_merge_to_here tags/$1; }
svn_merge_to_wc() { svn merge $(_svn_project_root)/$1 $(_svn_project_root)/$2 ; }

svn_tag() { svn cp $(_svn_wc_root) $(_svn_project_root)/tags/$1; }
svn_branch() { svn cp $(_svn_wc_root) $(_svn_project_root)/branches/$1; }

svn_what()
{
 _svn_wc_root | awk -F/ \
    ' /trunk$/              { print $(NF-1), "(trunk)" } \
      /\/branches\/[^\/]+$/ { print $(NF-2), "(" $NF, "branch)" } \
      /\/tags\/[^\/]+$/     { print $(NF-2), "(" $NF, "tag)" }'
}[/code]


The ones beginning with an <code>_</code> are just helpers -- not really intended to be called directly.  The <code>svn_switch_*</code> functions will switch your current working copy to a particular branch, tag, or back to the trunk. <code>svn_ls_*</code> will list all the branches or tags for a particular project.  <code>svn_merge_*</code> I'm not so sure about the usefulness of, but I added them anyway.  I suspect that I need to revisit them after working with merging branches in anger.  <code>svn_what</code> is just a handy wee function to tell you what your checked out copy actually is (the name of the project, and whether it's trunk code, a branch or a tag).  <code>svn_tag</code> and <code>svn_branch</code> will create branches and tags for you.
