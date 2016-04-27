# in gdb, run "show history"

# save on exit
set history save
# always save to the same file so it would not write everywhere
set history filename ~/.gdb_history
# does not understand "unlimited" in gdb 5.x?
set history size 10000
# remove-duplicates is not supported in gdb 5.x?
#set history remove-duplicates unlimited
# no idea
set history expansion on
#set history on

