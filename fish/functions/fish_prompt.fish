function fish_prompt

    printf '%s%s@%s%s %s%s $%s ' \
        (set_color $fish_color_user) $USER \
        (set_color $fish_color_host) "mbp" \
        (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
end
