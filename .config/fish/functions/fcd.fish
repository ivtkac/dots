function fcd --description "Interactive cd buffed with fzf" --wraps "cd"
  if is_empty $argv
     set exclude_pattern "{cache,epiphany,.git,.var,.cache,Trash,evolution,flatpak}"
     set selected_dir (fd . --hidden --type directory --exclude "$exclude_pattern" | fzf --height 40% --preview 'tree -C {} | head -200' --preview-window=right:50%:wrap)
     if test -n "$selected_dir"
	builtin cd $selected_dir
	return 0
     else
	return 1
     end
  end
end
