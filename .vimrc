" VIM Startup File

set nocompatible       " Use VIM settings rather than VI settings.
                       " This must be first, because it changes other
                       " options as a side effect

colorscheme ron        " Pick a good color scheme ('evening' is good too)

set autoindent         " Smart alignment at the beginning of a line
set backspace=2        " Always backspace over everything
set cmdheight=2        " Set the command line height to 2 rows
set confirm            " Confirm dangerous actions
set expandtab          " Expand <Tab> to spaces
set history=50         " Keep 50 lines of command line history
set ignorecase         " Perform case insensitive searches
set laststatus=2       " Always show the status line
"set list               " Show hidden characters (<Tab>, eol, etc.)
set listchars=eol:$,tab:>>,trail:~
                       " Show eol characters as '$'
                       " Show a <Tab> as '>>>'
                       " Show trailing spaces as '~'
set modelines=0        " Protection from VIM worm
"set mouse=ar           " Use the mouse in all modes, plus hit-return
set noautowrite        " Don't write anything to disk w/o verification first
set nobackup           " Don't create those ~ files (step 1/2)
set noerrorbells       " Turn off the sounds
set nohlsearch         " Don't highlight the search pattern
set incsearch          " Set incremental searching; find as typing 
set nojoinspaces       " Don't insert 2 spaces after a '.?!' and a join command
set nonumber           " Don't show line numbers on each line
set nostartofline      " Maintain cursor position
set novisualbell       " Don't show any alerts by flashing the screen
set nowritebackup      " Don't create those ~ files (step 2/2)
set ruler              " Show the cursor position all the time
set scrolloff=3        " Keep 3 lines above and below the cursor
set selectmode=mouse   " Use the mouse to select items
set shiftwidth=3       " When autoindent does a tab, it's 3 spaces
set shiftround         " Round indents off to shiftwidth spaces
set showcmd            " Show the command that I'm typing
set showmatch          " When a bracket is inserted, jump briefly to its match
set showmode           " Display INERT/REPLACE/...
set smartindent        " Indent after new blocks (if, while, for, etc.)
set smartcase          " Smartens up case insensitive searches (word vs. Word)
set softtabstop=3      " # of spaces that a <Tab> counts for in editing
set term=$TERM         " Use the terminal defined at LOGIN
set textwidth=78       " Wrap at column ? with a forced new line
set tabstop=3          " A <Tab> is 3 spaces long
set ttyfast            " This setting provides smoother changes
"set ttymouse=xterm     " Use the mouse
set undolevels=500     " Allow for up to 500 mistakes
set viminfo=           " Don't write a .viminfo file
set whichwrap=h,l,~,[,] " Wrap to the previous/next line on most keys
set wrap               " Wrap long lines of text
"set foldcolumn=2        " small column on window left to indicate folds
set foldclose=all       " auto close fold when leaving fold


"set mouse=             " Turn off the mouse in xterm
"set smarttab           " When in front of a line, always indent
"set splitbelow         " Put the new window below the current one
"set term=xterm-color   " This is a color terminal
"set title              " Show current file name in window title bar
"set titleold=""        " Turns of the 'Thanks for flying VIM' message
"set viminfo='10,\"100  " Save marks for up to 10 files, and
                        " save up to 100 lines per register
"set whichwrap=b,s,h,l,<,>,[,] " Wrap to the previous/next line on all keys

syntax enable          " Enable syntax highlighting

behave xterm           " VIM behavior seems to require this below the
                       " other setting

