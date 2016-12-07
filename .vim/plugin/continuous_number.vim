
command! -count -nargs=1 ContinuousNumber let c = col('.')| for n in range(1, <count>?<count>-line('.'):1) |exec 'normal! j' . n . <q-args>| call cursor('.', c)|endfor

