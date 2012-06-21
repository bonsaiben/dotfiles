set nocompatible

" set t_Co=256
syntax enable
set background=light
colorscheme github
"highlight PmenuSel ctermfg=White ctermbg=DarkGray


set number

set ruler
" Show additional info in the command line (very last line on screen) where
" appropriate.
set showcmd
" Always display status lines/rulers
"set laststatus=2
" no extra status lines
set laststatus=0
" display more information in the ruler
"set rulerformat=%40(%=%t%h%m%r%w%<\ (%n)\ %4.7l,%-7.(%c%V%)\ %P%)
set rulerformat=%30(%=%h%m%r%w%<\ %4.7l,%-7.(%c%V%)\ %P%)
" current mode in status line
set showmode
" don't redraw the screen during macros etc (NetHack's runmode:teleport)
set lazyredraw
" threshold for reporting number of lines changed
set report=0
"}}}
" Make vim less whiny {{{
" :bn with a change in the current buffer? no prob!
set hidden
" no bells whatsoever
set vb t_vb=
" send more data to the terminal in a way that makes the screen update faster
set ttyfast
" < and > will hit indentation levels instead of always -4/+4
set shiftround
" min window height
"set wmh=0

" Show matching brackets/parentheses when navigating around
set showmatch
" Show matching parens in 2/10 of a second. No idea why I wanted this.
set matchtime=2
" Search incrementally instead of waiting for me to hit Enter
set incsearch
" Search case-insensitively
set ignorecase
" But be smart about it -- if I have any caps in my term, be case-sensitive.
set smartcase
" Don't highlight search terms by default.
"set nohls
set hlsearch





" Formatting

" Automatically indent based on current filetype
set autoindent
" Don't unindent when I press Enter on an indented line
set preserveindent
" 'smartindent', however, screws up Python -- so turn it off
set nosmartindent
" Make tabbing/deleting honor 'shiftwidth' as well as 'softtab' and 'tabstop'
set smarttab
" Use spaces for tabs
set expandtab
" When wrapping/formatting, break at 79 characters.
"set textwidth=76
" By default, all indent/tab stuff is 4 spaces, as God intended.
set tabstop=2
set softtabstop=2
set shiftwidth=2
" Default autoformatting options:
" t: automatically hard-wrap based on textwidth
" c: do the same for comments, but autoinsert comment character too
" r: also autoinsert comment character when making new lines after existing
" comment lines
" o: ditto but for o/O in normal mode
" q: Allow 'gq' to autowrap/autoformat comments as well as normal text
" n: Recognize numbered lists when autoformatting (don't explicitly need this,
" was probably in a default setup somewhere.)
" 2: Use 2nd line of a paragraph for the overall indentation level when
" autoformatting. Good for e.g. bulleted lists or other formats where first
" line in a paragraph may have a different indent than the rest.
set formatoptions=tcroqn2
" Try to break on specific characters instead of the very last character that
" might otherwise fit. Don't remember exactly why this is here but I'm happy
" with how things wrap now...
set lbr
" < and > will hit indentation levels instead of always -4/+4
set shiftround


" Behavior

" <Leader> key
let mapleader = ","

" Allow folding to play nice with Python and other well-indented code
"set foldmethod=indent
" Don't close all folds by default when file opens
"set nofoldenable
" Honor Vim modelines at top/bottom of files
set modeline
" Look 5 lines in for modelines (default is sometimes just 1 or 2 which may not
" be enough for some files)
set modelines=5
" When splitting, put new windows to the right (vertical) or below (horizontal)
set splitright splitbelow
" Start scrolling up/down when cursor gets to 3 lines away from window edge
set scrolloff=3
" Don't use 'more' for shell output automatically.
set nomore
" Use bash-like tab completion in Vim command line
set wildmenu
set wildmode=list:longest
" Allow backspaces to eat indents, end-of-line/beginning-of-line characters
set backspace=indent,eol,start
" Let me open a shitton of tabs at once if I really want.
set tabpagemax=100
" Make :sb let me navigate between all windows and tabs
set switchbuf=usetab
" only show a menu for completion, never a preview window or things like that
set completeopt=menuone
" remember lotsa fun stuff
"set viminfo=!,'1000,f1,/1000,:1000,<1000,@1000,h,n~/.viminfo
" if you :q with changes it asks you if you want to continue or not
set confirm
" 50 milliseconds for escape timeout instead of 1000
set ttimeoutlen=100
" show commands as I type them
set sc
" ack > grep
"set grepprg=ack


autocmd BufNewFile,BufRead *.scss setf css


"
" Key mappings
"

