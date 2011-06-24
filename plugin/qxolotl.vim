" qxolotl - A Vim plugin to open quickfix entries in source window.
" Barry Arthur  June 24, 2011

function! s:Qxolotl_BufferDance()
  if winnr() != t:qxolotl_src_winnr
    let t:qxolotl_bufnr = bufnr('%')
    b #
    exe t:qxolotl_src_winnr . "wincmd w"
    exe t:qxolotl_qfx_winnr . "wincmd w"
    wincmd p
    exe "b " . t:qxolotl_bufnr
    norm! `"
  endif
endfunction

function! s:Qxolotl_BufReadPost()
  let t:qxolotl_src_winnr = winnr('#')
  let t:qxolotl_qfx_winnr = winnr()
  nnoremap <buffer> <CR> <CR><bar>:call <SID>Qxolotl_BufferDance()<CR>
endfunction

augroup Qxolotl
  au!
  au BufReadPost quickfix call <SID>Qxolotl_BufReadPost()
augroup END
