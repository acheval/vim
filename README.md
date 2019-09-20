::: {.off-canvas-wrap}
::: {.inner-wrap}
::: {.top-bar-underlay}
:::

::: {.row}
-   -   [Menu](#)

::: {.section .top-bar-section}
-   ::: {.row .collapse}
    ::: {.large-12 .columns}
    :::
    :::

<!-- -->

-   [Screencasts](/episodes)
-   [Articles](/blog)
-   [Categories](/categories)
-   [Training](/training)
-   [Publications](/publications)
-   [Subscribe](/subscribe)
:::
:::

::: {.section .left-small}
[]{.left-off-canvas-toggle .menu-icon}
:::

::: {.section .right .tab-bar-section}
:::

-   Vimcasts
-   [Screencasts](/episodes)
-   [Articles](/blog)
-   [Categories](/categories)
-   [Training](/training)
-   [Publications](/publications)
-   [Subscribe](/subscribe)
-   

::: {.section .main-section}
::: {.identity-row}
::: {#logo .logo}
[VimCasts.org](/ "Go to Vimcasts.org homepage")
===============================================
:::
:::

::: {.row}
::: {.small-12 .columns}
::: {.row .announcement-banner}
::: {.small-12 .column .show-for-small-only}
::: {.panel}
Learn Vim at your own pace with my self-study Core Vim Course.

[Learn more](/training/core-vim-course){.button .expand}
:::
:::

::: {.panel .show-for-medium-up .clearfix}
::: {.small-8 .column}
Learn Vim at your own pace with my self-study Core Vim Course.
:::

::: {.small-4 .column}
[Learn more](/training/core-vim-course){.button .expand}
:::
:::
:::
:::
:::

::: {.section .screencast}
::: {.title-row}
Synchronizing plugins with git submodules and pathogen {#synchronizing-plugins-with-git-submodules-and-pathogen .title}
------------------------------------------------------

[\#]{.small}27 {#section .episode_number}
--------------
:::

::: {.pubdate-row}
::: {.video-run-time}
Run time: 9:24
:::

::: {.hide-for-medium-up}
Oct 12, \'10
:::

::: {.show-for-medium-up}
Oct 12, 2010
:::
:::

::: {.summary-row}
::: {.episode_summary .enlarged swiftype-index="true"}
If you use Vim on muliple machines, it can be difficult to keep your
configuration files synchronized across them. One solution is to put
your dotfiles under version control. In this episode, I demonstrate how
to keep your vimrc and plugins synchronized using git submodules and the
pathogen plugin.
:::
:::

::: {.video-row}
::: {.video-column}
::: {.video_wrapper}
:::
:::

::: {.download-videos}
#### Download

-   [OGG](http://media.vimcasts.org/videos/27/sync_with_git.ogv) [18.5
    MB]{.stats}
-   [Quicktime](http://media.vimcasts.org/videos/27/sync_with_git.m4v)
    [21.6 MB]{.stats}
:::

::: {.video-metadata}
Run time: 9:24

[Read transcript](/transcripts/27/en/)
:::
:::

::: {.content-row}
[Shownotes[]{.disclosure}](#shownotes)

::: {#shownotes .content swiftype-index="true"}
Keep your dotfiles in git
-------------------------

The following instructions assume that your home directory contains a
`.vimrc` file, a `.vim` directory and a `.gvimrc` file (optional).

Move the `.vimrc` and `.gvimrc` files into the `.vim` directory:

``` {.highlight .plaintext}
mv .vimrc ~/.vim/vimrc
mv .gvimrc ~/.vim/gvimrc
```

Create symbolic links so that `~/.vimrc` points to the `~/.vim/vimrc`
file:

``` {.highlight .plaintext}
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc
```

Change to the `.vim` directory, and initialize it as a git repository:

``` {.highlight .plaintext}
cd ~/.vim
git init
```

Create a `README` file, and paste installation instructions into it (see
[example README](http://github.com/nelstrom/dotvim/raw/master/README)).

Add all files, and make an initial commit:

``` {.highlight .plaintext}
git add .
git commit -m "Initial commit"
```

I suggest publishing your dotvim files to github: it's really easy to
set up an account, and they host open source projects for free. In the
video, I demonstrate how to publish a git repository to github.

Keep your plugins in git
------------------------

The traditional method for installing Vim plugins is to copy each script
that is distributed with the plugin into the corresponding `.vim`
subdirectory. For example, if you wanted to install Fugitive.vim (a git
wrapper for Vim), you would copy the [documentation
file](http://github.com/tpope/vim-fugitive/blob/master/doc/fugitive.txt)
into `.vim/doc`, and copy the [plugin
file](http://github.com/tpope/vim-fugitive/blob/master/plugin/fugitive.vim)
into `.vim/plugin`. You could then check these in to your git
repository, and they could be syncronised across machines as easily as
the rest of your configuration files. But you lose something by doing
this. The Fugitive plugin itself is kept under version control with git.
It would be much better if you could keep it that way.

### Pathogen.vim

The [pathogen
plugin](http://www.vim.org/scripts/script.php?script_id=2332) makes it
possible to cleanly install plugins as a bundle. Rather than having to
place all of your plugins side by side in the same directory, you can
keep all of the files for each individual plugin together in one
directory. This makes installation more straightforward, and also
simplifies the tasks of upgrading and even removing a plugin if you
decide you no longer need it.

To install Pathogen, download the script and place it in your
`.vim/autoload` directory (if the directory doesn't exist, you'll have
to create it).

There are a couple of lines that you should add to your .vimrc file to
activate pathogen.

``` {.highlight .viml}
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
```

It is essential that these lines are called before enabling filetype
detection, so I would recommend putting them at the top of your vimrc
file.

### Install plugins as submodules

With pathogen installed, it's now possible to keep the files for each
plugin together, which means that every plugin can be kept in its own
git repository. The best way to do this is to use git submodules, which
are designed especially for the purpose of keeping git repositories
within a git repository.

To install the [fugitive](http://github.com/tpope/vim-fugitive) plugin
as a git submodule, take the following steps:

``` {.highlight .plaintext}
cd ~/.vim
mkdir ~/.vim/bundle
git submodule add http://github.com/tpope/vim-fugitive.git bundle/fugitive
git add .
git commit -m "Install Fugitive.vim bundle as a submodule."
```

Installing your Vim environment on another machine
--------------------------------------------------

Once your vim configuration is under version control, it's quite
straightforward to import your settings to any machine that has git
installed. If you followed the instructions above to put your vimrc and
plugins in a `dotvim` directory, then you can follow these steps to
synchronise them to another machine:

``` {.highlight .plaintext}
cd ~
git clone http://github.com/username/dotvim.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc
cd ~/.vim
git submodule init
git submodule update
```

As Marcin Kulik [points out in the comments](http://disq.us/ot9va)
below, the last two git commands can be rolled in to one:
`git submodule update --init`.

### Upgrading a plugin bundle

At some point in the future, the fugitive plugin might be updated. To
fetch the latest changes, go into the fugitive repository, and pull the
latest version:

``` {.highlight .plaintext}
cd ~/.vim/bundle/fugitive
git pull origin master
```

### Upgrading all bundled plugins

You can use the `foreach` command to execute any shell script in from
the root of all submodule directories. To update to the latest version
of each plugin bundle, run the following:

``` {.highlight .plaintext}
git submodule foreach git pull origin master
```

### Further reading

-   [github](http://github.com/) - free git hosting for open source
    projects
-   [GitCasts screencast on git submodules](http://blip.tv/file/4218925)
-   [Pathogen.vim](http://www.vim.org/scripts/script.php?script_id=2332) -
    allows Vim plugins to be installed as bundles
-   [Fugitive.vim](http://github.com/tpope/vim-fugitive) - a git wrapper
    for Vim
-   [git-submodule(1) Manual
    Page](http://www.kernel.org/pub/software/scm/git/docs/v1.7.5.4/git-submodule.html)

### Updates

[Matt noted in the
comments](http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/#comment-86512237)
that when you follow this method, generating helptags dirties the
submodule's git repository tree. Several other people chimed in with
suggestions on how to fix this. Nils Haldenwang has written a [blog
post](http://www.nils-haldenwang.de/frameworks-and-tools/git/how-to-ignore-changes-in-git-submodules)
describing a simple fix, which just involves adding the line
`ignore = dirty` to the .gitmodules file for each submodule that reports
a dirty tree when you run `git status`. Go and [read Nils's blog
post](http://www.nils-haldenwang.de/frameworks-and-tools/git/how-to-ignore-changes-in-git-submodules),
which goes into a bit more detail.
:::

[Comments[]{.disclosure}](#comments){.show-comments}

::: {#comments .content}
::: {#disqus_thread}
:::
:::
:::
:::

::: {.share-container}
Like this video? Spread the word!

::: {.buttons}
-   [twitter]{.text}
-   [google+]{.text}
-   [facebook]{.text}
-   [email]{.text}
:::
:::

::: {.row}
::: {.small-12 .large-10 .large-offset-2 .columns}
[« Previous](/episodes/bubbling-text/ "Bubbling text"){.previous} [Next
»](/episodes/refining-search-patterns-with-the-command-line-window/ "Refining search patterns with the command-line window"){.next}
:::
:::

::: {.row}

------------------------------------------------------------------------

::: {.small-12 .columns}
::: {.metaheader}
### Browse similar content
:::

-   [](/categories/plugins)

    #### plugins

    19 screencasts, 5 articles

-   [](/categories/git)

    #### git

    6 screencasts, 3 articles
:::
:::

::: {.pro-content}

------------------------------------------------------------------------

::: {.level-up}
::: {.metaheader}
Level-up your Vim
-----------------
:::
:::

### Training

::: {.training}
Boost your productivity with a [Vim training class](/training). Join a
public class, or book a private session for your team.

> Drew hosted a private Vim session for the shopify team that was one of
> the best workshops I have ever attended.
>
> John Duff, Director of Engineering at Shopify
:::
:::

::: {.pro-content}
### Publications

::: {.publications}
Make yourself a faster and more efficient developer with the help of
[these publications](/publications), including Practical Vim (Pragmatic
Bookshelf 2012), which has over 50 five-star reviews on Amazon.

> After reading it, I\'ve switched to vim as my default editor on a
> daily basis with no regrets. **★★★★★**
>
> Javier Collado
:::

::: {.publications-image .practical-vim}
![](/images/practical-vim/practical-vim-cover-550.jpg)
:::
:::

::: {.pro-content}
### Learn to use Vim efficiently in your Ruby projects

::: {.pro-screencasts}
In association with thoughtbot, one of the most well respected Rails
consultancies in the world, I\'ve produced a series of screencasts on
how to make navigating your Ruby projects with Vim ultra-efficient.
Along the way, you'll also learn how to make Ruby blocks a first-class
text object in Vim. This lets you edit Ruby code at a higher level of
abstraction. [Available to buy from
thoughtbot.](https://thoughtbot.com/upcase/navigating-ruby-files-with-vim).
:::

::: {.pro-screencasts-image}
[![](/images/thoughtbot-robot-logo.png)](https://thoughtbot.com/upcase/navigating-ruby-files-with-vim)
:::
:::

::: {.row}
::: {.small-12 .columns}
::: {.row .footer}

------------------------------------------------------------------------

::: {.small-6 .columns}
-   [About](/about)
-   [Announcements](/announcements)
-   [Leave a tip](/tipjar)
:::

::: {.small-6 .columns}
Vimcasts.org established MMX
:::
:::
:::
:::
:::

[]{.exit-off-canvas}
:::
:::
