set nocompatible
filetype off
"set rtp+=~/.vim/bundle/vundle
set rtp+=/usr/local/opt/fzf
call plug#begin('~/.vim/plugged')

Plug 'gmarik/vundle'

Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'

Plug 'christoomey/vim-tmux-navigator'
Plug 'rking/ag.vim'
Plug 'wellle/targets.vim'
Plug 'triglav/vim-visual-increment'
Plug 'justinmk/vim-sneak'
Plug 'vim-scripts/bufkill.vim'
Plug 'Shougo/vimproc.vim'
Plug 'Shougo/vimshell.vim'
Plug 'ap/vim-buftabline'
Plug 'kien/rainbow_parentheses.vim'
Plug 'Valloric/YouCompleteMe'

"Language Specific Stuff
Plug 'justinmk/vim-syntax-extra'
Plug 'derekwyatt/vim-scala'
Plug 'fatih/vim-go'
Plug 'keith/swift.vim'
Plug 'guns/vim-clojure-static'
Plug 'guns/vim-clojure-highlight'
Plug 'othree/yajs.vim'
Plug 'sophacles/vim-processing'
Plug 'tmux-plugins/vim-tmux'

"fzf stuff
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"Colors
Plug 'molokai'
Plug 'zenburn'
Plug 'inkpot'
Plug 'desert256.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'chriskempson/base16-vim'
Plug 'altercation/vim-colors-solarized'
Plug 'ronny/birds-of-paradise.vim'
Plug 'morhetz/gruvbox'

call plug#end()            " required

filetype plugin indent on    " required

" Other Shit
" Why are swap files enabled by default?
set nobackup
set nowritebackup
set noswapfile
" Smart tab defaults
set tabstop=4
set shiftwidth=4
set softtabstop=4
" Auto indenting
set autoindent
set smarttab
" yank / paste to clipboard
set clipboard=unnamed
" mouse
set mouse=a
" Case insensitive searching
set incsearch
set ignorecase
set smartcase
" Make backspace work as indented
set backspace=indent,eol,start
" So Pretty
set cursorline
" Why would I want to add a space when I join a line?
set nojoinspaces
" Super fast key response times
set ttimeout
set ttimeoutlen=100
" Yes?
set number
"Find tags file
set tags=tags;/
" set tags=./tags,tags;
" Fixs weird dinging
set visualbell
" Enable line wrapping and put && at start of linebreak
set wrap
"set showbreak=&&
set linebreak
set breakindent

set viminfo+=n~/.vim/viminfo

" Doesn't turn long wrapped lines into @s
set display=lastline
" Switch from unsaved buffers
set hidden
" ooo pretty
syntax on
"Turn off stupid preview window
set completeopt-=preview
" Maximum colors
" set background=dark
set termguicolors
set t_Co=256

"let g:gruvbox_termcolors = 16

"colorscheme base16-default
"colorscheme molokai
colorscheme gruvbox

" Gruvbox had some slightly dark word background. This fixes that
" hi Normal ctermbg = 0


"hi TabLineFill ctermfg=0 ctermbg=1

"hi TabLineSel ctermfg=Red ctermbg=Yellow

"hi BufTabLineActive ctermfg=DarkGreen ctermbg=Black
"hi BufTabLineCurrent ctermfg=DarkBlue ctermbg=Black
"hi BufTabLineHidden ctermbg=Gray ctermfg=Black
"hi BufTabLineFill ctermbg=Gray ctermfg=Gray

"hi BufTabLineActive ctermfg=DarkBlue ctermbg=black
"hi BufTabLineCurrent ctermfg=DarkGreen ctermbg=black
"Key Remaps
" Enter adds lines in normal mode
nnoremap <CR> o<Esc>
cnoremap <CR> <CR>

"j and k move down to the next text on wrapped lines
map j gj
map k gk

"Improved indenting
vmap > >gv
vmap < <gv

