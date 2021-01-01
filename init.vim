"
"888     888 d8b                     .d8888b.                     .d888 d8b          
"888     888 Y8P                    d88P  Y88b                   d88P"  Y8P          
"888     888                        888    888                   888                 
"Y88b   d88P 888 88888b.d88b.       888         .d88b.  88888b.  888888 888  .d88b.  
" Y88b d88P  888 888 "888 "88b      888        d88""88b 888 "88b 888    888 d88P"88b 
"  Y88o88P   888 888  888  888      888    888 888  888 888  888 888    888 888  888 
"   Y888P    888 888  888  888      Y88b  d88P Y88..88P 888  888 888    888 Y88b 888 
"    Y8P     888 888  888  888       "Y8888P"   "Y88P"  888  888 888    888  "Y88888 
"                                                                                888 
"                                                                           Y8b d88P 
"                                                                            "Y88P"

call plug#begin('~/.plugged')
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ianks/vim-tsx'
Plug 'leafgarland/typescript-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/goyo.vim'
" Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'sheerun/vim-polyglot'
Plug 'mbbill/undotree'
Plug 'ap/vim-css-color' 
Plug 'tpope/vim-fugitive'
Plug 'liuchengxu/vim-which-key'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-startify'
Plug 'acro5piano/vim-jsx-replace-tag'
Plug 'metakirby5/codi.vim'
Plug 'voldikss/vim-floaterm'
Plug 'chriskempson/base16-vim'
Plug 'preservim/nerdcommenter'
Plug 'diepm/vim-rest-console'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
call plug#end()

let mapleader=" "
let loaded_netrwPlugin = 1
set clipboard=unnamedplus
" Prettier
" when running at every change you may want to disable quickfix
" let g:prettier#quickfix_enabled = 0

" let g:prettier#autoformat = 0
" autocmd BufWritePre,InsertLeave *.js,*.ts,*.jsx,*.tsx,*.json,*.css,*.scss,*.less,*.graphql Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile
autocmd BufWritePre,InsertLeave *.js,*.ts,*.jsx,*.tsx,*.json,*.tf,*.css,*.scss,*.less,*.graphql,*.yml Prettier
let g:vrc_output_buffer_name = '__VRC_OUTPUT.<filetype>'

let g:startify_session_dir = '~/.config/nvim/session'
let g:startify_bookmarks = [
            \ { 'c': '~/work/rest/API-Request.rest' },
            \ { 'i': '~/.config/nvim/init.vim' },
            \ { 'z': '~/.zshrc' },
            \ ]

let g:NERDSpaceDelims = 1
let g:NERDCustomDelimiters={
	\ 'typescriptreact': { 'left': '//', 'right': '', 'leftAlt': '{/*', 'rightAlt': '*/}' },
\}

" Line numbers on
set number

" tab size = 2
filetype plugin indent on
" show existing tab with 2 spaces width
set tabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2
" On pressing tab, insert 2 spaces
set expandtab

let g:fugitive_pty = 0

set spell
set spelllang=en_gb

let g:floaterm_keymap_toggle = '<F1>'
let g:floaterm_keymap_next   = '<F2>'
let g:floaterm_keymap_prev   = '<F3>'
let g:floaterm_keymap_new    = '<F4>'

" Floaterm
let g:floaterm_gitcommit='floaterm'
let g:floaterm_autoinsert=1
let g:floaterm_width=0.8
let g:floaterm_height=0.8
let g:floaterm_wintitle=0
let g:floaterm_autoclose=1

" theme stuff
syntax enable
"colorscheme gruvbox
"colorscheme onedark
"colorscheme base16-ia-dark 
"colorscheme base16-default-dark
colorscheme base16-ocean

set termguicolors

set background=dark termguicolors cursorline

hi! Normal ctermbg=NONE guibg=NONE 
hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE 

let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

xnoremap p pgvy
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

"function! s:Visual()
"  return visualmode() == 'V'
"endfunction
"
"function! s:Move(address, at_limit)
"  if s:Visual() && !a:at_limit
"    execute "'<,'>move " . a:address
"    call feedkeys('gv=', 'n')
"  endif
"  call feedkeys('gv', 'n')
"endfunction
"
"function! Move_up() abort range
"  let l:at_top=a:firstline == 1
"  call s:Move("'<-2", l:at_top)
"endfunction
"
"function! Move_down() abort range
"  let l:at_bottom=a:lastline == line('$')
"  call s:Move("'>+1", l:at_bottom)
"endfunction

" Move VISUAL LINE selection within buffer.
"xnoremap <silent> K :call Move_up()<CR>
"xnoremap <silent> J :call Move_down()<CR>

map <leader>i :tabe ~/.config/nvim/init.vim<CR>
map <leader>t :tabe ~/work/rest/API-Request.rest<CR>

noremap <leader>bd :%bd\|e#\|bd#<cr>\|'"

"switching between buffers
map gn :bn<cr>
map gp :bp<cr>
map gw :bd<cr>
map <Tab> :bnext<cr>
map <S-Tab> :bprev<cr>

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

nnoremap <leader>g :G<CR>
nnoremap <leader>b :G blame<CR>
 
let g:ranger_map_keys = 0
map <leader>r :Ranger<CR>

nnoremap <Leader>rt :JSXReplaceTag<CR>

:nmap <leader>e :CocCommand explorer<CR>

noremap <silent> <C-p> :GFiles<CR>
noremap <silent> <C-a> :Ag<cr>

nnoremap <Leader>= :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>

let g:ackprg = 'ag --nogroup  --column'

let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show=1
let g:airline_powerline_fonts = 1

set nowrap
set smartcase
set noswapfile
set undodir=~/.nvim/undodir
set undofile
set incsearch
" set colorcolumn=120

nnoremap <leader>u :UndotreeToggle<CR>

" Conquer of completion config 
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gz <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
" nmap <silent> <TAB> <Plug>(coc-range-select)
" xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>x  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
" nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
" nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
