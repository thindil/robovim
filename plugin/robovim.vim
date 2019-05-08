" Robodoc support for Vim
" Maintainer: Bartek Jasicki <thindil@laeran.pl>
" Last Change:  2019-05-07
" License: GPLv3
if exists('g:robovim')
   finish
endif
let g:robovim = 1

" ****f* robovim/fun
" FUNCTION
" Set all plugin properties - package name, header, footer and remark marks.
" SOURCE
fun s:set_props()
" ****
   let b:filetype = &ft
   let b:header_type = 1 " 1 for normal headers, 2 for internal headers
   let b:search_for = '' " Search criteria to find line with package name
   "Ada ------------------------------
   if b:filetype == 'ada'
      let b:header_mark = '-- ****'
      let b:remark_mark = '--'
      let b:end_mark = '-- ****'
      let b:search_for = 'package'
      let b:result_index = 1
      if expand('%:e') == 'adb'
         let b:header_type = 2
         let b:result_index = 2
      endif
   " Vim ------------------------------
   elseif b:filetype == 'vim'
      let b:header_mark = '" ****'
      let b:remark_mark = '"'
      let b:end_mark = '" ****'
   " Others ---------------------------
    else
      let b:header_mark = '/* ****'
      let b:remark_mark = '*'
      let b:end_mark = '**** */'
    endif
    let b:package_name = expand('%:t:r')
    if b:search_for != ''
      let l:line = search(b:search_for, 'bcn')
      if l:line != 0
         let b:package_name = split(getline(l:line))[b:result_index]
      endif
    endif
    if exists('b:set_package_name')
       let b:package_name = b:set_package_name
    endif
endfun

" ****f* robovim/add_header
" FUNCTION
" Add proper header to currently selected element (from cursor position),
" before that element.
" PARAMETERS
" headertype - One letter used to set Robodoc header type
" SOURCE
fun s:add_header(headertype)
" ****
   call s:set_props()
   let l:headertype = a:headertype
   if b:header_type == 2
      let l:headertype = 'i'.a:headertype
   endif
   let l:header = [ b:header_mark.l:headertype.'* '.b:package_name.'/'.expand("<cword>"),
      \ b:remark_mark.' FUNCTION',
      \ b:remark_mark,
      \ b:remark_mark.' SOURCE' ]
   call append(line('.') - 1, l:header)
endfun

" ****f* robovim/add_footer
" FUNCTION
" Append after selected element Robodoc footer
" SOURCE
fun s:add_footer()
" ****
   call s:set_props()
   call append(line('.'), b:end_mark)
endfun

" ****f* robovim/set_packagename
" FUNCTION
" Set custom package name for the buffer (if argument is supplied), otherwise
" reset custom package name
" PARAMETERS
" a:1 - new custom package name or no parameters at all
" SOURCE
fun s:set_packagename(...)
" ****
   if a:0 == 1
      let b:set_package_name = a:1
   else
      unlet b:set_package_name
   endif
endfun

command! -nargs=1 Roboheader call s:add_header(<f-args>)
command! Robofooter call s:add_footer()
command! -nargs=? Robopackage call s:set_packagename(<f-args>)