"I have no clue why this isn't enabled by default
nnoremap Y y$

"Switch the default action of , to \
nnoremap \ ,

"Less stupid line movement
map L $
map H ^

"K breaks lines, J makes more sense"
nnoremap J :join!<cr>
map K i<cr><esc>

"Text Writing, copped straight from Dr. Bunsen
func! WordProcessorMode()
	setlocal formatoptions=1
	setlocal noexpandtab
	setlocal spell spelllang=en_us
	setlocal spell
	setlocal nolist
	setlocal linebreak
	setlocal showbreak=
	set complete+=s
	set formatprg=par
	set formatoptions+=l
	syntax spell toplevel
endfu
com! WP call WordProcessorMode()

"File Type Settings
augroup filetxt_txt
	autocmd!
	autocmd BufEnter,BufNewFile,BufRead *.txt call WordProcessorMode()
	"autocmd FileType *.txt NeoCompleteLock
augroup END

augroup filetype_md
	autocmd!
	autocmd BufEnter,BufRead,BufNewFile *.md call WordProcessorMode()
	"autocmd FileType markdown NeoCompleteLock
augroup END

augroup filetype_tex
	autocmd!
	autocmd BufEnter,BufRead,BufNewFile *.tex call WordProcessorMode()
	"autocmd FileType latex NeoCompleteLock
augroup END

augroup filetype_pde
	autocmd!
	autocmd BufEnter,BufRead,BufNewFile *.pde setf java
augroup END

"Remove auto comment
augroup remove_autocomment
	autocmd!
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
augroup END

autocmd Filetype javascript setlocal ts=2 sts=2 sw=2

"Leader Keys
let mapleader = ','

"Edit .vimrc
nnoremap <silent> <leader>ev :badd ~/.vimrc<cr>
"Source .vimrc
nnoremap <silent> <leader>sv :source ~/.vimrc<cr>
"Fast Saves
nnoremap <silent> <leader>w :w<cr>
nnoremap <silent> <leader>wa :wa<cr>
nnoremap <silent> <leader>wq :wq<cr>
nnoremap <silent> <leader>q :q<cr>

"Yank whole buffer
nnoremap <leader>y ggyG
"Replace buffer with paste
nnoremap <leader>p ggVGp

"Close quickfix list
nnoremap <silent> <leader>c :ccl<cr>

"Format paragraph
nnoremap <silent> <leader>f vipgq

"Fix Whitespace
"nnoremap <silent> <leader>ws :FixWhitespace<cr>

"Buffer Management
nnoremap <silent> <left> :bprev<CR>
nnoremap <silent> <right> :bnext<CR>
nnoremap <silent> <leader>d :BD<CR>

"Make perusing buffers a bit easier while I'm moving through them
nnoremap <silent> <up> <C-u>
nnoremap <silent> <down> <C-d>