" Up/down go visually instead of by physical lines (useful for long wraps)
" Interactive ones need to check whether we're in the autocomplete popup (which
" breaks if we remap to gk/gj)
"map <up> gk
"map <down> gj

nnoremap <Space> i<Space><Esc>r
nnoremap <Nul> a<Space><Esc>r

nnoremap cu ct_
nnoremap du dt_

"nnoremap <CR> o<Esc>
"nnoremap <C-o> O<Esc>

inoremap ; <Esc>

inoremap \; ;
inoremap \\ \


nmap Y y$

nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz
nmap G Gzz

"nnoremap <Esc>[5C <C-W><C-L>
"nnoremap <Esc>[5D <C-W><C-H>
"nnoremap <Esc>[5A <C-W><C-K>
"nnoremap <Esc>[5B <C-W><C-J>

"command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis

" Fuzzy Finder

"nmap <leader>F :FufFile<CR>
"nmap <leader>t :FufFile **/<CR>
"nmap <C-t> :FufFile **/<CR>
"nmap <leader>f :FufFileWithCurrentBufferDir<CR>
"nmap <leader>d :FufDir<CR>
"nmap <C-b> :FufBuffer<CR>
"nmap <leader>fr :FufRenewCache<CR>
"let g:fuf_dir_exclude = '\v(^|[/\\])\.(hg|git|bzr)($|[/\\])'
"let g:fuf_mrufile_exclude = '\v\~$|\.(bak|sw[mnop])$|^(\/\/|\\\\|\/mnt\/|\/media\/)'
" Ignore the dojango directory since it's huge and spammy
"let g:fuf_file_exclude = '\v\~$|dojango|\.(o|exe|log|dll|bak|sw[mnop]|zip|pyc|DS_Store|tar\.gz)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])'

" syntax shortcuts
"inoremap <leader>u <esc>F<space>r_ea
"inoremap <leader>U <esc>F<space>r_F<space>r_ea
"inoremap <leader>su <esc>:s/\> \</_/g<cr>:noh<cr>A
"inoremap <leader>' ''<esc>i
"inoremap <leader>" ""<esc>i
"inoremap <leader>f ()<esc>i
"inoremap <leader>v []<esc>i
"inoremap <leader>V {}<esc>i
"inoremap <leader>/ //<esc>i
"inoremap <leader>p <Bar><Bar><esc>i
"inoremap <leader><leader>, <esc>la, 
"inoremap <leader><leader>. <esc>la.
"inoremap <leader>e <space>=<space>
"inoremap <leader>E <space>==<space>
inoremap <leader>a <space>=><space>
"inoremap <leader><leader>a <esc>la<space>=><space>
"inoremap <leader>b <esc>F<space>s{<Bar><esc>ea<Bar><space><space>}<esc>hi
"inoremap <leader>B <esc>F<space>s<space>do<space><Bar><esc>ea<Bar>
"inoremap <leader>c #{}<esc>i
"inoremap <leader><leader><space> <esc>la<space>

"inoremap <leader>rvp <esc>Ivalidates<space>:<esc>A,<space>:presence<space>=><space>true
"inoremap <leader>rsw <esc>Iscope<space>:<esc>A,<space>where()<esc>i
inoremap <leader>rd <esc>Idef<space><esc>oend<esc>O

"inoremap <leader>rbff <esc>Ibefore_filter<space>:<esc>A
"inoremap <leader>rbfo <esc>Ibefore_filter<space>:<esc>A,<space>:only => []<esc>i




nnoremap <C-h> <C-g>
nnoremap <C-k> :noh<CR>
"nnoremap <C-j> :s/
"nnoremap <C-h> <C-w>h
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-l> <C-w>l

nnoremap \ <S-i>#<space><Esc>


nnoremap <C-n> :tabn<CR>
nnoremap <C-p> :tabp<CR>

"map <Leader>v 0wh:put .<CR>a = <Esc>pa<CR><Esc>


" possibly available mappings
"---"nmap <C-h> same as "h"
"---"nmap <C-k> not used
"---"nmap <C-n> same as "j"
"---"nmap <C-j> same as "j"
"---"nmap <c-p> same as "k"
"---"nmap <Space> same as "l"
"nmap <C-Left> same as "b"
"nmap <C-Right> same as "w"
"---"nmap <Down> same as "j"
"---"nmap <Up> same as "k"
"---"nmap \ not used
"nmap <c-\>others not used
"nmap <c-_> not used
"nmap + same as <cr>
"nmap do same as ":goget"
"nmap dp same as ":diffput"
"nmap <Left> same as "h"
"nmap <Right> same as "l"

