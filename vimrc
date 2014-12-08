se nocompatible             " Use vim defaults, should be first entry

""" Load bundles
filetype off                " must be off for vundle
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

""" Dependencies for bundles
Plugin 'gmarik/vundle'

""" Appearance
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'

""" General
Plugin 'tpope/vim-commentary'
Plugin 'mileszs/ack.vim'
Plugin 'haya14busa/incsearch.vim'

""" Navigation
Plugin 'Lokaltog/vim-easymotion'
if has('ruby')
    Plugin 'LustyExplorer'
endif
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'

""" Editing {
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'Raimondi/delimitMate'
if has('python') || has('python3')
    Plugin 'SirVer/ultisnips'
    Plugin 'Valloric/YouCompleteMe'
else
    Plugin 'ervandew/supertab'
endif
Plugin 'mattn/emmet-vim'
Plugin 'Tabular'

""" Language specific
Plugin 'tpope/vim-markdown'
Plugin 'evanmiller/nginx-vim-syntax'
Plugin 'fatih/vim-go'
Plugin 'evidens/vim-twig'
Plugin 'docteurklein/vim-symfony'
Plugin 'Herzult/phpspec-vim'

"
"+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
"|
"|  > SYNTAX HIGHLIGHTING
"|
"|
syntax on

se t_Co=16                      " number of colors supported
se background=dark

let g:solarized_termcolors=16
let g:solarized_termtrans=0
let g:solarized_degrade=0
let g:solarized_bold=1
let g:solarized_underline=1
let g:solarized_italic=1
let g:solarized_contrast="low"
let g:solarized_visibility="high"

if $TERM =~ "-256color"
  se t_Co=256
  let g:solarized_termcolors=256
  let g:solarized_contrast="high"
  let g:solarized_termtrans=1
endif

" loads color scheme if available
try
    colorscheme solarized
catch /^Vim\%((\a\+)\)\=:E185/
    " deal with it
endtry


"
"+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
"|
"|  > GENERAL VIM SETTINGS
"|
"|
se autoread                     " Automatically read a file that has changed on disk
se clipboard=unnamedplus        " Use default X-System register for copy and paste
se history=200                  " Sets how many lines of history VIM has to remember
se undolevels=1000              " Number of changes that can be undone
se undoreload=10000             " Number lines to save for undo on a buffer reload
se noundofile                   " Don't keep a persistent undofile
se autoread                     " Automatically read a file that has changed on disk
se nobackup                     " Don't make a backup before overwriting a file.
se nowritebackup                " And again.
se noswapfile                   " Use an SCM instead of swap files
se nospell                      " Disable spell checking
se hidden                       " Handle multiple buffers better.
se cmdheight=2                  " command bar height
se laststatus=2                 " always show status bar
se completeopt=menuone,preview  " autocompletion options
se ruler                        " show the cursor position all the time
se lazyredraw                   " turn on lazy redraw
se number                       " line numbers
se noshowcmd                    " don't display incomplete commands
se esckeys                      " Allow cursor keys in insert mode
se ttyfast                      " Optimize for fast terminal connections
se enc=utf-8 nobomb             " Use UTF-8 without BOM
se wildmenu                     " command line autocompletion
se wildmode=list:longest,full   " options for autocompletion
" ignore in most cases
se wildignore+=*.o,*/.git/*,*/.hg/*,*/.svn/*,*/*cache,*/logs,*/tmp,*.swp,*.jpg
se wildignore+=*.png,*.xpm,*.gif,*.ico,*/vendor,web/dist,web/bundles,*/target/*
se wildignore+=*/tags,*.phar,*/node_modules
se gdefault                     " the /g flag on :s substitutions by default

" Enables the reading of .vimrc, .exrc and .gvimrc in the current directory. http://stackoverflow.com/a/7541744/186355
se exrc
se secure " disable unsafe commands in them

" Search related options
se smartcase                    " case-sensitive search if expression contains a capital letter.
se hlsearch                     " Highlight matches.
se ignorecase                   " Case-insensitive searching.
se incsearch                    " Highlight matches as you type.
se showmatch

" Indentation
se backspace=indent,eol,start                                   " Intuitive backspacing.
"se list listchars=tab:»·,trail:·,extends:>,precedes:<,nbsp:·    " Highlight trailing spaces and tabs
se autoindent                                                   " automatic indent new lines
se expandtab                                                    " expand tabs to spaces
se smartindent
se tabstop=4
se tildeop
se shiftwidth=4
se softtabstop=4

" scrolling
se scrolljump=3
se scrolloff=3

" wrapping linebreak
se wrap linebreak
se textwidth=120
se colorcolumn=120
se formatoptions=qrn1

" session options
set ssop-=options               " do not store global and local values in a session
set ssop-=folds                 " do not store folds

" Diff options
if &diff
  nmap <leader>do :diffget<space>
  nmap <leader>dp :diffput<space>
endif

set diffopt=filler,vertical
set diffopt+=iwhite

" Use perl regex style
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v

" === MAPPINGS ===
let mapleader=","       " Use the comma as leader
nmap <leader>2 :setlocal tabstop=2<cr>:setlocal shiftwidth=2<cr>:setlocal softtabstop=2<cr>
nmap <leader>4 :setlocal tabstop=4<cr>:setlocal shiftwidth=4<cr>:setlocal softtabstop=4<cr>

" Reselect visual block after indent
vnoremap < <gv
vnoremap > >gv

" Toggle line numbering
nmap <silent> <leader>n :set nonumber!<cr>

" Create a new file, suggest current directory of the file edited
nmap <leader>c :e <c-r>=expand('%:h')<cr>/

" Global quick search-replace
nmap <leader>sr :!ack -l <C-r>=expand("<cword>")<cr> \|
      \ xargs perl -pi -E 's/<C-r>=expand("<cword>")<cr>//g'<left><left><left>

" Run write with root perms
cmap w!! w !sudo tee % >/dev/null<CR>:e!<CR><CR>

" Select all text
nmap <C-a> ggVG$

" go to previous most recent file opened
nmap <leader>m :e#<cr>

" replace all tabs to spaces, windows new lines to normal
nmap <leader>C :call CleanCode()<cr>

" === PLUGINS ===
nmap <leader>b :CtrlPBuffer<cr>
nmap <leader>l :CtrlP<cr>

let g:ctrlp_custom_ignore = '\v[\/](vendor|\.git|\.hg|\.svn)$'
let g:ctrlp_buffer_func = { 'enter': 'MyCtrlPMappings' }

func! MyCtrlPMappings()
    " remove from buffer
    nnoremap <buffer> <silent> <c-@> :call <sid>DeleteBuffer()<cr>
endfunc

" Easymotion
map <leader><leader> <Plug>(easymotion-prefix)
map <leader>/ <Plug>(easymotion-sn)
omap <leader>/ <Plug>(easymotion-tn)
map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)

" Airline
let g:airline_theme='solarized'
let g:airline_powerline_fonts = 1
let g:airline#extensions#syntastic#enabled = 1

" Nerd tree
nmap <Leader>. :let NERDTreeQuitOnOpen = 1<bar>NERDTreeToggle<CR>

" ACK, used for silver search aka ag
if executable('ag')
    set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow
    set grepformat=%f:%l:%c:%m
    let g:ackprg = 'ag --nogroup --nocolor --column'
endif

" UltiSnips
let g:UltiSnipsSnippetDirectories = ["ultisnips"]
function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-e>"
" this mapping Enter key to <C-y> to chose the current highlight item
" and close the selection list, same as other IDEs.
" CONFLICT with some plugins like tpope/Endwise
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Delimit mate
let delimitMate_autoclose = 1
let delimitMate_matchpairs = "(:),[:],{:}"

" Syntastic
let g:syntastic_enable_signs=1
let g:syntastic_enable_balloons=1
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Fugitive
nmap <silent> <leader>gs :Gstatus<CR>
nmap <silent> <leader>gd :Gdiff<CR>
nmap <silent> <leader>gc :Gcommit<CR>
nmap <silent> <leader>gb :Gblame<CR>
nmap <silent> <leader>gl :Glog<CR>
nmap <silent> <leader>gp :Git push<CR>
nmap <silent> <leader>gw :Gwrite<CR>
nmap <silent> <leader>gr :Gremove<CR>

" Zencoding - aka emmet-vim
let g:user_emmet_leader_key = '<c-l>' " CTRL + L + <leader>

" ViM GO
let g:go_fmt_command = "goimports"

" highlight searching
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
let g:incsearch#auto_nohlsearch = 1
let g:incsearch#magic = '\v'
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

"
"+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
"|
"|  > FUNCTIONS
"|
"|
function! <SID>StripTrailingWhitespaces()
    " Preparation save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

function! <SID>MkdirsIfNotExists(directory)
    if(!isdirectory(a:directory))
        call system('mkdir -p '.shellescape(a:directory))
    endif
endfunction

" delete from buffer, based on current line (used for ctrlp)
func! s:DeleteBuffer()
    let line = getline('.')
    let bufid = line =~ '\[\d\+\*No Name\]$' ? str2nr(matchstr(line, '\d\+'))
        \ : fnamemodify(line[2:], ':p')
    exec "bd" bufid
    exec "norm \<F5>"
endfunc

"  Clean code function
function! CleanCode()
  %retab          " Replace tabs with spaces
  %s/\r/\r/eg     " Turn DOS returns ^M into real returns
  %s=  *$==e      " Delete end of line blanks
  echo "Cleaned"
endfunction

"
"+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
"|
"|  > AUTOCMD
"|
"|
filetype plugin indent on       " enable detection, plugins and indenting in one step

if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=500
        au InsertLeave * set timeoutlen=1000
    augroup END
endif

if has('autocmd')
    augroup Cursor
        autocmd!
        au FocusLost silent! :wa
        " Highlight cursor line
        au insertEnter * se cursorline
        au insertLeave * se nocursorline
        highlight cursorline term=underline cterm=underline ctermbg=0 guibg=#000000

        " Restore cursor position
        au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm$"|endif|endif
    augroup END

    augroup FileTypes
        autocmd!
        au FileType helpfile setlocal nonumber

        au BufRead,BufNewFile *.json    setlocal filetype=javascript
        au BufRead,BufNewFile *.md      setlocal spell spelllang=en_us

        " set tab width to 2
        au BufRead,BufNewFile *.feature,*.css,*.scss,*.js       setlocal ts=2 sw=2 sts=2
        au BufRead,BufNewFile *.scala,*.yml,*.html,*.twig,*.sql setlocal ts=2 sw=2 sts=2


        " Highlight whitespace for non GO files
        au BufRead,BufNewFile * if index(['go'], &ft) < 0 | setlocal list listchars=tab:»·,trail:·,extends:>,precedes:<,nbsp:·
    augroup END

    augroup OnSave
        autocmd!
        " strip trailing space on write
        au BufWrite * :call <SID>StripTrailingWhitespaces()

        " create directory when writing
        au BufWrite * :call <SID>MkdirsIfNotExists(expand('<afile>:h'))
    augroup END

endif