if has("terminfo")
  set t_Co=8
  set t_Sf=[3%p1%dm
  set t_Sb=[4%p1%dm
else
  set t_Co=8
  set t_Sf=[3%dm
  set t_Sb=[4%dm
endif

"if has("vms")
"  set nobackup            " Don't keep a backup file, use versions instead
"else
"  set backup              " Keep a backup file
"endif

"map Q gq                  " Don't use Ex mode, use Q for formatting
map <Del> <C-H>           " When <Backspace> sends a delete character, then
                          " remap it to a backspace (CTRL-H)

" Have '\tl' (toggle list) toggle list on/off and report the change.
" Map this toggle to <CONTROL-L> as well.
nnoremap \tl :set invlist list?<CR>
map <C-L> \tl

" Map the keypad so that it works!!
" BTW, "map" = normal and visual, "map!" = insert and command mode.
map! <ESC>Op 0
map! <ESC>Oq 1
map! <ESC>Or 2
map! <ESC>Os 3
map! <ESC>Ot 4
map! <ESC>Ou 5
map! <ESC>Ov 6
map! <ESC>Ow 7
map! <ESC>Ox 8
map! <ESC>Oy 9
map! <ESC>Ol +
map! <ESC>OS -
map! <ESC>OR *
map! <ESC>OQ /
map! <ESC>On .
map <ESC>Op 0
map <ESC>Oq 1
map <ESC>Or 2
map <ESC>Os 3
map <ESC>Ot 4
map <ESC>Ou 5
map <ESC>Ov 6
map <ESC>Ow 7
map <ESC>Ox 8
map <ESC>Oy 9
map <ESC>Ol +
map <ESC>OS -
map <ESC>OR *
map <ESC>OQ /
map <ESC>On .

  " Make a better status line that includes more information
  fu! FileTime()
          let ext=tolower(expand("%:e"))
          let fname=tolower(expand('%<'))
          let filename=fname . '.' . ext
          let msg=""
          let msg=msg." ".strftime("(Modified %b,%d %y %H:%M:%S)",getftime(filename))
          return msg
  endf

  fu! CurTime()
          let ftime=""
          let ftime=ftime." ".strftime("%b,%d %y %H:%M:%S")
          return ftime
  endf

  set statusline=%<%f%<%{FileTime()}%<%h%m%r%=%-20.(line=%03l,col=%02c,totlin=%L%)\%h%m%r%=%-30(,BfNm=%n%Y%)\%P\*%=%{CurTime()}

  "custom copy'n'paste
  "copy the current visual selection to ~/.vbuf
  vmap <C-c> :w! ~/.vbuf<CR>
  "copy the current line to the buffer file if no visual selection
  nmap <C-c> :.w! ~/.vbuf<CR>
  "paste the contents of the buffer file (can't enter visual block mode with
  "this enabled)
  "nmap <C-v> :r ~/.vbuf<CR>

  "maps the sequence gC to a macro which wraps a block of text, from 
  "the current line back to the line marked by the "a" in a C style
  map gC :'a,. s/^/ */^M:. s/\(.*\)/\1^V^V^M **************\//^M:'a s/\(.*\)/\/**************^V^V^M\1/^M



" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvs<C-R>=current_reg<CR><Esc>

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlightint
" on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

endif " has("autocmd")

" ----- MUNIS XML COMMENT HEADER MACROS ------------------------
" --------------------------------------------------------------
function! AddModHeader()
	normal ma
	exe "0r /data/scripts/modheader"
	let swapcmd="1,12s/v__filename/".expand("%")."/g"
	exe swapcmd
	let swapcmd="1,12s/v__login/".$USER."/g"
	exe swapcmd
	let swapcmd="1,12s/v__date/".strftime("%m-%d-%Y")."/g"
	exe swapcmd
	exe "1,12s/v__revmsg/- Added file header./g"
	normal 'a
endfunction

" --------------------------------------------------------------
function! AddFuncHeader()
	normal ma
	normal k
	exe "r /data/scripts/funcheader"
	normal 'a
endfunction

"----------Comments out code--------------------------
function! XcommentLine()
        " Comment out current line and return to cursor pos.
        let n=col(".")+3
        let @z="#+ "
        normal 0"zp
        exe "normal ".n."|"
endfunction

" --------------------------------------------------------------
function! CommentLine()
        " Comment out current line, move down and over for next line.
        let n=col(".")+3
        let @z="# "
        normal 0"zp
        exe "normal ".n."|"
endfunction

" -- Good 'ole F1 to kick help
:map <F1> :help

" -- F2 will insert a file header at the top of file, and fill
"    in the filename, author, and date.
:map <F2> :call AddModHeader()<cr>

" -- F3 will insert a function header above the cursor
:map <F3> :call AddFuncHeader()<cr>

" -- Hit F5 to run make, which will either move cursor to first error or run
"    the program when there are no errors.
:map <F4> :w<cr>:make run<cr> 

if &diff
   " Shortcuts to make split windows horizonal (<F5>) or vertical (<F6>)
   :map <F5> :windo wincmd K<CR><C-W>=
   :map <F6> :windo wincmd H<CR>
   nmap + <C-W>+
   nmap - <C-W>-
   " Ignore whitespace in vimdiff
   set diffopt+=iwhite
else
   " -- Hit F5 to run make, which will move cursor to first error.
   "    Then, hit F7 to go to the next error line, F6 for previous.
   :map <F5> :w<cr>:make<cr> 
   :map <F6> :cprevious<cr>
   :map <F7> :cnext<cr>
endif
" --- Comment current 4gl line for XML header
:map <F8> : call XcommentLine()<cr>

" --- Comment current 4gl line
:map <F9> : call CommentLine()<cr>
:map <F10> :'c,.w! ~/cutit<cr>
:map <F11> :r ~/cutit<cr>
":map <F12> :! getbuff<cr>
:set pastetoggle=<F12>
