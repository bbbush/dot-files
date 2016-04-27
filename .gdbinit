# in gdb, run "show history"

# save on exit
set history save
# always save to the same file so it would not write everywhere
set history filename ~/.gdb_history
# does not understand "unlimited" in gdb 5.x?
set history size 1000000
# remove-duplicates is not supported in gdb 5.x?
#set history remove-duplicates unlimited
# "History expansion assigns special meaning to the character !"
# ftp://ftp.gnu.org/old-gnu/Manuals/gdb/html_node/gdb_182.html
#set history expansion on

