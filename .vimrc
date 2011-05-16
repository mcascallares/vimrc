" ~/.vimrc (configuration file for vim only)

syntax on
filetype on " enable file type detection

set t_Co=256 " use 256 colors
set ttyfast " fast terminal connection
set number " show number of lines
set tabstop=4

colorscheme tir_black


" skeletons
function! SKEL_spec()
	0r /usr/share/vim/current/skeletons/skeleton.spec
	language time en_US
	if $USER != ''
	    let login = $USER
	elseif $LOGNAME != ''
	    let login = $LOGNAME
	else
	    let login = 'unknown'
	endif
	let newline = stridx(login, "\n")
	if newline != -1
	    let login = strpart(login, 0, newline)
	endif
	if $HOSTNAME != ''
	    let hostname = $HOSTNAME
	else
	    let hostname = system('hostname -f')
	    if v:shell_error
		let hostname = 'localhost'
	    endif
	endif
	let newline = stridx(hostname, "\n")
	if newline != -1
	    let hostname = strpart(hostname, 0, newline)
	endif
	exe "%s/specRPM_CREATION_DATE/" . strftime("%a\ %b\ %d\ %Y") . "/ge"
	exe "%s/specRPM_CREATION_AUTHOR_MAIL/" . login . "@" . hostname . "/ge"
	exe "%s/specRPM_CREATION_NAME/" . expand("%:t:r") . "/ge"
	setf spec
endfunction
autocmd BufNewFile	*.spec	call SKEL_spec()
" filetypes
filetype plugin on
filetype indent on

set ignorecase
set smartcase

set incsearch
set hlsearch

set rtp+=~/.vim/vundle.git/ 
call vundle#rc()

" unimpaired brackets
Bundle "unimpaired.vim"

" filesystem navigation
Bundle "The-NERD-tree"
map <F2> :NERDTreeToggle<cr>

" autocomplete on search
Bundle "SearchComplete"

" Delete/change/add parentheses/quotes/XML-tags/much more with ease
Bundle "surround.vim"

" provide tab completion to satisfy all your insert completion needs (:help ins-completion)
Bundle "SuperTab"

" Source code browser (supports C/C++, java, perl, python, tcl, sql, php, etc)
Bundle "taglist.vim"

" ~/.vimrc ends here