"Quick spelling correction
nnoremap <C-f> [s1z=<c-o>
inoremap <C-f> <c-g>u<Esc>[s1z=`]A<c-g>u

"Ctag search selection lands at the top of the window
"Why wouldn't you want to see the contents of a function you're searching for?
nnoremap <C-]> <C-]>zt

"Increment Number
nnoremap <leader>a <C-a>
nnoremap <leader>x <C-x>
vmap <leader>a <C-a>
vmap <leader>x <C-x>

"Split windows
nnoremap <silent> <leader>v :vsplit<cr>
nnoremap <silent> <leader>h :split<cr>

"Make heading
nnoremap <leader>1 I# <esc>
nnoremap <leader>2 I## <esc>
nnoremap <leader>3 I### <esc>

vnoremap <leader>1 I# <esc>
vnoremap <leader>2 I## <esc>
vnoremap <leader>3 I### <esc>

vnoremap <silent> <leader>1 :s/^/\#\ / <cr>
vnoremap <silent> <leader>2 :s/^/\##\ / <cr>
vnoremap <silent> <leader>3 :s/^/\###\ / <cr>
"List
"Command to make ordered lists
command! -nargs=0 -range=% Number <line1>,<line2>s/^\s*\zs/\=(line('.') - <line1>+1).'. '
vnoremap <silent> <leader>l :s/^/\+\ / <cr>
nnoremap <silent> <leader>l I+ <esc>
vnoremap <silent> <leader>o :Number<cr>

"Keep selection when indenting lines
vnoremap <silent> < <gv
vnoremap <silent> > >gv

"Cap word
nnoremap <leader>` gUw

"Tmux stuff
let g:tmux_navigator_no_mappings = 1

map <silent> <C-h> :TmuxNavigateLeft<cr>
map <silent> <C-j> :TmuxNavigateDown<cr>
map <silent> <C-k> :TmuxNavigateUp<cr>
map <silent> <C-l> :TmuxNavigateRight<cr>
imap <silent> <C-h> <C-o>:TmuxNavigateLeft<cr><esc>
imap <silent> <C-j> <C-o>:TmuxNavigateDown<cr><esc>
imap <silent> <C-k> <C-o>:TmuxNavigateUp<cr><esc>
imap <silent> <C-l> <C-o>:TmuxNavigateRight<cr><esc>

"Ack
"nnoremap <leader>g :Ack <cword><cr>

"bufferline stuff
set laststatus=2 "always show statusline
"set laststatus=0 "always show statusline

"statusline ala tpope
set statusline=[%n]\ %<%.99f\ %h%w%m%r%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%y%=%-16(\ %l,%c-%v\ %)%P

"Wordy stuff
hi SpellBad cterm=underline ctermfg=darkred
nnoremap <silent> <leader>z :NextWordy<cr>
nnoremap <silent> <leader>Z :NoWordy<cr>

"zt sucks
nnoremap <leader>t zt

"Make netrw look like NerdTREE
let g:netrw_liststyle=3
let g:netrw_banner=0

""Disable folding in vim markdown plugin
"let g:markdown_enable_folding = 0
"let g:markdown_include_jekyll_support = 0
"let g:markdown_enable_mappings = 0

"Unite stuff
"Unite ag settings
" let g:unite_source_grep_command = 'ag'
" let g:unite_source_grep_default_opts =
"           \ '--line-numbers --nocolor --nogroup --hidden --ignore ' .
"           \  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
" let g:unite_source_grep_recursive_opt = ''
" 
" "Set unite highlight color as the cursorline
" call unite#custom#profile('default', 'context', { 'cursor_line_highlight' : 'CursorLine' })
" 
" let g:unite_source_history_yank_enable = 1

" nnoremap <space>y :Unite -silent -no-resize -no-split history/yank<cr>
" 
" nnoremap <space>m :Unite -silent -no-resize -no-split file_mru<cr>
" nnoremap <space>b :Unite -silent -no-resize -no-split buffer<cr>
" nnoremap <space>o :Unite -silent -no-resize -no-split outline<cr>
" nnoremap <space>h :Unite -silent -no-resize -no-split history/command<cr>
" 
" nnoremap <space>/ :Unite -silent -no-start-insert -no-resize -no-split grep:.<cr>
" nnoremap <leader>/ :UniteWithCursorWord -silent -no-start-insert -no-resize -no-split grep:.<cr>
" 
" nnoremap <space>v :Unite -silent -no-resize -no-split -start-insert buffer<cr>
" "nnoremap <space>c :Unite -silent -no-resize -no-split tag/include<cr>
" nnoremap <space>c :Unite -silent -no-resize -no-split tag<cr>
" 
" "VimFiler Stuff
" nnoremap <silent> <space>n :VimFilerBufferDir -force-quit<cr>
" 
" "Fix tmux in vimfiler
" autocmd FileType vimfiler map <buffer> q <Plug>(vimfiler_exit)
" autocmd FileType vimfiler map <buffer> <C-h> :TmuxNavigateLeft<cr>
" autocmd FileType vimfiler map <buffer> <C-j> :TmuxNavigateDown<cr>
" autocmd FileType vimfiler map <buffer> <C-k> :TmuxNavigateUp<cr>
" autocmd FileType vimfiler map <buffer> <C-l> :TmuxNavigateRight<cr>
" "make q default to close vimfiler
" 
" autocmd FileType unite map <buffer> q <Plug>(unite_all_exit)

let g:vimfiler_force_overwrite_statusline = 0

" Turn off K = docs in pde files
let g:processing_doc_style = 0

" Use vimfiler as default file explorer
let g:vimfiler_as_default_explorer = 1

"Lets me use enter in the commandline history buffer, It's usually mapped to add lines
autocmd CmdwinEnter * nnoremap <buffer> <CR> <CR>

"Rainbow Parenthesis stuff
"TODO: Fix this
" let g:rbpt_colorpairs = [
"     \ ['brown',       'RoyalBlue3'],
"     \ ['Darkblue',    'SeaGreen3'],
"     \ ['darkgray',    'DarkOrchid3'],
"     \ ['darkgreen',   'firebrick3'],
"     \ ['darkcyan',    'RoyalBlue3'],
"     \ ['darkred',     'SeaGreen3'],
"     \ ['darkmagenta', 'DarkOrchid3'],
"     \ ['brown',       'firebrick3'],
"     \ ['gray',        'RoyalBlue3'],
"     \ ['darkmagenta', 'DarkOrchid3'],
"     \ ['Darkblue',    'firebrick3'],
"     \ ['darkgreen',   'RoyalBlue3'],
"     \ ['darkcyan',    'SeaGreen3'],
"     \ ['darkred',     'DarkOrchid3'],
"     \ ['red',         'firebrick3'],
"     \ ]

augroup rainbow
	au VimEnter * RainbowParenthesesToggle
	au Syntax * RainbowParenthesesLoadRound
	au Syntax * RainbowParenthesesLoadSquare
	au Syntax * RainbowParenthesesLoadBraces
augroup END

" make Go look beautiful
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

let g:go_doc_keywordprg_enabled = 0
" Auto add imports
" let g:go_fmt_command = "goimports"

" make python look beautiful
" let g:python_highlight_all = 1

" neocomplete stuff I don't really care to understand but makes neocomplete work how I want
" let g:acp_enableAtStartup = 0
" let g:neocomplete#enable_at_startup = 1
" let g:neocomplete#enable_smart_case = 1
" let g:neocomplete#sources#syntax#min_keyword_length = 3
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete

" if !exists('g:neocomplete#sources#omni#input_patterns')
" 	  let g:neocomplete#sources#omni#input_patterns = {}
" endif
" 
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" :
"         \ <SID>check_back_space() ? "\<TAB>" :
"         \ neocomplete#start_manual_complete()
"   function! s:check_back_space() "{{{
"     let col = col('.') - 1
"     return !col || getline('.')[col - 1]  =~ '\s'
"   endfunction"
" 
" function! s:my_cr_function()
"   return neocomplete#close_popup() . "\<CR>"
"   " For no inserting <CR> key.
"   "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
" endfunction
" 
" let g:neocomplete#use_vimproc = 1

let g:fzf_layout = { 'down': '~20%' }

nnoremap <silent> <space>f :Files<CR>
nnoremap <silent> <space>b :Buffers<CR>
nnoremap <silent> <space>t :Tags<CR>
nnoremap <silent> <space>h :History<CR>
nnoremap <silent> <space>l :Lines<CR>
nnoremap <silent> <space>L :BLines<CR>

nnoremap <silent> <space>/ :execute 'Ag ' . input('Ag: ')<CR>

let g:fzf_history_dir = '~/.local/share/fzf-history'